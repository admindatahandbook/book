#
# Setup file for IDEA Handbook
#
# First version: 2020-02-18
#
# Requires: library here, the rest is installed as needed
#  DO NOT LIST ANY LIBRARIES HERE - SEE LIBRARIES.R
#

# from https://www.r-bloggers.com/identifying-the-os-from-r/
get_os <- function(){
  sysinf <- Sys.info()
  if (!is.null(sysinf)){
    os <- sysinf['sysname']
    if (os == 'Darwin')
      os <- "osx"
  } else { ## mystery machine
    os <- .Platform$OS.type
    if (grepl("^darwin", R.version$os))
      os <- "osx"
    if (grepl("linux-gnu", R.version$os))
      os <- "linux"
  }
  tolower(os)
}

# Use the Rstudio Package manager

#
if ( get_os() == "linux" ) {
   options(repos = c(REPO_NAME = "https://packagemanager.rstudio.com/all/__linux__/focal/318"))
} else {
  if ( get_os() == "macosx") {
    options(repos = c(REPO_NAME = "https://cran.rstudio.com/"))
  } else {
   options(repos = c(REPO_NAME = "https://packagemanager.rstudio.com/all/318"))
  }
} 




#
# Define paths here for later
#

basedir <- here::here()
datadir <- file.path(basedir,"data")
programdir <- file.path(basedir,"programs")
figures <- file.path(basedir,"figures")

for ( dir in list(datadir,programdir,figures)){
        if (file.exists(dir)){
        } else {
        dir.create(file.path(dir))
        }
}

# 
# Clean up
#

   db.figures <- file.path(datadir,"figures0502.Rds")
   if ( file.exists(db.figures)) {
      file.remove(file.path(datadir,"figures0502.Rds"))
   }
   
#
# install any other packages
#

source(file.path(programdir,"libraries.R"))

#
#Knitr plot output folder to not break github.io
#
knitr::opts_chunk$set(fig.path = 'figures/')
knitr::opts_chunk$set(message = FALSE)
# This will load a PDF for latex if it exists
options(knitr.graphics.auto_pdf = TRUE)


#
# Read config
#

config <- config::get()

# Source programs used by all chapters

source(file.path(programdir,"_print_authors.R"))
source(file.path(programdir,"_print_supplemental.R"))
source(file.path(programdir,"_colorize.R"))

# Copy Appendix Files Over

output.dir <- ("./_book")
assets.dir <- ("./assets/appendix")

if ( ! file.exists(output.dir) ) {
dir.create(output.dir)
}

file.copy(assets.dir, output.dir, recursive=TRUE)

# some customizations

if ( knitr::is_latex_output() ) {
   knitr::opts_chunk$set(dpi = NA)
} 

