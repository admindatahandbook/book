#!/bin/bash

publish_branch=from_book
publish_repo=https://github.com/admindatahandbook/book-latex.git
publish_repo=git@github.com:admindatahandbook/book-latex.git
infile=_main.tex

fail=yes
push=no
if [[ "$1" == "force" ]]
then
   fail=no
fi
if [[ "$1" == "push" ]]
then
   push=yes
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
        fail=no
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

# check for file

[[ -f $infile ]] || die "$infile not found"

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

# random cleanup
echo "Removing these files from the change log - you will have to add them manually"
git restore figures/iabfig*pdf
git restore figures/introchetty*pdf

[ -d $builddir ] && rm -rf $builddir

git clone --depth=1 $publish_repo $builddir
(cd $builddir; git rm -rf *;cd ..)
#mkdir $builddir
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

# populate the chapters
# This creates the file "chapters.tex"
_process/split_main.sh

# Update the file 0_master.tex
sed -i.bak '/== CHAPTERS ==/r'<(cat $builddir/chapters.tex) $builddir/0_master.tex
sed -i 's/\\input{_main.tex}/%\\input{_main.tex}/' $builddir/0_master.tex

if [ "$push" == "yes" ]
then
 echo "now push stuff"
 cd $builddir
 ../_process/push_repo_latex.sh
fi
