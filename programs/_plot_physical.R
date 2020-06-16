# Author: Jim Shen
# Description: This will generate various plots
#     for the Physical Security dimensions.

library(ggplot2)

# Colors
 pal <- c(
   "Data Provider" = "#33a02c",
   "Third Party" = "#a6cee3",
   "Researcher" = "#1f78b4",
   "Open" = "#1f78b4",
   "Low Security" = "#a6cee3",
   "Medium Security" = "#33a02c",
   "High Security" = "#b2df8a",
   "Low" = "#33a02c",
   "Medium" = "#a6cee3",
   "High" = "#1f78b4",
   "Restrictive" = "#33a02c",
   "Medium" = "#a6cee3",
   "Flexible" = "#1f78b4"
 )


plot <- function(data) {
 
   databar = data.frame(metrics=data$metrics,rank=as.factor(data$rank))
   databar$rank <- as.character(databar$rank)
   for (i in c(1,3)) {
   databar$rank[i][databar$rank[i] == "1"] <- "Data Provider"
   databar$rank[i][databar$rank[i] == "2"] <- "Third Party"
   databar$rank[i][databar$rank[i] == "3"] <- "Researcher"
   }
   for (i in c(2,5)) {
     databar$rank[i][databar$rank[i] == "2"] <- "Medium"
   }
   databar$rank[2][databar$rank[2] == "1"] <- "Low"
   databar$rank[2][databar$rank[2] == "3"] <- "High"
   databar$rank[4][databar$rank[4] == "1"] <- "High Security"
   databar$rank[4][databar$rank[4] == "2"] <- "Medium Security"
   databar$rank[4][databar$rank[4] == "3"] <- "Low Security"
   databar$rank[4][databar$rank[4] == "4"] <- "Open"
   databar$rank[5][databar$rank[5] == "1"] <- "Restrictive"
   databar$rank[5][databar$rank[5] == "3"] <- "Flexible"
   databar$rank <- as.factor(databar$rank)

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
