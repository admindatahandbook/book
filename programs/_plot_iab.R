# Author: Jim Shen
# Description: This will generate figures for the IAB chapter.
# This program no longer runs when the book is compiled. Past
# testing showed that ggpubr vastly increases the build time 
# for the book. Run this program separately.

library(ggplot2)
library(ggpubr)
library(RColorBrewer)

# Figure 1
iabf1data <- read.csv("./assets/iab/figure1.csv")  # read csv file 

iabf1data$Date <- factor(iabf1data$Date,levels = c("Aug 19", "Sep 19", "Oct 19", "Nov 19", "Dec 19", "Jan 20"))

iabfigure1 <- ggplot(iabf1data, aes(fill=Mode, y=Count, x=Date)) + 
  geom_bar(position="stack", stat="identity") +
  geom_text(aes(label=Count), position = position_stack(vjust=0.5)) +
  scale_fill_brewer(palette = "Paired") +
  theme(axis.title.x=element_blank(),
        axis.title.y=element_blank(),
        legend.title=element_blank(),
        axis.text.x=element_text(size=9),
        axis.text.y=element_text(size=9),
        legend.text=element_text(size=9),
        legend.key.size=unit(.8,"line"),
        panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        legend.position="bottom",
        legend.margin=margin(c(-10,0,0,0)),
        legend.box.margin=margin(c(5,0,0,0)),
        plot.margin=grid::unit(c(0,0,0,0), "mm"))

iabfigure1
ggsave("./assets/iab/iabfigure1.png", width = 4, height = 2.5, units = "in", dpi=600)
ggsave("./assets/iab/iabfigure1web.png", width=6, height=3.75,units="in",dpi=133)

# ggsave("./figures/iabfigure1.png",iabfigure1,dpi=300)
# pdffile <- "./figures/iabfigure1.pdf"
# if ( ! file.exists(pdffile) ) {
#   ggsave(pdffile,iabfigure1,dpi=pdfdpi)
# }

# Figure 2 - original Figure 2 and Figure 3 combined
iabf2data <- read.csv("./assets/iab/figure2.csv")  # read csv file
iabf3data <- read.csv("./assets/iab/figure3.csv")
iabf3data$Country <- factor(iabf3data$Country,levels = c("Germany","Other Countries","U.S."))

iabfigure2 <- ggplot(iabf2data, aes(fill=Projects, y=Count, x=Year)) + 
  geom_bar(position="dodge", stat="identity") +
  scale_x_continuous(breaks = seq(2005,2019, 2)) +
  scale_fill_brewer(palette = "Paired") +
  labs(caption="(a)") +
  theme(axis.title.x=element_blank(),
        axis.title.y=element_blank(),
        legend.title=element_blank(),
        plot.caption = element_text(size=7.5,margin=margin(c(0,0,0,0)),hjust=.5,face="bold"),
        panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        axis.text.x=element_text(size=7.5,angle = 45, vjust=.7),
        axis.text.y=element_text(size=7.5),
        legend.text=element_text(size=7.5),
        legend.position="bottom",
        legend.key.size=unit(.8,"line"),
        legend.margin=margin(c(-10,0,0,0)),
        legend.box.margin=margin(c(-3,0,0,0)),
        legend.spacing.x = unit(0.05, 'cm'),
        plot.margin=grid::unit(c(0,0,0,0), "mm")) +
  guides(fill=guide_legend(nrow=1))

iabfigure3 <- ggplot(iabf3data, aes(fill=Country, y=Percentage, x=Year)) + 
  geom_bar(position="stack", stat="identity") +
  scale_x_continuous(breaks = seq(2012,2019, 1)) +
  scale_fill_brewer(labels = c("Germany", "Other", "U.S."), palette = "GnBu") +
  labs(caption="(b)") +
  theme(axis.title.x=element_blank(),
        axis.title.y=element_blank(),
        legend.title=element_blank(),
        plot.caption = element_text(size=7.5,margin=margin(c(0,0,0,0)),hjust=.5,face="bold"),
        panel.grid.major = element_blank(), panel.grid.minor = element_blank(),    
        axis.text.x=element_text(size=7.5,angle = 45, vjust=.7),
        axis.text.y=element_text(size=7.5),
        legend.text=element_text(size=7.5),
        legend.position="bottom",
        legend.direction="vertical",
        legend.key.size=unit(.8,"line"),
        legend.margin=margin(c(-10,0,0,0)),
        legend.box.margin=margin(c(-8,0,0,0)),
        legend.spacing.x = unit(0.05, 'cm'),
        plot.margin=grid::unit(c(0,0,0,0), "mm")) + 
  guides(fill=guide_legend(nrow=1))

iabfigure23<-ggarrange(iabfigure2, iabfigure3, ncol=2, nrow=1, align="hv")

#iabfigure23

ggsave("./assets/iab/iabfigure2.png", iabfigure23,width = 4, height = 2.5, units = "in", dpi=600)
ggsave("./assets/iab/iabfigure2web.png", iabfigure23, width = 6, height = 3.75, units = "in", dpi=133)

# Do BW with Blues scale

iabfig3bw <- iabfigure3 + 
              scale_fill_brewer(labels = c("Germany", "Other", "U.S."), palette="Blues",direction=-1) + 
              theme(panel.background = element_rect(fill="transparent"))
iabfig23bw <- ggarrange(iabfigure2, iabfig3bw, ncol=2, nrow=1, align="hv")
ggsave("./assets/iab/iabfigure2bw.png", iabfig23bw,width = 4, height = 2.5, units = "in", dpi=600)

# Figure 4

iabf4data <- read.csv("./assets/iab/figure4.csv") 

iabf4data$Rating <- factor(iabf4data$Rating,levels = c("very good","good","neutral","not used"))

iabfigure4 <- ggplot(iabf4data, aes(fill=Rating, y=Percentage, x=Type)) + 
  coord_flip() +
  geom_bar(position = position_stack(reverse = TRUE), stat="identity") +
  scale_fill_brewer(palette = "Blues") +
  scale_x_discrete(labels=c("Data\ndocumentation","Personal data\nadvice"))+
  theme(axis.title.x=element_blank(),
        axis.title.y=element_blank(),
        legend.title=element_blank(),
        axis.text.x=element_text(size=9),
        axis.text.y=element_text(size=9),
        panel.grid.major = element_blank(), panel.grid.minor = element_blank(),    
        legend.text=element_text(size=9),
        legend.key.size=unit(.8,"line"),
        legend.position="bottom",
        legend.margin=margin(c(-10,0,0,0)),
        legend.box.margin=margin(c(0,0,0,0)),
        plot.margin=grid::unit(c(0,0,0,0), "mm"))


ggsave("./assets/iab/iabfigure3.png", width = 4, height = 1.5, units = "in", dpi=600)
ggsave("./assets/iab/iabfigure3web.png", width = 6, height = 2.25, units = "in", dpi=133)



