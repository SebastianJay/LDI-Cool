from TAC_serialize import *

def getRead(inst):
    res = None
    if isinstance(inst, TACOp):
        res = [inst.op1]
        if isinstance(inst,TACOp2):
            res.append(inst.op2)
    elif isinstance(inst, TACAssign):
        res = [inst.assignor]
    elif isinstance(inst, TACCall):
        res = [inst.op1] # TODO: Multiple method arguments?
    elif isinstance(inst, TACReturn):
        res = [inst.retval]
    elif isinstance(inst, TACBT):
        res = [inst.cond]
    return res

def getWritten(inst):
    res = None

    # Could use hasattr(inst, 'assignee') but identical names not guaranteed
    if isinstance(inst, TACOp):
        res = inst.assignee
    elif isinstance(inst, TACAssign):
        res = inst.assignee
    elif isinstance(inst, TACDeclare):
        res = inst.assignee
    elif isinstance(inst, TACCall):
        res = inst.assignee
    return res


def localLiveCheck(block):
    liveIn = set(block.liveOut)

    # Iterate backwards over instructions
    for inst in reversed(block.instructions):
        # Killed when assigned
        killed = getWritten(inst)
        if killed is not None and killed in liveIn:
            liveIn.remove(killed)

        # Live when used
        used = getRead(inst)
        if used is not None:
            # Currently at most two per instruction,
            # but this makes changing instructions easier
            for r in used:
                liveIn.add(r)

    block.liveIn = liveIn

def globalLiveCheck(graph):
    # Reset liveness info
    for block in graph.blocks:
        block.liveIn = set()
        block.liveOut = set()

    # Recheck liveness until nothing changes
    done = False
    while not done:
        done = True

        # Iterate over blocks backwards, will usually
        # then start at end of program and go back
        for block in reversed(graph.blocks):
            # Update the block's liveIn
            localLiveCheck(block)

            # Propogate liveness to parents
            for parent in block.parents:
                # If something changed, not done
                if parent.updateLiveOut():
                    done = False



def localDeadRemove(block):
    live = set(block.liveOut)
    deadLines = []
    killind = 0
    for ind, inst in enumerate(reversed(block.instructions)):
        killed = getWritten(inst)
        used = getRead(inst)

        # Instruction dead if assignee not live
        if killed is not None and killed not in live:
            # If it's a call, replace the dead var with __dead__
            if isinstance(inst,TACCall):
                block.instructions[len(block.instructions)-ind-1].assignee = "__dead__"

            # Othewise remove the instruction
            else:
                # List is reversed, remove instruction at len-ind
                deadLines.append(len(block.instructions)-ind-1)
                continue

        # If instruction not dead, update liveness info
        if killed is not None and killed in live:
            live.remove(killed)

        if used is not None:
            for x in used:
                live.add(x)

    # Remove marked dead lines
    block.instructions = [x for ind,x in enumerate(block.instructions)
                          if ind not in deadLines]


    # Update liveness info
    block.liveIn = live

def globalDeadRemove(graph):
    done = False
    while not done:
        done = True
        # Start by generating liveness info for the whole graph
        globalLiveCheck(graph)

        for block in reversed(graph.blocks):
            localDeadRemove(block)
            # Update parents' liveOut
            for parent in block.parents:
                if parent.updateLiveOut():
                    done = False
            # If something changed, we need to start over
            if not done:
                break



if __name__ == "__main__":
    debug = "-v" in sys.argv

    with open(sys.argv[1]) as inFile:
        graph = serializeTAC(inFile)

    if debug:
        print graph.verbosestr()
        print "========================"
        globalDeadRemove(graph)
        print graph.verbosestr()
    else:
        globalDeadRemove(graph)
        print graph
