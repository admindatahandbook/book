


pkgTest <- function(x)
{
	if (!require(x,character.only = TRUE))
	{
		install.packages(x,dep=TRUE,repos="https://cloud.r-project.org")
		if(!require(x,character.only = TRUE)) stop("Package not found")
	}
	return("OK")
}

## Add any libraries to this line, and uncomment it.

global.libraries <- c("here","bookdown")

results <- sapply(as.list(global.libraries), pkgTest)
