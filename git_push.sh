#!/usr/bin/env bash

git pull
git add -A .
git status
git commit -am "'$HOSTNAME' `date '+%d. %B %Y %H:%M %Z'`"
git push

exit 0
