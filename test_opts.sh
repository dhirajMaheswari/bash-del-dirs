#!/bin/bash

# this script allows you to pass a path as command line argument and 
# count the number of folders and files in it.

function help()
{
    echo "Usage: $0 [ -p | --path ]
               [ -h | --help  ]"
    echo "'path' is the path to the folder you want to work on"           
    exit 2
}



SHORT=p:,h
LONG=path:,help
OPTS=$(getopt -a --options $SHORT --longoptions $LONG -- "$@")

 no_of_args=$#
# echo $no_of_args

if [ $no_of_args -eq 0 ]; then
	echo "***Missing arguments***"
  help
fi



eval set -- "$OPTS"

while :
do
	case "$1" in
		-p | --path)
		path="$2"
		shift 2
			;;
		-h | --help)
		help
		;;
		--)
		break
		;;
		*) echo "Unexpected option $1"
	esac
done


function count_folders(){
	d="$(find "$path" -type d | wc -l)"
	echo $d
	# return $d;
}

function count_files(){
	d="$(find "$path" -type f | wc -l)"
	echo $d/

	# return $d;
}

foc=$(count_folders)
filesc=$(count_files)
echo "In $path, we have the following contents:"
echo "Number of Folders --> $(($foc-1))"
echo "Number of files --> $filesc"
