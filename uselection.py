import sys
import struct
import serial
import httplib
import json
import time


port = serial.Serial(sys.argv[1], 115200)


url = "http://data.cnn.com/ELECTION/2016/bop/p.json"

def dostuff():
    data_r = ''
    data_g = ''
    data_b = ''
    conn = httplib.HTTPConnection("data.cnn.com")
    conn.request("GET", "/ELECTION/2016/bop/p.json")
    r = conn.getresponse()
    data = r.read()
    j = json.loads(data)
    dt = 0
    hc = 0
    if j[u'candidates'][0][u'lname'] == u'Trump':
        dt = j[u'candidates'][0][u'evotes']
        hc = j[u'candidates'][1][u'evotes']
    else:
        hc = j[u'candidates'][0][u'evotes']
        dt = j[u'candidates'][1][u'evotes']
    thresh = 270
    dtd = int((dt*32)/270)
    hcd = int((hc*32)/270)
    if dtd > 32:
        dtd = 32
    if hcd > 32:
        hcd = 32
    print("Trump: " + str(dtd) + " Clinton: " + str(hcd))
    for y in range(0,8):
        for x in range(0,32):
            if x >= 32-dtd:
                data_r += struct.pack('B',255)
            else:
                data_r += struct.pack('B',0)
            data_g += struct.pack('B',0)
            data_b += struct.pack('B',0)
    for y in range(0,8):
        for x in range(0,32):
            if x >= 32-hcd:
                data_b += struct.pack('B',255)
            else:
                data_b += struct.pack('B',0)
            data_g += struct.pack('B',0)
            data_r += struct.pack('B',0)
    port.write(data_r)
    port.write(data_g)
    port.write(data_b)
    port.flush()

while True:
    dostuff()
    time.sleep(60)