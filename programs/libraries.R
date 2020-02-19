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
		install.packages(x,dep=TRUE)
		if(!require(x,character.only = TRUE)) stop("Package not found")
	}
	return("OK")
}

global.libraries <- c("tufte")

results <- sapply(as.list(global.libraries), pkgTest)