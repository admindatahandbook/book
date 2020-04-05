#!/bin/sh

set -ev

cd $(dirname $0)


Rscript .bootstrap.R
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')" && mv _book /public
#Rscript -e "rmarkdown::render('LICENSE.Rmd', 'html_document', '_book/license.html')"
#Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book')"
# Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::epub_book')"