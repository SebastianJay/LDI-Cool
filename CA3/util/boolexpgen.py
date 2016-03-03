from expgen import  expgen

import random

def boolexpgen():
    irules = [
        'if V then\nI\nelse\nI\nfi',
    ]
    vrules = [
        'not V',
        'E < E',
        'E <= E',
        'E = E',
        'in_int() < E',
        'in_int() <= E',
        'in_int() = E',
        'E < in_int()',
        'E <= in_int()',
        'E = in_int()'
    ]
    
    closeProb = .2
    maxint = 65556
    maxits = 100

    e = 'I'
    olde = ''
    its = 0
    while olde != e:
        olde = e
        ne = e
        for i,x in enumerate(e):
            if x == 'I':
                if (random.random() < closeProb and its != 0) or its > maxits:
                    ne = e[:i] + 'out_int(E)' + e[i+1:]
                else:
                    ne = e[:i] + random.choice(irules) + e[i+1:]
        e = ne
        its+=1
    
    olde = ''
    its = 0
    while olde != e:
        olde = e
        ne = e
        for i,x in enumerate(e):
            if x == 'V':
                ne = e[:i] + random.choice(vrules) + e[i+1:]
        e = ne
        its+=1

    return expgen(e, .4)

if __name__ == "__main__":
    print "class Main inherits IO { main():Object {\n"
    print boolexpgen()
    print "};};"
    

    
