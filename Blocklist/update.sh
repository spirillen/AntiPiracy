#!/usr/bin/env bash
#git remote add origin https://gitlab.com/AnonymousPoster/Torrent.git
#git checkout master

ROOT_DIR="$(git rev-parse --show-toplevel)"

mkdir -p "${ROOT_DIR}/docs"
cd "${ROOT_DIR}/Blocklist/"

wget -qO- 'http://list.iblocklist.com/?list=ydxerpxkpcfqjaybcssw&fileformat=p2p&archiveformat=gz' | gunzip - > 'Bluetack_level1.p2p'

wget -qO- 'http://list.iblocklist.com/?list=gyisgnzbhppbvsphucsw&fileformat=p2p&archiveformat=gz' | gunzip - > 'Bluetack_level2.p2p'

wget -qO- 'http://list.iblocklist.com/?list=uwnukjqktoggdknzrhgh&fileformat=p2p&archiveformat=gz' | gunzip - > 'Bluetack_level3.p2p'

wget -qO - 'https://silo.glasz.org/antip2p.list.gz' | gunzip - > 'antip2p.p2p'

## Let's combine and sort the list to our own
cat 'Bluetack_level1.p2p' 'Bluetack_level2.p2p' 'Bluetack_level3.p2p' | sort -u > ${ROOT_DIR}/docs/torrent.p2p

## Cleanup
rm Bluetack_level*.p2p

cd "${ROOT_DIR}"

git add -A . 
git commit -m "AntiPiracy list updated: `date '+%d. %B %Y %H:%M %Z'`"
#git push -u origin master
