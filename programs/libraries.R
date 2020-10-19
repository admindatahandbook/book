#
# Libraries for IDEA Handbook
#
# First version: 2020-02-18
#
# Will install all necessary libraries
#

pkgTest <- function(x,try=FALSE)
{
        if (!require(x,character.only = TRUE))
        {
                print(paste0("Package ",x," not found - installing"))
				install.packages(x,dep=TRUE)
                if(!require(x,character.only = TRUE)) stop("Package not found")
        }
  if ( try ) {
    print(paste0("Unloading ",x))
    detach(paste0("package:",x), unload = TRUE, character.only = TRUE)
  }
  return("OK")
}

global.libraries <- c("here","knitr","bookdown","tufte","dplyr","tidyr","config","ggplot2",
"rprojroot","readr","memisc","forcats","kableExtra","RColorBrewer","pander","readODS","stringr", "remotes") #"ggpubr"

results <- sapply(as.list(global.libraries), pkgTest)

# libraries that will be unloaded. Note that they will be need to be expliclity loaded in the chunk they are used.
unload.libraries <- c("DT")

results <- sapply(as.list(unload.libraries), pkgTest, try=TRUE)


remotes::install_github("coolbutuseless/ggpattern",upgrade="never")

