#!/bin/sh

set -ev

cd $(dirname $0)

Rscript -e 'install.packages("ggplot2")' -e 'remotes::install_deps(".", dependencies = TRUE)'
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
#Rscript -e "rmarkdown::render('LICENSE.Rmd', 'html_document', '_book/license.html')"
#Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book')"
# Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::epub_book')"

