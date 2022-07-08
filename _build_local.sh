#!/bin/sh

set -ev

chmod a+rx _build.sh

docker run -it --rm \
   -v $(pwd):/github/workspace \
   larsvilhuber/ideahandbook:latest \
   "/github/workspace/_build.sh"