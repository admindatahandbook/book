#
# Setup file for IDEA Handbook
#
# First version: 2020-02-18
#
# Requires: library here, the rest is installed as needed
#

install.packages("ggplot2",repos="https://cloud.r-project.org")
library(ggplot2)

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
# Read config
#

config <- config::get()

