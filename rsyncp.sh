#!/bin/bash
###############################################################################
# Description:	Sync from 'rog' to 'EeePC' PC with profils files.
# Input:	- Profile file name with 2 lines:
#			- Line 1: Source folder (ssh or not)
#			- Line 2: Destination folder (ssh or not)
#
# Output:	- Rsync trace with sync perf (--progress)
#		- Delete option is activated
#
# 2021-01-12:	Created
# 2021-01-13:	Fix home user conflict - Special Thx to my friend Thierry ;)
#		Start multi profile arg 
#
# Coded by:	JC_onLine
###############################################################################

echo "rog to eeepc:"

# Sync function defintion:
function go_to_sync() {
	local internal_profile
	local app_dir
	app_dir=$(pwd)
	internal_profile=$1
	origin=$(sed -n '1 p' $internal_profile)
	target=$(sed -n '2 p' $internal_profile)
	echo "--------"
	echo "$internal_profile"
	echo "$origin"
	echo "$target"
	cd ~
	rsync -a --delete --progress $origin $target
	cd $app_dir
}

# Main application
if [ $# -eq 0 ]; then
	echo "Please select profil file name in arg."
	echo "Usage: $0 profilFile1 profilFile2 profileFile3 ..."
	echo "Profile file organisation:"
	echo "	Line1: Source folder or ssh path."
	echo "	Line2: Destination folder or ssh path."
	echo "Example:"
	echo "	user@ipAdress:~/dev/site"
	echo "	~/dev "
	echo ""
else
	for profile in "$@"; do
		if [[ -f $profile ]]; then
			echo "-> $profile is a file"
			go_to_sync $profile
		else
			echo "/!\ $profile is a NOT file: Skip it!"
		fi  
	done
fi
echo ""

