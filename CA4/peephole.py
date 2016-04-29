from asmgen import *
def peephole(ins):
    i = 0
    while i < len(ins): 
        if i >= 2:
            if isinstance(ins[i-2], ASMOp) and ins[i-2].opcode == 'not':
                if isinstance(ins[i], ASMBT) and ins[i].cond == ins[i-2].assignee:
                    ins[i].invert()
                    ins = ins[:i-2] + ins[i-1:]
                    i-=1

        i+=1

    return ins

