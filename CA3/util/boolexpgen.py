from expgen import  expgen

import random
from string import ascii_lowercase


def boolexpgen():
    irules = [
        'if I then\n\tI\nelse\n\tI\nfi'
    ]
    vrules = [
        'not (V)',
        '(E) < (E)',
        '(E) <= (E)',
        '(E) = (E)',
    ]
    
    closeProb = .2
    maxint = 65556
    maxits = 100

    e = 'if I then \nout_int(1) \nelse\nout_int(0)\nfi'
    olde = ''
    its = 0
    while olde != e:
        olde = e
        ne = e
        for i,x in enumerate(e):
            if x == 'I':
                if (random.random() < closeProb and its != 0) or its > maxits:
                    ne = e[:i] + 'V' + e[i+1:]
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
                if its > maxits:
                    ne = e[:i] + random.choice(vrules[1:]) + e[i+1:]
                else:
                    ne = e[:i] + random.choice(vrules) + e[i+1:]
        e = ne
        its+=1

    return expgen(e, .3)

if __name__ == "__main__":
    print "class Main inherits IO { main():Object {\nlet " + ': Int <- in_int(), '.join(ascii_lowercase) + ": Int <- in_int() in "
    print boolexpgen()
    print "};};"
    

    
