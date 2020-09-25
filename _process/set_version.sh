#!/bin/bash

# This script will set the version, based on the directories present.
# Directories should be either "vX.Y"  - other directories are ignored for this.

list=""
for arg in $(ls -1d v*)
do 
    dirnum=$(echo $arg | tr -d "v")
    list="$list $dirnum"
done
highest=$(echo "$list" | tr " " "\n" | sort -g | tail -1)

# now fill in the template with the highest version

sed "s/{% version %}/v$highest/g" _process/index.tmpl > index.html

echo v$highest
