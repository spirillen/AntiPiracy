#!/usr/bin/env bash
bash 'Blocklist/cidr_update.sh'
bash 'Blocklist/update.sh'

git config --local user.name "${GIT_NAME}"
git config --local user.email "${GIT_EMAIL}"

git add -A .
git status
git commit -m "AntiPiracy list updated: `date '+%d. %B %Y %H:%M %Z'`"
git push -u origin master

#exit 0
