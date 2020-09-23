#!/bin/bash
# fix them all

args=$*

if [[ "$1" != "start" ]]
then
  cat << EOF
  $0 start

  will strip the vertical bars and convert to +| of ALL files, replacing them

EOF
  exit 0
fi

fix=$(dirname $0)/fix-index.sh

for arg in $(ls *.Rmd)
do
  printf "%30s" "Processing $arg ..."
   $fix $arg > ${arg}.tmp
   mv ${arg}.tmp $arg
  echo "[done]"
done
  