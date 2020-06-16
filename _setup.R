#
# Setup file for IDEA Handbook
#
# First version: 2020-02-18
#
# Requires: library here, the rest is installed as needed
#  DO NOT LIST ANY LIBRARIES HERE - SEE LIBRARIES.R
#


install.packages("here",repos="https://cloud.r-project.org", dependencies = TRUE)
install.packages("memisc",repos="https://cloud.r-project.org", dependencies = TRUE)


#
#Knitr plot output folder to not break github.io
#
knitr::opts_chunk$set(fig.path = 'figures/')


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

