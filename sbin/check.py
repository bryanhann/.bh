import sys
import os
for name in sys.argv[1:]:
    #print (name, os.environ.get(name))
    if not os.environ.get(name):
        print '    ******** undefined: $' + name
