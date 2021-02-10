#!/bin/sh

set -ev

#cd $(dirname $0)

TAG=latest

docker pull larsvilhuber/ideahandbook_pdf:$TAG
docker run -v $(pwd):/github/workspace larsvilhuber/ideahandbook_pdf:$TAG /github/workspace/_build_pdf.sh
