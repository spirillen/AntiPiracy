#!/usr/bin/env python3.9
# -*- coding: utf-8 -*-

"""
[summary]
This program should be able to open a number of files with ip-address
in any notations and output them in a valid ip-addr/CIDR.

The finished results, should be a uniq ip/cidr list

By default print only non private address (ipaddress.is_global), RFC:1918
RFC:5735

https://docs.python.org/3/library/ipaddress.html#ipaddress.IPv4Address.is_global

Example of ip layouts in read-in
172.16.0.1
172.16.0.1-172.31.255.254
172.16.0.1 - 172.31.255.254
172.16.0.1/255.240.0.0
172.16.0.0/12

Also support the same for IPv6
"""

ROOT_DIR="$(git rev-parse --show-toplevel)"

import re
import urllib.request
import gzip
import os
import io
from collections import OrderedDict
import ipaddress

target_url = 'http://list.iblocklist.com/?list=ydxerpxkpcfqjaybcssw&fileformat=cidr&archiveformat=gz'

cidr = [ ]


with gzip.open('$ROOT_DIR/Blocklist/cidr.gz', 'rb') as ip:
        with io.TextIOWrapper(ip, encoding='utf-8') as decoder:
            # Let's read the content using read()
            content = decoder.read()
            cidr.append(content.rstrip('\n'))

with gzip.open('$ROOT_DIR/Blocklist/level1.gz', 'rb') as ip2:
        with io.TextIOWrapper(ip2, encoding='utf-8') as decoder2:
            # Let's read the content using read()
            content1 = decoder2.read()
            cidr.append(content1.rstrip('\n'))

with gzip.open('$ROOT_DIR/Blocklist/level2.gz', 'rb') as ip3:
        with io.TextIOWrapper(ip3, encoding='utf-8') as decoder3:
            # Let's read the content using read()
            content2 = decoder3.read()
            cidr.append(content2.rstrip('\n'))

with gzip.open('$ROOT_DIR/Blocklist/level3.gz', 'rb') as ip4:
        with io.TextIOWrapper(ip4, encoding='utf-8') as decoder4:
            # Let's read the content using read()
            content3 = decoder4.read()
            cidr.append(content3.rstrip('\n'))

res = list(OrderedDict.fromkeys(cidr))
#for element in res:
#    print(str(element))

with open('$ROOT_DIR/Blocklist/torrent.cidr', 'w') as new_file:
        for element in res:
            new_file.write(str(element))



"""
TODO:
Setup args for
-f open files x y z
-o write to file x
-h | --help print help on screen

"""

"""
Sources for learning this script

open file and read as variable:
https://www.computerhope.com/issues/ch001721.htm
https://docs.python.org/3/library/functions.html#open

ipaddress: https://docs.python.org/3/library/ipaddress.html
"""