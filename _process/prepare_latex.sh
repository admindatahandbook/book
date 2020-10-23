#!/bin/bash

fail=yes
if [[ "$1" == "force" ]]
then
   fail=no
fi

# check for repo don't run this in master
repo=$(git remote -v| grep push | awk ' { print $2 } ')
echo "Found repo: $repo"
prefix=$(echo $repo | awk -F: ' {print $1 } ')
case $prefix in
  git@github.com)
    baserepo=$(echo $repo | awk -F: ' { print $2 }' )
    ;;
  https)
    baserepo=$(echo $repo | awk -F: ' { print $2 }' | awk -F "/" ' { NM1 = NF - 1 ; print $NM1 "/" $NF }' )
    ;;
esac
echo "  Baserepo: $baserepo"
branch=$(git branch --show-current)
echo "  branch: $branch"

case $baserepo in
    admindatahandbook/book.git)
    case $branch in 
        master)
        fail=yes
        ;;
        *)
        fail=no
        ;;
    esac
    ;;
    *)
    fail=no
    ;;
esac

if [[ "$fail" == "yes" ]]
then   
   echo "Refusing to run without 'force'"
   exit 2
fi

echo " Are you sure?"
read ans

case $ans in
    Yes|YES|yes)
    echo "OK"
    ;;
    *)
    echo "Exiting"
    exit 0
    ;;
esac


# now we are through

tabledest=tables
figuredest=figures

rmext="Rproj json yml md Rmd"
