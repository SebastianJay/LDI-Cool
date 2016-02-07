from TAC_serialize import *

def localLiveCheck(block):
    liveIn = set(block.liveOut)
    
    # Iterate backwards over instructions
    for inst in reversed(block.instructions):
        # Killed when assigned
        if isinstance(inst, TACOp):
            liveIn.remove(inst.assignee)
        elif isinstance(inst, TACAssign):
            liveIn.remove(inst.assignee)
        elif isinstance(inst, TACDeclare):
            liveIn.remove(inst.assignee)
        elif isinstance(inst, TACCall):
            liveIn.remove(inst.assignee)


        # Live when used
        if isinstance(inst, TACOp):
            liveIn.add(inst.op1)
            if isinstance(inst,TACOp2):
                liveIn.add(inst.op2)
        elif isinstance(inst, TACAssign):
            liveIn.add(inst.assignor)
        elif isinstance(inst, TACCall):
            liveIn.add(inst.op1) # TODO: Multiple method arguments?
        elif isinstance(inst, TACReturn):
            liveIn.add(inst.retval)
        elif isinstance(inst, TACBT):
            liveIn.add(inst.cond)

    return liveIn

def globalLiveCheck(graph):
    # Recheck liveness until nothing changes
    done = False
    while not done:
        # Done until proven otherwise
        done = True

        # Iterate over blocks backwards,
        # avoids starting at beginning and taking n iterations, 
        # gives chance to finish in one iteration (plus done check)
        for block in reversed(graph.blocks):
            liveIn = localLiveCheck(block)
            # Propogate liveness to parents
            for parent in block.parents:
                nLiveOut = parent.liveOut | liveIn
                # If something changed, not done
                if not parent.liveOut == nLiveOut:
                    parent.liveOut = nLiveOut
                    done = False
    

if __name__ == "__main__":
    graph = serializeTAC(sys.stdin)
    globalLiveCheck(graph)
    print graph.verbosestr()
