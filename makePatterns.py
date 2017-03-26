
from PIL import Image

import sys

im = Image.open(sys.argv[1])
#im.thumbnail(32,16)
print "#include \"patterns.h\""
print ""
print "const char pattern1_r[] = "
print "{"
for y in range(0,32):
    print "\t",
    for x in range(0,64):
        px = im.getpixel((x,y))
        print str(px[0]) + ",",
    print ""
print "};"
print ""
print "const char pattern1_g[] = "
print "{"
for y in range(0,32):
    print "\t",
    for x in range(0,64):
        px = im.getpixel((x,y))
        print str(px[1]) + ",",
    print ""
print "};"
print ""
print "const char pattern1_b[] = "
print "{"
for y in range(0,32):
    print "\t",
    for x in range(0,64):
        px = im.getpixel((x,y))
        print str(px[2]) + ",",
    print ""
print "};"
print ""
