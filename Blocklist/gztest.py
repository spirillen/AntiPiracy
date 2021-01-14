import re
import urllib.request
import gzip

target_url = 'http://list.iblocklist.com/?list=ydxerpxkpcfqjaybcssw&fileformat=cidr&archiveformat=gz'

for line in fileinput.FileInput(urllib.request.urlopen(target_url).openhook=fileinput.hook_compressed)
    print(line.decode('utf-8'))    