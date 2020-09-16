# Author: Jim Shen
# Description: This will generate various plots
#     for the Physical Security dimensions.

library(ggplot2)
library(dplyr)
library(ggpubr)

# Aspect Names
aspect.names <- c(   "Researcher Agency Over Analysis Computer",
                     "Location of Data and Analysis Computer",
                     "Location of Access Computer",
                     "Access Security",
                     "Range of Analysis Methods Available")

# Colors
pal <- c(
   "Data Provider" = config$color_aspect_low,
   "Third-Party" = config$color_aspect_med,
   "Researcher" = config$color_aspect_high,
   "Low" = config$color_aspect_low,
   "Medium" = config$color_aspect_med,
   "High" = config$color_aspect_high,
   "Data Custodian" = config$color_aspect_low, 
   "High Security" = config$color_aspect_low,
   "Medium Security" = config$color_aspect_med,
   "Low Security" = config$color_aspect_high,
   "Highly Restricted" = config$color_aspect_low,
   "Limited Restrictions" = config$color_aspect_med,
   "Unrestricted" = config$color_aspect_high
)

# Individual Table Function
plot_summary <- function(description,name,a,b,c,d,e,display=TRUE) {
   
   databar = data.frame(order=seq(1:5),metrics=aspect.names,rank=as.character(c(a,b,c,d,e)))
   
   for (i in c(1)) { # agency
      databar$rank[i][databar$rank[i] == "1"] <- "Low"
      databar$rank[i][databar$rank[i] == "2"] <- "Medium"
      databar$rank[i][databar$rank[i] == "3"] <- "High"
   }
   for (i in c(2)) { # location
      databar$rank[i][databar$rank[i] == "1"] <- "Data Provider"
      databar$rank[i][databar$rank[i] == "2"] <- "Third-Party"
      databar$rank[i][databar$rank[i] == "3"] <- "Researcher"
   }
   for (i in c(3)) { # location access
      databar$rank[i][databar$rank[i] == "1"] <- "Data Custodian"
      databar$rank[i][databar$rank[i] == "2"] <- "Third-Party"
      databar$rank[i][databar$rank[i] == "3"] <- "Researcher"
   }
   for (i in c(4)) { # access security
      databar$rank[i][databar$rank[i] == "1"] <- "High Security"
      databar$rank[i][databar$rank[i] == "2"] <- "Medium Security"
      databar$rank[i][databar$rank[i] == "3"] <- "Low Security"
   }
   for (i in c(5)) { # Range
      databar$rank[i][databar$rank[i] == "1"] <- "Highly Restricted"
      databar$rank[i][databar$rank[i] == "2"] <- "Limited Restrictions"
      databar$rank[i][databar$rank[i] == "3"] <- "Unrestricted"
   }
   databar$rank <- as.factor(databar$rank)
   
   
   databar$metrics <- factor(databar$metrics,levels = aspect.names)
   # database entry
   name.str <- deparse(substitute(name))
   figure.name = paste0("display_",name.str,".png")
   db.figures <- file.path(datadir,"figures0502.Rds")
   new <- data.frame(name.str,description,figure.name)
   if ( file.exists(db.figures)) {
      db <- readRDS(db.figures)
      saveRDS(rbind(db,new),db.figures)
   } else {
      saveRDS(new,db.figures)
   }
   # plot
   g <- ggplot(databar, aes(x=fct_reorder(metrics,order,.desc=TRUE),y=1)) +
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
   ggsave(file.path(figures,figure.name),g)
   if ( display ) {
      g
   }
}



# # Summary Table Function
plotallmechs<-function(){
summarymechs <- read.csv("./assets/security/mechanisms.csv")

# Create a ggtextable
allmechs <- ggtexttable(summarymechs, rows = NULL, theme = ttheme("classic"),
                        cols=c("Name",
                               "Researcher\nAgency\nOver\nAnalysis\nComputer",
                               "  Location  \nof Data and\nAnalysis\nComputer",
                               "  Location  \nof Access\nComputer",
                               "   Access   \nSecurity",
                               " Range of \nAnalysis\nMethods\nAvailable"))

# Specify colors for significant p-values

# Coloring the table conditionnally using `ggpubr::table_cell_bg()`

list = c("agency", "location","access","sec","range")

for (i in list) {
  summarymechs <- summarymechs %>% 
    mutate(
      fill = ifelse(summarymechs[, i] == 1, config$color_aspect_low, ifelse(summarymechs[, i] == 2, config$color_aspect_med, config$color_aspect_high)),
      color="black"
    )
  for(j in 1:nrow(summarymechs)){
    row = j+1
    column = which(colnames(summarymechs) == i)
    allmechs <- table_cell_bg(
      allmechs, row = row, column = column,
      fill = summarymechs$fill[j], color = summarymechs$color[j]
    )
  }
}

print(allmechs)
}