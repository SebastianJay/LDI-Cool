import random

def expgen(start='E', closeProb = .3):
    rules = [
        'E+E',
        'E-E',
        'E*E',
        'E/E',
        '~E',
        '(E)'
    ]
    
    maxint = 65556
    maxits = 100

    e = start
    olde = ''
    its = 0
    while olde != e:
        olde = e
        ne = e
        for i,x in enumerate(e):
            if x == 'E':
                if random.random() < closeProb or its > maxits:
                    ne = e[:i] + str(random.randint(0, maxint)) + e[i+1:]
                else:
                    ne = e[:i] + random.choice(rules) + e[i+1:]
        e = ne
        its+=1
    return e
        
if __name__ == "__main__":
    print 'out_int(' + expgen() + ');'
