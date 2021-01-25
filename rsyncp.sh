#!/bin/bash
###############################################################################
# Description:	Sync from 'rog' to 'EeePC' PC with profils files.
# Input:	- Profile file name with 2 lines:
#		- Line 1: Major version, ex v1
#		- Line 2: rsync command-line arguments
#		- Line 3: Source sync (folder or file, ssh or not)
#		- Line 4: Destination sync (folder, ssh or not)
#
# Output:	- Rsync trace with sync perf (--progress)
#		- Delete option is activated
#
# 2021-01-12:	Created
# 2021-01-13:	Fix home user conflict - Special Thx to my friend Thierry ;)
#		Start multi profile arg 
# 2021-01-23:	Version 1.0 with 4 lines in profile file:
#		- Line 1: Major version, ex v1
#		- Line 2: rsync command-line arguments
#		- Line 3: Source sync (folder or file, ssh or not)
#		- Line 4: Destination sync (folder, ssh or not)
#
#
# Coded by:	JC_onLine
###############################################################################

echo "Rsyncp is a 'Rsync wrapper': Adding 'p' like 'profile', because this script use a profile command-line files."
echo ""

# Sync defintion function:
function go_to_sync() {
	local app_dir
	app_dir=$(pwd)
	version=$(sed -n '1 p' $1)
	rsync_parameters=$(sed -n '2 p' $1)
	rsync_source=$(sed -n '3 p' $1)
	rsync_destination=$(sed -n '4 p' $1)
	echo "Profile file    :  $1"
	echo "  Major version :  $version"
	echo "  Parameters    :  $rsync_parameters"
	echo "  Source        :  $rsync_source"
	echo "  Destination   :  $rsync_destination"
	cd ~
	#rsync -a --delete --progress $rsync_source $rsync_destination
	rsync $rsync_parameters $rsync_source $rsync_destination
	cd $app_dir
	echo ""
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
			# uncomment for debug
			#echo "-> $profile is a file"
			go_to_sync $profile
		else
			echo "/!\ $profile is a NOT file: Skip it!"
		fi  
	done
fi
echo ""

