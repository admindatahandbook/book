# Author: Jim Shen
# Description: This will generate various plots
#     for the IAB chapter.

library(ggplot2)
library(kableExtra)
library(RColorBrewer)

# Figure 1
f1data <- read.csv("./assets/iab/figure1.csv")  # read csv file 

f1data$Date <- factor(f1data$Date,levels = c("Aug 19", "Sep 19", "Oct 19", "Nov 19", "Dec 19", "Jan 20"))

figure1 <- ggplot(f1data, aes(fill=Mode, y=Count, x=Date)) + 
  geom_bar(position="stack", stat="identity") +
  geom_text(aes(label=Count), position = position_stack(vjust=0.5)) +
  scale_fill_brewer(palette = "Paired") +
  theme(axis.title.x=element_blank(),
        axis.title.y=element_blank(),
        legend.title=element_blank(),
        legend.position="bottom")

figure1

# Figure 2
f2data <- read.csv("./assets/iab/figure2.csv")  # read csv file 

figure2 <- ggplot(f2data, aes(fill=Projects, y=Count, x=Year)) + 
  geom_bar(position="dodge", stat="identity") +
  scale_x_continuous(breaks = f2data$Year, labels = as.character(f2data$Year)) +
  scale_fill_brewer(palette = "Paired") +
  theme(axis.title.x=element_blank(),
        axis.title.y=element_blank(),
        legend.title=element_blank(),
        legend.position="bottom")

figure2
# Figure 3

f3data <- read.csv("./assets/iab/figure3.csv") 

f3data$Country <- factor(f3data$Country,levels = c( "U.S.", "Other Countries","Germany"))

figure3 <- ggplot(f3data, aes(fill=Country, y=Percentage, x=Year)) + 
  geom_bar(position="stack", stat="identity") +
  scale_fill_brewer(palette = "Paired") +
  theme(axis.title.x=element_blank(),
        axis.title.y=element_blank(),
        legend.title=element_blank(),
        legend.position="bottom")

figure3
# Figure 4

f4data <- read.csv("./assets/iab/figure4.csv") 


f4data$Rating <- factor(f4data$Rating,levels = c("very good","good","neutral","not used"))

figure4 <- ggplot(f4data, aes(fill=Rating, y=Percentage, x=Type)) + 
  coord_flip() +
  geom_bar(position = position_stack(reverse = TRUE), stat="identity") +
  scale_fill_brewer(palette = "Blues") +
  theme(axis.title.x=element_blank(),
        axis.title.y=element_blank(),
        legend.title=element_blank(),
        legend.position="bottom")

figure4
# Table 1


table1data <- data.frame(
  Items = c("Population/Sample Size", 
            "Time Period covered and frequency",
            "Additional information",
            "Population/Sample Size", 
            "Time Period covered and frequency",
            "Additional information","Population/Sample Size", 
            "Time Period covered and frequency",
            "Additional information"),
  Features = c(
    "2% random sample (more than 1.8 million individuals) of the Integrated Employment Biographies, a database which includes records from<br><br>
    - 1975 onwards: employment subject, receipt of benefits in accordance with Social Code Act III<br>
    - 1999 onwards: Marginal part-time employment<br>
    - 2000 onwards: participation in an employment or training measure<br>
    - 2007 onwards: Registered jobseeker",
    "1975 until 2017 for West Germany, 1992 until 2017 for East Germany, updated every 2nd year by RDC-IAB", 
    "DOI: 10.5164/IAB.SIAB7517.de.en.v1",
    "Repeated cross sectional dataset (640,000-1.5 million establishments) on June 30, on all establishments with at least one employee liable to social security (until 1988) and/or at least one marginal worker (since 1999), and thereof a 50% random sample",
    "1975 until 2018 for West Germany, 1992 until 2018 for East Germany, annual updated by RDC-IAB",
    "DOI: 10.5164/IAB.BHP7518.de.en.v1",
    "Worker information from administrative data are linked to the IAB-Establishment Panel, an annual representative survey since 1993 in West Germany and 1996 in East Germany including approx. 16,000 establishments per year
    Stratified sample of all establishments with at least one employee liable to social security on June 30 of the year before by establishment size, industry, and federal state.<br><br>
    Two versions of LIAB:<br>
    - LIAB cross-sectional model: all establishment surveys combined with administrative worker data as of June 30 (establishment: 67,407 in total; individuals approx. 12.5 million in total)<br>
    - LIAB longitudinal model: selection of repeatedly interviewed establishments (2009-2016) combined with longitudinal worker biographies (establishment: 41,777 in total; individuals approx. 1.7 million in total)",
    "LIAB Cross-sectional model: 1993-2017<br>
    LIAB longitudinal model: 1975-2017",
    "DOI: 10.5164/IAB.LIABQM29317.de.en.v1<br>
    DOI: 10.5164/IAB.LIABLM7517.de.en.v1"
  )
)

table1<-knitr::kable(table1data, escape = F, caption="Selected RDC-IAB data", col.names = NULL, booktabs=T) %>%
  kable_styling(full_width = F) %>%
  column_spec(1, width="19em") %>%
  column_spec(2,  ) %>%
  pack_rows("Sample of Integrated Labour Market Biographies (||SIAB||)",1,3) %>%
  pack_rows("||Establishment History Panel|| (||BHP||)",4,6) %>%
  pack_rows("||Linked Employer-Employee Data|| (||LIAB||)",7,9) %>%
  footnote(general="The time period covered by each data set represents the status as of 02 June 2020. For a complete list of all data products see the [IAB website](https://fdz.iab.de/en/FDZ_Overview_of_Data.aspx).")

# Table 2

table2data<-read.csv("./assets/iab/table2.csv")

table2<-knitr::kable(
  table2data, booktabs = TRUE,
  caption = 'Number of publications in 2018, including all publications with RDC-IAB data (excluding bachelor and master theses)'
)