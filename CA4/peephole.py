from asmgen import *
def peephole(ins):
    i = 0
    while i < len(ins): 
        if i > 3:
            if check(['not', 'any', 'bt'], ins[i-2:i+1]):
                ins[i].invert()
                ins = ins[:i-2] + ins[i-1:]
                i-=1

        if i > 4:
            if check(['comp', 'mov','test','bt'], ins[i-3:i+1]) \
                    and ins[i-2].assignee == ins[i].cond \
                    and ins[i-2].assignor == ins[i-3].assignee:
                if ins[i-3].opcode == '<':
                    ins[i].l = True
                    ins[i].e = False
                    ins[i].g = False
                elif ins[i-3].opcode == '<=':
                    ins[i].l = True
                    ins[i].e = True
                    ins[i].g = False
                elif ins[i-3].opcode == '=':
                    ins[i].l = False
                    ins[i].e = True
                    ins[i].g = False
                ins[i].invert()
                ins = ins[:i-2] + ins[i:]
                i -= 3

        i+=1

    return ins

def check(types, ins):
    if len(types) != len(ins):
        return False
    res = True
    for t, i in zip(types, ins):
        if t == 'any':
            res = True
        elif t == 'op':
            res = isinstance(i, ASMOp)
        elif t == 'bt':
            res = isinstance(i, ASMBT)
        elif t == 'mov':
            res = isinstance(i, ASMAssign)
        elif t in ['+','*','/','-','<','<=','=','~','not']:
            res = isinstance(i, ASMOp) and i.opcode == t
        elif t == 'arith':
            res = isinstance(i, ASMOp) and i.opcode in ['+', '-','*','/']
        elif t == 'comp':
            res = isinstance(i, ASMOp) and i.opcode in ['<','=','<=']
        elif t == 'test':
            res = isinstance(i, ASMCmp)
        else:
            res = False
            

        if not res:
            break

    return res
            


