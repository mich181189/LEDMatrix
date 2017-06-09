import httplib
import json
import math
import time
import serial
import sys

port = serial.Serial(sys.argv[1], 115200, timeout=1)

url = "http://data.cnn.com/jsonp/interactive/2017/uk-election-results/uk-totals-results.json"

def getData():
    conn = httplib.HTTPConnection("data.cnn.com")
    conn.request("GET", "/jsonp/interactive/2017/uk-election-results/uk-totals-results.json?req="+str(int(math.floor(time.time()))))
    r = conn.getresponse()
    data = r.read()
    j = json.loads(data[16:-2])
    return j

def parseResult(abrev, data):
    if abrev in data['sopCalc']['results']:
        return int(data['sopCalc']['results'][abrev]['totalSeats'])
    return 0

def parseData(data):
    lab = parseResult('Lab',data)
    con = parseResult('C',data)
    ukip = parseResult('UKIP',data)
    green = parseResult('Green',data)
    libdem = parseResult('LD',data)
    return [lab,con,ukip,green,libdem]

def parseAbreviations(data):
    for party in data['parties']:
        print party['name'] + ":" + party['abbreviation']


while True:
    res = parseData(getData())
    port.write([0xff,])
    port.write(bytearray(res))
    port.flush()
    for line in port.readlines():
        print line+"\n"
    print "Sent: ",res
    print "sleeping..."
    time.sleep(60)