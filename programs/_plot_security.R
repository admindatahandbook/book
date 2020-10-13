# Author: Jim Shen
# Description: This will generate various plots
#     for the Physical Security dimensions.

# Aspect Names
aspect.names <- c(   "Researcher Agency",
                     "Data Location",
                     "Access Location",
                     "Access Security",
                     "Analysis Methods")

# Colors
pal <- c(
   "Data Provider" = config$colors$aspect_low,
   "Third-Party" = config$colors$aspect_med,
   "Researcher" = config$colors$aspect_high,
   "Low" = config$colors$aspect_low,
   "Medium" = config$colors$aspect_med,
   "High" = config$colors$aspect_high,
   "Data Custodian" = config$colors$aspect_low, 
   "High Security" = config$colors$aspect_low,
   "Medium Security" = config$colors$aspect_med,
   "Low Security" = config$colors$aspect_high,
   "Highly Restricted" = config$colors$aspect_low,
   "Limited Restrictions" = config$colors$aspect_med,
   "Unrestricted" = config$colors$aspect_high
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
      geom_text(aes(label=paste(metrics,": ",rank, sep="")),
                color="black",
                position = position_stack(vjust=0.5),
                size=3.5) +
      coord_flip() +
      theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
            panel.background = element_blank())
   ggsave(file.path(figures,figure.name),g)
   if ( display ) {
      g
   }
}

# Table 1

securityt1data<-read.csv("./assets/security/securitytable1.csv")

securitytable1<-function() {
kable(securityt1data, col.names=NULL) %>%
   column_spec(1, width="12em", bold=TRUE, background=(ifelse(securityt1data$agency[1:nrow(securityt1data)]=="Low Agency",config$colors$aspect_low,ifelse(securityt1data$agency[1:nrow(securityt1data)]=="Medium Agency",config$colors$aspect_med,config$colors$aspect_high)))) %>%
   kable_styling(font_size=14)
}

# Table 2

securityt2data<-read.csv("./assets/security/securitytable2.csv")

securitytable2<-function() {
kable(securityt2data, col.names=NULL) %>%
   column_spec(1, width="12em", bold=TRUE, background=(ifelse(securityt2data$location[1:nrow(securityt2data)]=="Data Provider",config$colors$aspect_low,ifelse(securityt2data$location[1:nrow(securityt2data)]=="Third Party",config$colors$aspect_med,config$colors$aspect_high)))) %>%
   kable_styling(font_size=14)
}

# Table 3

securityt3data<-read.csv("./assets/security/securitytable3.csv")

securitytable3<-function() {
kable(securityt3data, col.names=NULL) %>%
   column_spec(1, width="12em", bold=TRUE, background=(ifelse(securityt3data$location[1:nrow(securityt3data)]=="Data Custodian",config$colors$aspect_low,ifelse(securityt3data$location[1:nrow(securityt3data)]=="Third Party",config$colors$aspect_med,config$colors$aspect_high)))) %>%
   kable_styling(font_size=14)
}

# Table 4

securityt4data<-read.csv("./assets/security/securitytable4.csv")

securitytable4<-function() {
kable(securityt4data, col.names=NULL) %>%
   column_spec(1, width="12em", bold=TRUE, background=(ifelse(securityt4data$security[1:nrow(securityt4data)]=="High Security",config$colors$aspect_low,ifelse(securityt4data$security[1:nrow(securityt4data)]=="Medium Security",config$colors$aspect_med,config$colors$aspect_high)))) %>%
   kable_styling(font_size=14)
}


# Table 5

securityt5data<-read.csv("./assets/security/securitytable5.csv")

securitytable5<-function() {
kable(securityt5data, col.names=NULL) %>%
   column_spec(1, width="12em", bold=TRUE, background=(ifelse(securityt5data$restrictions[1:nrow(securityt5data)]=="Highly Restricted",config$colors$aspect_low,ifelse(securityt5data$restrictions[1:nrow(securityt5data)]=="Limited Restrictions",config$colors$aspect_med,config$colors$aspect_high)))) %>%
   kable_styling(font_size=14)
}

# Summary Table

summarymechs <- read.csv("./assets/security/mechanisms.csv")
plotallmechs<-function() {
   summarymechs %>%
   kable(escape=F, "html", align="cccccc",
         col.names = c("Data Access Mechanism","Researcher Agency Over Analysis Computer",
                       "Location of Data and Analysis Computer",
                       "Location of Access Computer",
                       "Access Security",
                       "Range of Analysis Methods Available")) %>%
   kable_styling(font_size=12) %>%
   column_spec(1, width="10em") %>%
   column_spec(2, width="17em", background=(ifelse(summarymechs$agency[1:nrow(summarymechs)]=="Low",config$colors$aspect_low,ifelse(summarymechs$agency[1:nrow(summarymechs)]=="Medium",config$colors$aspect_med,config$colors$aspect_high)))) %>%
   column_spec(3, width="17em", background=(ifelse(summarymechs$location[1:nrow(summarymechs)]=="Data Provider",config$colors$aspect_low,ifelse(summarymechs$location[1:nrow(summarymechs)]=="Third-Party",config$colors$aspect_med,config$colors$aspect_high)))) %>%
   column_spec(4, width="17em", background=(ifelse(summarymechs$access[1:nrow(summarymechs)]=="Data Custodian",config$colors$aspect_low,ifelse(summarymechs$access[1:nrow(summarymechs)]=="Third-Party",config$colors$aspect_med,config$colors$aspect_high)))) %>%
   column_spec(5, width="17em", background=(ifelse(summarymechs$sec[1:nrow(summarymechs)]=="High Security",config$colors$aspect_low,ifelse(summarymechs$sec[1:nrow(summarymechs)]=="Medium Security",config$colors$aspect_med,config$colors$aspect_high)))) %>%
   column_spec(6, width="17em", background=(ifelse(summarymechs$range[1:nrow(summarymechs)]=="Highly Restricted",config$colors$aspect_low,ifelse(summarymechs$range[1:nrow(summarymechs)]=="Limited",config$colors$aspect_med,config$colors$aspect_high))))
}


# Commented this out to see if removing ggpubr will improve build speed
# # Summary Table Function
# plotallmechs<-function(){
# summarymechs <- read.csv("./assets/security/mechanisms.csv")
# 
# # Create a ggtextable
# allmechs <- ggtexttable(summarymechs, rows = NULL, theme = ttheme("classic"),
#                         cols=c("Name",
#                                "Researcher\nAgency\nOver\nAnalysis\nComputer",
#                                "  Location  \nof Data and\nAnalysis\nComputer",
#                                "  Location  \nof Access\nComputer",
#                                "   Access   \nSecurity",
#                                " Range of \nAnalysis\nMethods\nAvailable"))
# 
# # Specify colors for significant p-values
# 
# # Coloring the table conditionnally using `ggpubr::table_cell_bg()`
# 
# list = c("agency", "location","access","sec","range")
# 
# for (i in list) {
#   summarymechs <- summarymechs %>% 
#     mutate(
#       fill = ifelse(summarymechs[, i] == 1, config$colors$aspect_low, ifelse(summarymechs[, i] == 2, config$colors$aspect_med, config$colors$aspect_high)),
#       color="black"
#     )
#   for(j in 1:nrow(summarymechs)){
#     row = j+1
#     column = which(colnames(summarymechs) == i)
#     allmechs <- table_cell_bg(
#       allmechs, row = row, column = column,
#       fill = summarymechs$fill[j], color = summarymechs$color[j]
#     )
#   }
# }
# 
# print(allmechs)
# }