#print 'hello \0'
import sys

# print out strings/comments/freestanding indentifers containing each element of ascii table
#  if guard prevents some chars from being printed
sys.stdout.write('(*')
for i in range(128):
    #if i == 0 or i == 10 or i == 13 or i == 26 or i == 34 or i == 92:
    #    sys.stdout.write('\n')
    #    continue
    #sys.stdout.write('"')
    sys.stdout.write(str(unichr(i)))
    #sys.stdout.write('"')
    sys.stdout.write('\n')
sys.stdout.write('*)')
