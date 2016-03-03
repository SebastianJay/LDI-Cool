import random
from string import ascii_lowercase

def expgen(start='E', closeProb = .3):
    rules = [
        'E+E',
        'E-E',
        'E*E',
        'E/12',
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
                    ne = e[:i] + random.choice(ascii_lowercase)+ e[i+1:]
                else:
                    ne = e[:i] + random.choice(rules) + e[i+1:]
        e = ne
        its+=1
    return e
        
if __name__ == "__main__":
    print "class Main inherits IO { main():Object {\nlet " + ': Int <- in_int(), '.join(ascii_lowercase) + ": Int <- in_int() in {"
    for x in range(50):
        dest = random.choice(ascii_lowercase)
        print "\t" + dest + "<-" + expgen('E') + ";"
        print "out_int(" + dest + ");\n"
    
    print "}};};"
