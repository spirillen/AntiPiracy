import re
import urllib.request
import gzip
import os
import io

target_url = 'http://list.iblocklist.com/?list=ydxerpxkpcfqjaybcssw&fileformat=cidr&archiveformat=gz'

cidr = [ ]

name = 'cidr.gz'
bluetack_level1 = 'level1.gz'
bluetack_level2 = 'level2.gz'
bluetack_level3 = 'level3.gz'

with gzip.open('cidr.gz', 'rb') as ip:
        with io.TextIOWrapper(ip, encoding='utf-8') as decoder:
            # Let's read the content using read()
            content = decoder.read()
            cidr.append(content.rstrip('\n'))

with gzip.open('level1.gz', 'rb') as ip2:
        with io.TextIOWrapper(ip2, encoding='utf-8') as decoder2:
            # Let's read the content using read()
            content1 = decoder2.read()
            cidr.append(content1.rstrip('\n'))

with gzip.open('level2.gz', 'rb') as ip3:
        with io.TextIOWrapper(ip3, encoding='utf-8') as decoder3:
            # Let's read the content using read()
            content2 = decoder3.read()
            cidr.append(content2.rstrip('\n'))

with gzip.open('level3.gz', 'rb') as ip4:
        with io.TextIOWrapper(ip4, encoding='utf-8') as decoder4:
            # Let's read the content using read()
            content3 = decoder4.read()
            cidr.append(content3.rstrip('\n'))


for element in cidr:                     # For each element in the list,
    print(element)