#!/bin/bash

workspace="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
[[ -n $1 ]] && comment="$1" || comment="update files"

cd $workspace
git pull
git add .
git commit -m "$comment"
git push
git clean -f -d
exit 0

