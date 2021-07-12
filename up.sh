#!/bin/bash

workspace="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
#repos=$workspace/custom/git

#for repo in `ls $repos`; do
#	echo "updating $repo ..."
#	cd $repos/$repo
#	git pull
#	rsync -av --progress --delete --exclude=.git $repos/$repo/ $workspace/package/70599
#done

# OpenClash
openclash_dir=$workspace/tmp/openclash
openclash_ver=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/tags | grep name | head -n 1 | cut -d '"' -f 4 | sed 's|v||g')
[ -e $openclash_dir ] || mkdir -p $openclash_dir
cd $openclash_dir
[ -e OpenClash-$openclash_ver ] || wget https://github.com/vernesong/OpenClash/archive/refs/tags/v$openclash_ver.tar.gz && tar -xvf v$openclash_ver.tar.gz && rm v$openclash_ver.tar.gz
[ -e $workspace/package/vernesong/luci-app-openclash ] || mkdir -p $workspace/package/vernesong/luci-app-openclash
rsync -av ./OpenClash-$openclash_ver/luci-app-openclash/* $workspace/package/vernesong/luci-app-openclash/

cd $workspace
git pull --recurse-submodules && ./scripts/feeds update -a && ./scripts/feeds install -a && exit 0
