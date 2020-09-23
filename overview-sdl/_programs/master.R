# Map the data
# This can be run from the command line as 
#  Rscript --vanilla master.R 

# capture command line arguments

args = commandArgs(trailingOnly=TRUE)

if (length(args)>0) {
  if ( args[1] == "ubuntu" ) {
    system("apt-get update")
    # system("apt-get upgrade")
    system("apt-get install -y libcurl4-openssl-dev libxml2-dev libgdal-dev libgdal20 libudunits2-dev")
     system("apt-get install -y texlive-latex-recommended texlive-fonts-recommended texlive-latex-extra texlive-pictures r-cran-extrafont")
     system("apt-get install -y pandoc-citeproc")
     #system("apt-get install -y r-cran-tidyverse")
     system("apt-get install -y r-cran-bookdown r-cran-rprojroot ")
     system("apt-get install -y r-cran-ggplot2 r-cran-ggthemes ")
    }
  }

source(file.path(rprojroot::find_root(rprojroot::has_file("pathconfig.R")),"pathconfig.R"),echo=FALSE)
source(file.path(programs,"config.R"), echo=FALSE)
source(file.path(programs,"global-libraries.R"), echo=FALSE)

# for pandoc, when not running in Rstudio
source(file.path(programs,"get_os.R"))
pandoc.tmp <- Sys.getenv("RSTUDIO_PANDOC")
if ( pandoc.tmp == "") {
  print("setting pandoc path")
  if ( get_os() == "osx" ) {
    Sys.setenv(RSTUDIO_PANDOC="/Applications/RStudio.app/Contents/MacOS/pandoc")
  }
  # add any other strange cases here
  print(Sys.getenv("RSTUDIO_PANDOC"))
}

print(Sys.getenv("RSTUDIO_PANDOC"))

render_report <- function(document) {
  print(paste0("document = ",document))
  unlink(file.path(basepath,paste0(document,"_cache")),recursive=TRUE,force=TRUE)
  input_doc <- file.path(basepath,paste0(document,".Rmd"))
  print(paste0("Processing bookdown for ",input_doc))
  bookdown::render_book(input_doc, 
      'bookdown::gitbook',
      clean_envir = FALSE
      )
  file.rename(file.path("_book","_main.html"),file.path("_book","index.html"))
}

render_report("index")

