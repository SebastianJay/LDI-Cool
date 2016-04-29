import deadcode
import TAC_serialize

# Takes a control flow graph, returns a register conflict graph
# with some precolored nodes on function returns
# of form temp => [set of conflicts, color(default to -1)]
def genRegGraph(cfg):
    regGraph = {"t0":[set(),0]}

    # Return reg and fake parameter regs
    preColor = {"t0":0}
    params = ['p1','p2','p3','p4','p5','p6','p7','p8']
    paramRegs = [1,2,3,4,5,6,7,8]
    for i, v in enumerate(params):
        regGraph[v]=[set(),paramRegs[i]]
        preColor[v] = paramRegs[i]
    
    deadcode.globalLiveCheck(cfg)
    for block in cfg.blocks:
        live = set(block.liveOut)
        debugOut = []
        # Update graph connections
        for t in live:
            if t not in regGraph:
                regGraph[t] = [set(),-1]
            for r in live:
                if r != t:
                    regGraph[t][0].add(r)


        for inst in reversed(block.instructions):
            # Killed when assigned
            killed = deadcode.getWritten(inst)
            if killed is not None and killed in live:
                live.remove(killed)
                if killed not in regGraph:
                    regGraph[killed] = [set(), -1]


            # Live when used
            used = deadcode.getRead(inst)
            if used is not None:
                for r in used:
                    live.add(r)

            # Update graph connections
            for t in live:
                if t not in regGraph:
                    regGraph[t] = [set(), -1]
                for r in live:
                    if r != t:
                        regGraph[t][0].add(r)
                if killed is not None and t != killed:
                    regGraph[t][0].add(killed)
                    regGraph[killed][0].add(t)

            # Everything conflicts with %rdx
            for l in live:
                regGraph[l][0].add('p3')

            if isinstance(inst, TAC_serialize.TACCall):
               # # Precolor parameters dead after the call to their register
               # for i, reg in enumerate(inst.args[:5]):
               #     if reg.getName() not in live:
               #         if reg.getName() not in regGraph:
               #             regGraph[reg.getName()] = [set(), paramRegs[i]]
               #        regGraph[reg.getName()][1] = paramRegs[i]
               #         preColor[reg.getName()] = paramRegs[i]

                # Everything live after a call conflicts with call registers
                for l in live:
                    for p in params:
                        regGraph[l][0].add(p)
                        # Reset precoloring on conflicting registers
                        if regGraph[l][1] == preColor[p]:
                            regGraph[l][1] = -1
                            del preColor[l]

                # Also, dynamic dispatch reg conflicts with params
                if isinstance(inst.funcname, TAC_serialize.TACRegister):
                    if inst.funcname.name not in regGraph:
                        regGraph[inst.funcname.name] = [set(),-1]
                    for p in params:
                        regGraph[inst.funcname.name][0].add(p)

            # Compares are sometimes calls
            if (isinstance(inst, TAC_serialize.TACCompare) and inst.ptype in ['Object', 'String']) or \
                    (isinstance(inst, TAC_serialize.TACAllocate) and (inst.ptype == 'String' or inst.allop == 'new')):

                # Everything live after a call conflicts with call registers
                for l in live:
                    for p in params:
                        regGraph[l][0].add(p)
                        # Reset precoloring on conflicting registers
                        if regGraph[l][1] == preColor[p]:
                            regGraph[l][1] = -1
                            del preColor[l]

            # Allocate accumulator to return val of a function
            #TODO review TACClassAttr - probably change tacgen so that it never shows up here
            if isinstance(inst,TAC_serialize.TACCall):
                regGraph[inst.assignee.getName()][1] = 0
                preColor[inst.assignee.getName()] = 0

            # Return value needs to go into rax
            if isinstance(inst,TAC_serialize.TACReturn):
                if isinstance(inst.retval, TAC_serialize.TACRegister):
                    regGraph[inst.retval.name][1] = 0
                    preColor[inst.retval.name] = 0
                elif isinstance(inst.retval, TAC_serialize.TACClassAttr):
                    regGraph[inst.retval.reg.name][1] = 0
                    preColor[inst.retval.reg.name] = 0

            # Have to force multiplication and division result to rax
            elif isinstance(inst,TAC_serialize.TACOp2) and inst.opcode in ['*','/']:
                regGraph[inst.assignee.getName()][1] = 0
                preColor[inst.assignee.getName()] = 0
            
            # Malloc is a call, returns in rax
            elif isinstance(inst,TAC_serialize.TACMalloc):
                if isinstance(inst.assignee, TAC_serialize.TACRegister):
                    regGraph[inst.assignee.name][1] = 0
                    preColor[inst.assignee.name] = 0
                elif isinstance(inst.assignee, TAC_serialize.TACClassAttr):
                    regGraph[inst.assignee.reg.name][1] = 0
                    preColor[inst.assignee.reg.name] = 0
            # Allocate is somtimes a call, returns in rax in those cases
            elif isinstance(inst,TAC_serialize.TACAllocate):
                if inst.allop == 'new' or inst.ptype == 'Int' or inst.ptype == 'Bool' or inst.ptype == 'String':
                    canColor = True
                    for x in regGraph[inst.assignee.getName()][0]:
                        if regGraph[x][1] == 0:
                            canColor = False
                            break
                    if canColor:
                        regGraph[inst.assignee.getName()][1] = 0
                        preColor[inst.assignee.getName()] = 0
            # Force second argument/result into a register to avoid double memory errors
            elif isinstance(inst,TAC_serialize.TACOp2):
                if isinstance(inst.assignee, TAC_serialize.TACRegister):
                    preColor[inst.op2.name] = -1
                elif isinstance(inst.assignee, TAC_serialize.TACClassAttr):
                    preColor[inst.op2.reg.name] = -1

 #   for x in sorted(regGraph.keys()):
 #       print x, regGraph[x]
 #   print "----"
    for x in sorted(regGraph.keys()):
        for c in sorted(regGraph[x][0]):
            if regGraph[x][1] == regGraph[c][1] and regGraph[x][1] != -1:
                print "Error, register color conflict: ", x,c,regGraph[x][1]
    return regGraph, preColor

def degree(regGraph):
    degrees = {}
    for x in regGraph:
        degrees[x] = len(regGraph[x][0])
    return degrees

# Takes a control flow graph and returns register allocations for each
# temporary value, any register index higher than the allowed should go to memory
# if nregs=0, then perform "dumb spilling", i.e. don't mitigate use of temporaries
def registerAllocate(cfg, nregs):
    regGraph, preColor = genRegGraph(cfg)
    deg = degree(regGraph)

    # Heuristic based coloring, colors nodes in decreasing degree order with no conflicts
    def colorGraph(graph):

        # Use degree order as heuristic for coloring order
        degreeOrder = sorted(graph, key=lambda x: -deg[x])

        for node in degreeOrder:
            # Handle conflicts with pre-colored nodes
            if graph[node][1] != -1:
                continue

            # Eliminate colors of adjacent nodes
            availableColors = set(range(nregs)) # [0,..,maxColor+1]
            for adj in graph[node][0]:
                availableColors -= set([graph[adj][1]])

            if len(availableColors) == 0:
                return False

            # Set color to lowest available
            graph[node][1] = min(availableColors)

        return True

    if nregs != 0:
        maxSpill = 1
        spillMap = {}

        while not colorGraph(regGraph):
            # Reinitialize graph coloring
            for k in regGraph:
                if k in preColor:
                    regGraph[k][1] = preColor[k]
                elif k in spillMap:
                    regGraph[k][1] = spillMap[k]
                else:
                    regGraph[k][1] = -1

            # Spill a temp
            nspill = max([x for x in regGraph if  regGraph[x][1] == -1], key = lambda x: deg[x])
            availableSpills = set(range(nregs+1,nregs+maxSpill+2))

            for adj in regGraph[nspill][0]:
                availableSpills -= set([regGraph[adj][1]])

            spillMap[nspill] = min(availableSpills)

            if spillMap[nspill] == nregs+maxSpill+1:
                maxSpill+=1

            regGraph[nspill][1] = spillMap[nspill]
    else:
        colorGraph(regGraph)

    regMap = {}
    for node in regGraph:
        regMap[node] = regGraph[node][1] 
    return regMap
