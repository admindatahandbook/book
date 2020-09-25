#!/bin/bash
# Will try to generate a PDF from the HTML version
# Works on Mac and Linux

source=$1
dest=$2

[[ -z $2 ]] && exit 2

if [ "$(uname)" == "Darwin" ]
then 
   lib=/Library/Frameworks/R.framework/Resources/library
   pandocloc=/Applications/RStudio.app/Contents/MacOS/pandoc
else
   lib=/usr/local/lib/R/site-library
   pandocloc=/usr/bin

fi

$pandocloca/pandoc $source -t html5 -o $dest --lua-filter=programs/filter-index-html.lua --standalone --template $lib/bookdown/templates/gitbook.html --highlight-style tango --number-sections --css assets/css/style.css --css assets/css/toc.css --css assets/css/font-awesome.min.css --css assets/css/draft.css --mathjax --lua-filter $lib/rmarkdown/rmd/lua/pagebreak.lua --lua-filter $lib/rmarkdown/rmd/lua/latex-div.lua --filter $pandocloc/pandoc-citeproc
