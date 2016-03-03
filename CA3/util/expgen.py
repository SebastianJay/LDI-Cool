import random

rules = [
    'E+E',
    'E-E',
    'E*E',
    'E/E',
    '~E',
    '(E)'
]

closeProb = .3
maxint = 65556
maxits = 100

e = 'E'
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
        
print 'out_int(' + e + ');'
