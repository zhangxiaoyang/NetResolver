#!/usr/bin/env python

import urllib2
import re
import sys

try:
    url = 'http://bgp.he.net/ip/%s#_dns' % sys.argv[1]
    req = urllib2.Request(url)
    req.add_header('User-Agent', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.8.1.14) Gecko/20080404 (FoxPlus) Firefox/2.0.0.14')
    html = urllib2.urlopen(req).read()
    domains = re.findall(r'<a href="/dns/(.*?)" title="(.*?)">(.*?)</a>', html)
    for i in domains:
        if len(i) == 3 and i[0] == i[2]:
            print i[0]
except:
    print ''
