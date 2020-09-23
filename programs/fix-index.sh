#!/bin/bash
# This script fixes the issue with ||word|| and tries to clean it up

args=$*
file=$1
if [[ -z $file ]]
then
  cat << EOF
  $0 name_of_file 

  will strip the vertical bars and convert to +|

EOF
  exit 0
fi

cat $file |\
sed 's/||||/|| ||/g' |\
sed 's/||\*\*/+/g' |\
sed 's/\*\*||/|/g' |\
sed 's/ ||/ +/g' |\
sed 's/|| /| /g' |\
sed 's/^||/|/g' |\
sed 's/||$/|/g' |\
sed 's/||\([[:punct:]]\)/|\1/g' |\
sed 's/(||/(+/g' |\
sed 's/||)/|)/g'


