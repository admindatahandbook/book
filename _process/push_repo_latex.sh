#!/bin/bash

set -ev

publish_branch=from_book
publish_repo=https://github.com/admindatahandbook/book-latex.git
publish_repo=git@github.com:admindatahandbook/book-latex.git

[ -d .git ] && exit 2
git init 
git add *
git add .gitignore 
git remote add origin $publish_repo
git checkout -b $publish_branch
git push --force -u origin $publish_branch
