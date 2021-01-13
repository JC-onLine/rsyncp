#! /bin/bash
###############################################################################
# Description:	Sync from 'rog' to 'EeePC' PC with profils files.
# Input:	- Profil file name with 2 lines:
#			- Line 1: Source folder (ssh or not)
#			- Line 2: Destination folder (ssh or not)
#
# Output:	- Rsync trace with sync perf (--progress)
#		- Delete option is activated
#
# 2021-01-12:	Created
# 2021-01-13:	Fix home user conflict - Special Thx to my friend Thierry ;)
#		Start multi profil arg 
#
# Coded by:	JC_onLine
###############################################################################

echo "rog to eeepc:"

# Sync function defintion:
go_to_sync() {
	origin=$(sed -n '1 p' $1)
	target=$(sed -n '2 p' $1)
	echo "--------"
	echo $profil
	echo "$origin"
	echo "$target"
	cd ~
	#rsync -a --delete --progress $origin $target
}

# Main app
if [$# -eq 0]
then
	echo "Please select profil file name arg."
	echo "Usage: $0 profil1 profil2 profile3 ..."
else
	for profil in $@ ; do
		go_to_sync profil
	done
fi

