# bookdown options TOC fix
options(bookdown.render.file_scope = FALSE)

# for testing on Mac
sysinf <- Sys.info()

if ( sysinf['sysname'] == 'Darwin' ) {
   Sys.setenv(RSTUDIO_PANDOC="/Applications/RStudio.app/Contents/MacOS/pandoc")
}

#run bookdown
#bookdown::render_book('index.Rmd', 'bookdown::gitbook')

#bookdown::render_book('index.Rmd', 'bookdown::pdf_book')
bookdown::render_book('index.Rmd', 'bookdown::epub_book')
