#!/bin/bash

set -ev

publish_branch=from_book
publish_repo=https://github.com/admindatahandbook/book-latex.git
publish_repo=git@github.com:admindatahandbook/book-latex.git

if [ ! -d .git ] 
then
    git init 
fi
[ -f _main_pre_index.tex ] && rm _main_pre_index.tex
git add *
git add .gitignore 
#git remote add origin $publish_repo
git checkout -b $publish_branch
git commit -m "Update $(date)"
git push --force -u origin $publish_branch
