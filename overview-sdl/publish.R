# This runs the book render locally. It is only used for testing.

bookdown::render_book('index.Rmd', 'bookdown::gitbook',output_dir = "docs/",output_file="index.html")
#bookdown::render_book('index.Rmd', 'bookdown::pdf_book')