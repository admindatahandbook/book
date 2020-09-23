# ###########################
# CONFIG: define paths and filenames for later reference
# ###########################

# Change the basepath depending on your system

basepath <- rprojroot::find_root(rprojroot::has_file("pathconfig.R"))
#setwd(basepath)

# Main directories
programs <- file.path(basepath,"_programs")
