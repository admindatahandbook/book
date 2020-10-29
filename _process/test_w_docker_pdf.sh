#!/bin/sh

set -ev

#cd $(dirname $0)

docker pull larsvilhuber/ideahandbook_pdf:latest
docker run -v $(pwd):/github/workspace larsvilhuber/ideahandbook_pdf:latest /github/workspace/_build_pdf.sh
