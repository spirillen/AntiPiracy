#!/usr/bin/env bash

bash 'Blocklist/update.sh'

git add -A .
git status
git commit -m "AntiPiracy list updated: `date '+%d. %B %Y %H:%M %Z'`"
git push -u origin master

#exit 0
