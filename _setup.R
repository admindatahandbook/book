#
# Setup file for IDEA Handbook
#
# First version: 2020-02-18
#
# Requires: library here, the rest is installed as needed
#  DO NOT LIST ANY LIBRARIES HERE - SEE LIBRARIES.R
#


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


#
# Read config
#

config <- config::get()

# Source programs used by all chapters

source(file.path(programdir,"_print_authors.R"))
source(file.path(programdir,"_colorize.R"))

# Copy Appendix Files Over

dir.create("./_book")
output.dir <- ("./_book")
assets.dir <- ("./assets/appendix")
file.copy(assets.dir, output.dir, recursive=TRUE)

