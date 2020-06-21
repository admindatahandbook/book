# Author: Jim Shen
# Description: This will generate various plots
#     for the Physical Security dimensions.

library(ggplot2)

# Colors
pal <- c(
   "Data Provider" = "#33a02c",
   "Third-Party" = "#a6cee3",
   "Researcher" = "#1f78b4",
   "Low" = "#33a02c",
   "Medium" = "#a6cee3",
   "High" = "#1f78b4",
   "Data Custodian" = "#33a02c", 
   "High Security" = "#33a02c",
   "Medium Security" = "#a6cee3",
   "Low Security" = "#1f78b4",
   "Highly Restricted" = "#33a02c",
   "Limited Restrictions" = "#a6cee3",
   "Unrestricted" = "#1f78b4"
)


plot <- function(data) {
   
   databar = data.frame(metrics=data$metrics,rank=as.factor(data$rank))
   databar$rank <- as.character(databar$rank)
   for (i in c(1)) {
      databar$rank[i][databar$rank[i] == "1"] <- "Data Provider"
      databar$rank[i][databar$rank[i] == "2"] <- "Third-Party"
      databar$rank[i][databar$rank[i] == "3"] <- "Researcher"
   }
   for (i in c(2)) {
      databar$rank[i][databar$rank[i] == "1"] <- "Low"
      databar$rank[i][databar$rank[i] == "2"] <- "Medium"
      databar$rank[i][databar$rank[i] == "3"] <- "High"
   }
   for (i in c(3)) {
      databar$rank[i][databar$rank[i] == "1"] <- "Data Custodian"
      databar$rank[i][databar$rank[i] == "2"] <- "Third-Party"
      databar$rank[i][databar$rank[i] == "3"] <- "Researcher"
   }
   for (i in c(4)) {
      databar$rank[i][databar$rank[i] == "1"] <- "High Security"
      databar$rank[i][databar$rank[i] == "2"] <- "Medium Security"
      databar$rank[i][databar$rank[i] == "3"] <- "Low Security"
   }
   for (i in c(5)) {
      databar$rank[i][databar$rank[i] == "1"] <- "Highly Restricted"
      databar$rank[i][databar$rank[i] == "2"] <- "Limited Restrictions"
      databar$rank[i][databar$rank[i] == "3"] <- "Unrestricted"
   }
   databar$rank <- as.factor(databar$rank)
   
   databar$metrics <- factor(databar$metrics,levels = c("Range of Analysis Methods","Security of Access Room","Location and Type of Access Computer","Researcher Agency Over Analysis Computer","Location of Data and Analysis Computer"))
   ggplot(databar, aes(x=metrics,y=1)) +
      geom_bar(stat="identity", aes(fill=rank), width=1) +
      theme(axis.title.x=element_blank(),
            axis.text.x=element_blank(),
            axis.ticks.x=element_blank(),
            axis.title.y=element_blank(),
            axis.text.y=element_blank(),
            axis.ticks.y=element_blank(),
            legend.position = "none") +
      scale_fill_manual(values = pal) +
      geom_text(aes(label=paste(metrics,": ",rank)),
                color="black",
                position = position_stack(vjust=0.5)) +
      coord_flip() +
      theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
            panel.background = element_blank())
   
}