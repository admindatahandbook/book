# Author: Jim Shen
# Description: This will generate various plots for the intro chapter.

infile <- "./assets/intro/introtable1.csv"
introt1data<-read.csv(infile,sep=";")

# copy it for LaTeX if necessary
    outcsv  <- gsub("assets","tables",infile)
    if ( ! file.exists(outcsv) ) { file.copy(infile,outcsv) }


introtable1<-function(){
  knitr::kable(introt1data, booktabs = TRUE,
               caption = "Descriptive Table of Chapters",
               col.names = c("Name of Institution",
                             "Chapter",
                             "Type of Data Provider",
                             "Data Intermediary/Data Holder",
                             "Highlight")) %>%
    kable_styling(full_width = F, font_size = 12) %>%
    column_spec(1, width="10em") %>%
    column_spec(2, width="5em") %>%
    column_spec(3, width="10em") %>%
    column_spec(4, width="20em") %>%
    column_spec(5, width="30em")
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
ggsave("./figures/intrograph1.pdf",intrograph1,dpi=600)
ggsave("./figures/intrograph1.png",intrograph1,dpi=300)


