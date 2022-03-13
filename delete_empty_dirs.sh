#!/bin/bash
#	This script accepts a directory path as argument, and deletes any
#	empty directory inside it.
#
#	Usage: ./check_dirs.sh path-to-the-directory
#

# for d in ~/Documents/Zoom/*; do
for d in "$@"; do  #$@ takes all the input arguments 
	if [ "$(ls -A "$d")" ]; then	# check if the folder is empty
	  echo "$d is not empty and contains following files: "
	  cd "$d"
	  ls
	  read -p "Do you want to delete all these files in $d ?[y/n]:" response
	  if [ $response == [yY] ]; then
	  	rm -r "$d"	#delete all files in the folder and remove the folder
	  	echo "***All files in $d are deleted***"
	  fi	
	else
		echo "$d is empty"
		rm -d "$d"	# remove the empty folder
		echo "---$d is deleted---"
	fi	
done