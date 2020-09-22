#!/bin/sh

set -ev

cd $(dirname $0)

# set up the environment
Rscript programs/bootstrap.R

# build the handbook
Rscript programs/build.R

# move over a few files
if [[ -d _book ]] 
then
  [[ -d _book/_process ]] || mkdir _book/_process
  [[ -f _process/index.tmpl ]] && cp _process/index.tmpl _book/_process
  [[ -f _process/set_version.sh ]] && cp _process/set_version.sh _book/_process
fi
