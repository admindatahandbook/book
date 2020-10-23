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

builddir=_latex
tabledest=tables
figuredest=figures

cpdirs="figures tables includes"
cpext="tex bib bst"
cpfiles="_build_pdf.sh programs/pdf_to_grayscale.sh"

[ -d $builddir ] && rm -rf $builddir
mkdir $builddir
mkdir $builddir/programs

for dir in $cpdirs
do
  cp -a $dir $builddir/
done

for ext in $cpext
do 
  cp *.${ext} $builddir/
done

for file in $cpfiles
do
  cp $file $builddir/$file
done
cat .gitignore | grep -v '_main\*' > $builddir/.gitignore



