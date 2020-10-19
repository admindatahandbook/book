#!/bin/sh

set -ev

cd $(dirname $0)

[ -f _main.Rmd ] && rm -f _main.Rmd

# set up the environment
Rscript programs/bootstrap.R

# build the handbook
Rscript programs/build.R

# move over a few files
if [ -d _book ] 
then
  if [ ! -d _book/_process ] ; then mkdir _book/_process ; fi
  if [ -f _process/index.tmpl ] ; then cp _process/index.tmpl _book/_process ; fi
  if [ -f _process/set_version.sh ] ; then cp _process/set_version.sh _book/_process ; fi
  tar czvf _book/_process/github_workflow.tgz .github/workflows/
fi

