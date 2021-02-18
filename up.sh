#!/bin/bash

workspace="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
#repos=$workspace/custom/git

#for repo in `ls $repos`; do
#	echo "updating $repo ..."
#	cd $repos/$repo
#	git pull
#	rsync -av --progress --delete --exclude=.git $repos/$repo/ $workspace/package/70599
#done

cd $workspace
git pull --recurse-submodules && ./scripts/feeds update -a && ./scripts/feeds install -a && exit 0

