from TAC_serialize import *

def localLiveCheck(block):
    liveIn = set(block.liveOut)
    
    # Iterate backwards over instructions
    for inst in reversed(block.instructions):
        # Live when used, killed when assigned
        # TODO
    
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
    for block in graph.blocks:
        print block.parents
    
