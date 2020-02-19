#
# Setup file for IDEA Handbook
#
# First version: 2020-02-18
#
# Requires: library here, the rest is installed as needed
#

install.packages("here",repos="https://cloud.r-project.org")
library(here)

#
# Define paths here for later
#

basedir <- here::here()
datadir <- file.path(basedir,"data")
programdir <- file.path(basedir,"programs")

#
# install any other packages
#

source(file.path(programdir,"libraries.R"))

#
# Define some parameters. Later, they might be pulled in from a database
#

baseurl <- "https://labordynamicsinstitute.github.io/idea-handbook/"
last_update <- Sys.date()
first_publish_date <- "April 2020"
