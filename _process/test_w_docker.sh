#!/bin/sh

set -ev

#cd $(dirname $0)

docker pull larsvilhuber/ideahandbook:latest
docker run -v $(pwd):/github/workspace larsvilhuber/ideahandbook:latest /github/workspace/_build.sh
