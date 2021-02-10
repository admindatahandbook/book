#!/bin/sh

set -ev

#cd $(dirname $0)

TAG=v20210209

docker pull larsvilhuber/ideahandbook:$TAG
docker run -v $(pwd):/github/workspace larsvilhuber/ideahandbook:$TAG /github/workspace/_build_ebook.sh

