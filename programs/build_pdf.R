# bookdown options TOC fix
options(bookdown.render.file_scope = FALSE)

# for testing on Mac
sysinf <- Sys.info()

if ( sysinf['sysname'] == 'Darwin' ) {
   Sys.setenv(RSTUDIO_PANDOC="/Applications/RStudio.app/Contents/MacOS/pandoc")
}

#run bookdown
# Using latex_fragment directly will not resolve references
# bookdown::render_book('index.Rmd', 'latex_fragment')

# Using the indirect path will *always* result in a failed compile, which needs to be captured
options(try.outFile = stdout()) 

try(bookdown::render_book('index.Rmd', 'bookdown::pdf_book'))

# "bookdown::render_book('index.Rmd', 'bookdown::epub_book')
