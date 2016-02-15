from sys import stdin
lines = stdin.readlines()
tokens = lines[0].strip().split()

print 'tokens = ('
for tok in tokens:
    print '\t\''+tok+'\','
print ')'
