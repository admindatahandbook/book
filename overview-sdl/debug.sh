#!/bin/bash
docker run --name rockerrrmd_abb19c --label 3b3ac6 --workdir /github/workspace --rm  -v "$(pwd)":"/github/workspace" rocker/r-rmd /github/workspace/_build.sh