#!/bin/sh

set -ev

cd $(dirname $0)

# clean up first

[ -f _main.Rmd ] && rm -f _main.Rmd

# set up the environment
Rscript programs/bootstrap.R

# build the handbook
Rscript programs/build_ebook.R


