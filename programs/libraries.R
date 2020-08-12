#
# Libraries for IDEA Handbook
#
# First version: 2020-02-18
#
# Will install all necessary libraries
#

pkgTest <- function(x)
{
	if (!require(x,character.only = TRUE))
	{
		print(paste0("Package ",x," not found - installing"))
		install.packages(x,repos = 'https://cloud.r-project.org/')
		if(!require(x,character.only = TRUE)) stop("Package not found")
	}
	return("OK")
}

global.libraries <- c("here","bookdown","tufte","config","ggplot2","rprojroot","memisc","forcats","kableExtra")

results <- sapply(as.list(global.libraries), pkgTest)
