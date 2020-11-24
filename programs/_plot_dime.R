# Update figures for DIME
# Author: Jim Shen

library(ggplot2)
library(forcats)
library(dplyr)
pdfdpi=600


# Figure 1

df<-data.frame(percent=c(14,11,25,18,25,36),year=c("2014","2015","2016","2017","2018","2019"),number=c(21,36,20,17,20,11))


dime1<-ggplot(data=df, aes(x=year, y=percent)) +
  geom_bar(stat="identity", fill="#43a2ca", width=.7)+
  labs(title="", x ="Year", y = "% of Impact Evaluations")+
  geom_text(aes(label=paste(percent,"% of ",number,"\nevaluations",sep="")),vjust=-.3,size=5)+
  #scale_x_continuous(expand = c(0, 0), limits = c(0,NA)) + 
  scale_y_continuous(expand = c(0, 0), limits = c(0, 40)) +
  theme(axis.text=element_text(size=18),
        axis.title=element_text(size=18,face="bold"), panel.background = element_rect(fill = "white",
                                                                                      colour = "white",
                                                                                      size = 0.5, linetype = "blank"),
        axis.line = element_line(size=1))
dime1





aspect_ratio <- 4/3
#height <- 7
#ggsave(g, height = 7 , width = 7 * aspect_ratio)


ggsave("./assets/dime/dimefigure1.png",dime1,dpi=300, height = 7 , width = 7 * aspect_ratio)
# pdffile <- "./dime1.pdf"
# # if ( ! file.exists(pdffile) ) {
#   ggsave(pdffile,dime1,dpi=pdfdpi,height = 7 , width = 7 * aspect_ratio)
# # }
