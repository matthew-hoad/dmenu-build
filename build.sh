#! /bin/bash

git clone http://git.suckless.org/dmenu /dmenu
cd /dmenu

# Apply our own patch to change the target build dir
#git apply build_dir.diff

# Get the patch file urls
# Fetch and apply each patch

wget --no-check-certificate -P /dmenu_patches -i /patches.txt

echo "applying patches:\n$(ls -1 /dmenu_patches)"
git apply /dmenu_patches/*
echo "patches applied"


make
make clean install
