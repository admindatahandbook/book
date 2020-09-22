# Author: Jim Shen
# Description: This will generate various plots for the intro chapter.

introt1data<-read.csv("./assets/intro/introtable1.csv")

introtable1<-function(){
  knitr::kable(introt1data, booktabs = TRUE,
               caption = "Descriptive Table of Chapters",
               col.names = c("Name of Institution",
                             "Type of Data Provider",
                             "Data Intermediary/Data Holder",
                             "Highlight")) %>%
    kable_styling(full_width = F) %>%
    column_spec(1, width="10em") %>%
    column_spec(2, width="10em") %>%
    column_spec(3, width="20em") %>%
    column_spec(4, width="30em")
}

# Source: Chetty (2012) via https://github.com/larsvilhuber/clone-chetty-use-admin-data

cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

#raw_url <- "https://raw.githubusercontent.com/larsvilhuber/clone-chetty-use-admin-data/master/chetty1_increase_admin.csv"
#chetty <- read.csv(raw_url,header=TRUE)
chetty <- read.csv("./assets/intro/chetty1_increase_admin.csv",header=TRUE)
chetty2 <- gather(chetty,Journal,adminpct,AER,JPE,QJE,ECMA,-Year)
intrograph1 <- ggplot(chetty2,aes(Year,adminpct,color=Journal)) + 
  geom_line()  + 
  theme_minimal() +
  theme(panel.grid.minor = element_blank()) +
  scale_colour_manual(values=cbbPalette) +
  ylab("") 
