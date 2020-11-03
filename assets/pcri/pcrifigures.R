# This program generates updated figures for the PCRI chapter.
# This program does not run every tie the Handbook is built,
# and as such is included in the assets folder as a record
#
# Author: Jim Shen


# Load ggplot2
library(plotly)
library(VennDiagram)
library(eulerr)

# # Original Version
# m = list(
#   l = 380,
#   r = 280,
#   b = 180,
#   t = 180,
#   pad = 140
# )
# 
# country = c("United States","Africa","Asia","Europe","Middle East","North America","Oceania","South America")
# count = c(12488,221,3767,6544,472,1069,443,234)
# percent=c("49%","1%","15%","26%","2%","4%","2%","1%")
# counttext = c("(12,488)","(221)","(3,767)","(6,544)","(472)","(1,069)","(443)","(234)")
# 
# colors <- c('#08589e','#a8ddb5','#f7fcf0','#4eb3d3','#7bccc4','#e0f3db','#2b8cbe','#ccebc5')
# 
# data = as.data.frame(cbind(country, count))
# data$count = as.numeric(as.character(data$count))
# 
# p <- plot_ly(width=1800, height=1400, data, labels = ~country, values = ~count, type = 'pie',textposition = ifelse(country=="United States",'inside','outside'),textinfo = 'label+text', text=paste(percent,counttext),rotation= 90, marker = list(colors = colors,
#                                                                                                                                                                                                                                                    line = list(color = '#000000', width = 2)), sort=F) %>%
#   layout(title = '',
#          xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
#          yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE)) %>%
#   layout(showlegend = FALSE, autosize=F, margin=m,font=list(size = 40))
# 
# p
# 



# Combine AF ME OCE and SAm into Other
m = list(
  l = 240,
  r = 240,
  b = 60,
  t = 120,
  pad = 40
)

country = c("United States","Asia","Europe","North\nAmerica","Other") #"Africa","Middle East","Oceania","South America"
count = c(12488,3767,6544,1069,1370)
percent=c("49%","15%","26%","4%","6%")
#counttext = c("(12,488)","(3,767)","(6,544)","(1,069)","(1,370)")

colors <- c('#0868ac','#7bccc4','#f0f9e8','#43a2ca','#bae4bc')

data = as.data.frame(cbind(country, count))
data$count = as.numeric(as.character(data$count))

p <- plot_ly(width=1600, height=1250, data, labels = ~country, values = ~count, type = 'pie',
             textposition = ifelse(country=="United States",'inside',ifelse(country=="Asia",'inside',ifelse(country=="Europe",'inside','outside'))),
             textinfo = 'label+text', text=paste(percent),rotation= 90, marker = list(colors = colors,
                                                                                                                                                                                                                                                   line = list(color = '#000000', width = 2)), sort=F) %>%
  layout(title = '',
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE)) %>%
  layout(showlegend = FALSE, autosize=F, margin=m,font=list(size = 40))

p


# Venn Diagram

grid.newpage()
draw.triple.venn(area1 = 11491, area2 = 2964, area3 = 5291, n12 = 1345, n23 = 519, n13 = 2139, n123 = 447, category = c("Refinitiv", "Unquote", "EMPEA"),
                 
                 
                 # Circles
                 lwd = 2,
                 #lty = 'blank',
                 col=c("#000000", '#000000', '#000000'),
                 fill = c("#edf8b1",'#7fcdbb','#2c7fb8'),
                 #fill = c("#a6cee3",'#1f78b4','#b2df8a'),
                 
                 # Numbers
                 cex = 3.2,
                 fontface = "bold",
                 fontfamily = "sans",
                 
                 # Set names
                 cat.cex = 3.8,
                 cat.fontface = "bold",
                 cat.default.pos = "text",
                  cat.pos = c(-27, 37, 355),
                 #cat.dist = c(0.055, 0.055, -0.035),
                 cat.fontfamily = "sans",
                 rotation = 1,
                 rotation.degree=-60)
              


# 
# library(eulerr)
# vennlist<-euler(c("A" = 11491, "B" = 2964, "C" = 5291, "A&B" = 1345, "B&C" = 519, "A&C" = 2139, "A&B&C" = 447))
# plot(vennlist, quantities = TRUE, fills=c('#f7fcf0','#e0f3db','#ccebc5','#a8ddb5','#7bccc4','#4eb3d3','#2b8cbe','#0868ac','#084081'),
#      labels = list(labels = c("Frodo", "Sam", "Merry"),
#                    font = 1:3,
#                    col = c("red","blue","white"),
#                    cex = seq(1, 1.5, length.out = 4)))
# 




# Sector pie chart
m = list(
  l = 50,
  r = 180,
  b = 180,
  t = 180,
  pad = 100
)

sector = c("Biotechnology","Computer\nSoftware","IT Services","Consumer\nProduct\nand Services","Electronics/\nInstrumentation","Industrial/Energy","Medical Devices\n and Equipment","Multisector","Telecommunications")
count = c(822,1839,2267,1130,444,4014,971,331,515)
percent=c("7%","15%","18%","9%","4%","33%","8%","3%","4%")
#counttext = c("(822)","(1,839)","(2,267)","(1,130)","(444)","(4,014)","(971)","(331)","(515)")

colors <- c('#f7fcf0','#e0f3db','#ccebc5','#a8ddb5','#7bccc4','#4eb3d3','#2b8cbe','#0868ac','#084081')

data = as.data.frame(cbind(sector, count))
data$count = as.numeric(as.character(data$count))

p <- plot_ly(width=1800, height=1300, data, labels = ~sector, values = ~count, type = 'pie',
             textposition = ifelse(sector=="Industrial/Energy",'inside',ifelse(sector=="IT Services","inside",ifelse(sector=="Computer\nSoftware","inside",'outside'))),
             textinfo = 'label+text', text=paste(percent),rotation= 45, marker = list(colors = colors,
                                                                                                                                                                                                                                                   line = list(color = '#000000', width = 2)), sort=F) %>%
  layout(title = '',
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE)) %>%
  layout(showlegend = FALSE, autosize=F, margin=m,font=list(size = 38))

p
