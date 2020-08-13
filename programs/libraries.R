#
# Libraries for IDEA Handbook
#
# First version: 2020-02-18
#
# Will install all necessary libraries
#

#pkgTest <- function(x)
#{
#	if (!require(x,character.only = TRUE))
#	{
#		print(paste0("Package ",x," not found - installing"))
#		install.packages(x,repos = 'https://cloud.r-project.org/')
#		if(!require(x,character.only = TRUE)) stop("Package not found")
#	}
#	return("OK")
#}

#global.libraries <- c("here","bookdown","tufte","config","ggplot2","rprojroot","memisc","forcats","kableExtra")

#results <- sapply(as.list(global.libraries), pkgTest)



args = commandArgs(trailingOnly=TRUE)

if (length(args)>0) {
  if ( args[1] == "ubuntu" ) {
    system("apt-get update")
    system("apt-get upgrade")
    system("apt-get install -y libxml2-dev")
    system("apt-get install -y pandoc-citeproc")
    system("apt-get install -y r-cran-rprojroot r-cran-tidyverse")
    system("apt-get install -y r-cran-here r-cran-bookdown")
    system("apt-get install -y r-cran-tufte r-cran-config r-cran-memisc")
    system("apt-get install -y r-cran-forcats")
    system("sudo apt-get build-dep r-cran-kableExtra")
    system("apt-get install -y r-cran-kableExtra ")
  }
}