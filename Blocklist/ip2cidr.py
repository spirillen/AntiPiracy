#!/usr/bin/python3.9
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

import os
import gzip
from urllib.request import urlopen

#with gzip.open('http://list.iblocklist.com/?list=ydxerpxkpcfqjaybcssw&fileformat=cidr&archiveformat=gz', 'rb') as input:  # Open lorem.txt for reading text
#    for contents in input:
#        #contents = myfile.read()              # Read the entire file to a string
#        print(contents)                           # Print the string


data = urlopen('http://list.iblocklist.com/?list=ydxerpxkpcfqjaybcssw&fileformat=cidr&archiveformat=gz').read().gzip.open()
for input in data:
    print(input)





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