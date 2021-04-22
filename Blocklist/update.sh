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

wget -qO- 'https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/p2p/extra.txt' | grep -vE '^(#|$)' >> WindowsSpyBlocker.txt

wget -qO- 'https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/p2p/spy.txt' | grep -vE '^(#|$)' >> WindowsSpyBlocker.txt

wget -qO- 'https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/p2p/update.txt' | grep -vE '^(#|$)' >> WindowsSpyBlocker.txt

## Let's combine and sort the list to our own

cat 'antip2p.p2p' 'Bluetack_level1.p2p' 'Bluetack_level2.p2p' \
    'Bluetack_level3.p2p' 'WindowsSpyBlocker.txt' | \
    sort -u > "${ROOT_DIR}/docs/torrent.p2p"

## Copy to public
cd "${ROOT_DIR}/docs/"

gzip -k -9 -f torrent.p2p

## Cleanup


#rm "${ROOT_DIR}/Blocklist/Bluetack_level1.p2p" \
#  "${ROOT_DIR}/Blocklist/Bluetack_level2.p2p" \
#  "${ROOT_DIR}/Blocklist/Bluetack_level3.p2p" \
#  "${ROOT_DIR}/Blocklist/antip2p.p2p" \
rm "${ROOT_DIR}/Blocklist/WindowsSpyBlocker.txt"

cd "${ROOT_DIR}"
