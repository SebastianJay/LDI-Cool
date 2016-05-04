from itertools import combinations
from collections import deque
import sys
import re

regRe = '|'.join([

     '%rax', '%eax', '%ax', '%al',
     '%rbx', '%ebx', '%bx', '%bl',
     '%rcx', '%ecx', '%cx', '%cl',
     '%rdx', '%edx', '%dx', '%dl',
     '%rsi', '%esi', '%si', '%sil',
     '%rdi', '%edi', '%di', '%dil',
     '%rbp', '%ebp', '%bp', '%bpl',
     '%rsp', '%esp', '%sp', '%spl',
    '%r8', '%r8d', '%r8w', '%r8b',
    '%r9', '%r9d', '%r9w', '%r9b',
     '%r10', '%r10d', '%r10w', '%r10b',
     '%r11', '%r11d', '%r11w', '%r11b',
     '%r12', '%r12d', '%r12w', '%r12b',
     '%r13', '%r13d', '%r13w', '%r13b',
     '%r14', '%r14d', '%r14w', '%r14b',
     '%r15', '%r15d', '%r15w', '%r15b'
        ]) 
spillRe = r'-\d*\(%rbp\)'
regRe = re.compile(regRe + '|' + spillRe)
if __name__=="__main__":
    if len(sys.argv) < 3 or '-h' in sys.argv or '--help' in sys.argv:
        print "Usage ngrams.py <n> <infile> [<infile> ...]" 
        sys.exit(1)
    ngrams = {}
    for f in sys.argv[2:]:
        with open(f) as infile:
            line = infile.readline()
            while line != '#END INTERNALS\n' and line != '':
                line = infile.readline()
            hist = deque([], int(sys.argv[1]))
            for line in infile:
                if line.strip()[0] == '#':
                    continue
                hist.append(line)
                nstr = ''
                for x in hist:
                    nstr += x
                regs = []
                for reg in regRe.findall(nstr):
                    if reg in regs:
                        continue
                    regs.append(reg)
                
                if nstr not in ngrams:
                    ngrams[nstr] = 1
                else:
                    ngrams[nstr] += 1

                for i in range(1, len(regs)+1):
                    for comb in combinations(regs, i):
                        s = nstr
                        for r in comb:
                            s = s.replace(r, '%reg{:d}'.format(regs.index(r)))

                        if s not in ngrams:
                            ngrams[s] = 1
                        else:
                            ngrams[s] += 1


    for x in sorted(ngrams.items(), key=lambda x: -x[1]):
        print x[1]
        print x[0].replace('\n','\t\n')
                
            
            

