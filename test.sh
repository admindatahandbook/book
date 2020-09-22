#docker run  --rm -v $(pwd):/documents conoria/alpine-r-bookdown  /documents/_build.sh
#docker run  --rm -v $(pwd):/documents --name bookdown rocker/r-rmd  /documents/_build.sh
docker run  --rm -v $(pwd):/documents --name bookdown atusy/atusydown  /documents/_build.sh

