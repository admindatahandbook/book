# bookdown options TOC fix
options(bookdown.render.file_scope = FALSE)

#run bookdown
bookdown::render_book('index.Rmd', 'bookdown::gitbook')

# rmarkdown::render('LICENSE.Rmd', 'html_document', '_book/license.html')
# bookdown::render_book('index.Rmd', 'bookdown::pdf_book')
# "bookdown::render_book('index.Rmd', 'bookdown::epub_book')