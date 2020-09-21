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