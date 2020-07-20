# This runs the book render locally. It is only used for testing.

setwd(rprojroot::find_root(rprojroot::is_git_root))
bookdown::render_book('index.Rmd', 'bookdown::gitbook')
#bookdown::render_book('index.Rmd', 'bookdown::pdf_book')