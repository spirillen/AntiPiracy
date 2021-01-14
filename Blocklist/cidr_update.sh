#!/usr/bin/env bash
#git remote add origin https://gitlab.com/AnonymousPoster/Torrent.git
#git checkout master

ROOT_DIR="$(git rev-parse --show-toplevel)"

mkdir -p "${ROOT_DIR}/docs"
cd "${ROOT_DIR}/Blocklist/"

wget -qO- 'http://list.iblocklist.com/?list=ydxerpxkpcfqjaybcssw&fileformat=cidr&archiveformat=gz' | gunzip - > 'Bluetack_level1.cidr'

wget -qO- 'http://list.iblocklist.com/?list=gyisgnzbhppbvsphucsw&fileformat=cidr&archiveformat=gz' | gunzip - > 'Bluetack_level2.cidr'

wget -qO- 'http://list.iblocklist.com/?list=uwnukjqktoggdknzrhgh&fileformat=cidr&archiveformat=gz' | gunzip - > 'Bluetack_level3.cidr'

#cat 'Bluetack_level*.cidr' 'torrent.cidr' | sort -u > 'torrent.cidr.tmp' \
#  && mv 'torrent.cidr.tmp' 'torrent.cidr'

$(command python3.9 ${ROOT_DIR}/Blocklist/ip2cidr.py)

wget -qO - 'https://silo.glasz.org/antip2p.list.gz' | gunzip - > 'antip2p.cidr.tmp'

cut -d ':' -f 2 'antip2p.cidr.tmp' > 'antip2p.txt'

## Let's combine and sort the list to our own
cat 'Bluetack_level1.cidr' 'Bluetack_level2.cidr' 'Bluetack_level3.cidr' 'antip2p.txt' | sort -u > "${ROOT_DIR}/docs/torrent.txt"

## Cleanup
rm "${ROOT_DIR}/Blocklist/Bluetack_level1.cidr" \
  "${ROOT_DIR}/Blocklist/Bluetack_level2.cidr" \
  "${ROOT_DIR}/Blocklist/Bluetack_level3.cidr" \
  "${ROOT_DIR}/Blocklist/antip2p.cidr.tmp" \
  "${ROOT_DIR}/Blocklist/antip2p.txt"

cd "${ROOT_DIR}"

#exec "${ROOT_DIR}/Blocklist/update.sh" & exit 0
