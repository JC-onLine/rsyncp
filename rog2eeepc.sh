#! /bin/bash
echo "rog to eeepc:"
origin=$(sed -n '1 p' $1)
target=$(sed -n '2 p' $1)
echo "$origin"
echo "$target"
cd ~
rsync -a --delete --progress $origin $target

