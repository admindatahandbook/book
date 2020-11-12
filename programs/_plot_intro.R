# Author: Jim Shen
# Description: This will generate various plots for the intro chapter.

# infile <- "./assets/intro/introtable1.csv"
# introt1data<-read.csv(infile,sep=";")
# pdfdpi=600
# 
# # copy it for LaTeX if necessary
#     outcsv  <- gsub("assets","tables",infile)
#     if ( ! file.exists(outcsv) ) { file.copy(infile,outcsv) }
# 
# 
# introtable1<-function(){
#   knitr::kable(introt1data, booktabs = TRUE,
#                caption = "Descriptive Table of Chapters",
#                col.names = c("Name of Institution",
#                              "Chapter",
#                              "Type of Data Provider",
#                              "Data Intermediary/Data Holder",
#                              "Highlight")) %>%
#     kable_styling(full_width = F, font_size = 12) %>%
#     column_spec(1, width="10em") %>%
#     column_spec(2, width="5em") %>%
#     column_spec(3, width="10em") %>%
#     column_spec(4, width="20em") %>%
#     column_spec(5, width="30em")
# }


# Intro Table 1

# introt1data<-data.frame(
#   casestudy=c(
#     "**Chapter 11: Aurora Health Care**","Data provider: private company","Data access: data is directly transferred to the researchers","A proactive researcher team helped a private firm think through data protection and cleaning issues to enable a randomized control trial that measures sensitive health outcomes.",
#     "**Chapter 13: City of Cape Town (CCT)**","Data provider: city government","Data access: approved researchers access a server owned by the city government","A new data policy led to a productive cooperation between the City and academic researchers to create systematic data access.",
#     "**Chapter 14: Development Impact Evaluation (DIME), World Bank Group**","Data provider: variety of public and private partners","Data access: data is transferred directly to DIME","DIME's group of development economists and analysts apply best practices of research developed over time in partnerships with many different data providers."
#               )
# )
# 
# 
# introtable1<-function(){
#    knitr::kable(introt1data, booktabs = TRUE, caption = "Descriptive Table of Chapters", col.names = c("Case Study"))
# }



introt1data<-data.frame(
  casestudy=c(
    "Data provider: national government agency","Data access: varies by dataset, includes access to web-based remote submission, secure rooms at IAB and partnering universities, secure computers at universities.","A clear legal mandate allows RDC-IAB to distribute German labor market data through a sophisticated network of remote access points housed at national and international research institutions.",
    "Data provider: state agencies","Data access: research center at a public university provides data for download to approved users","A long-running and successful administrative data partnership that first emerged in 2007. In the last five years, 28 published studies have used data accessed through OLDA.",
    "Data provider: provincial government social protection agencies","Data access: research center at a public university provides access to approved users","A relatively new partnership that has seen rapid growth and expansion in the data that it makes available to researchers, with specific legal mandates for data access and sharing.",
    "Data provider: private firms and publicly available data","Data access: remote access to data stored at a university-affiliated data archive","Meticulous data cleaning work and relationship building in an industry that tends to be secretive, as well as sophisticated data protection policies, led to the creation of a comprehensive database on private capital.",
    "Data provider: private company","Data access: data is directly transferred to the researchers","A proactive researcher team helped a private firm think through data protection and cleaning issues to enable a randomized control trial that measures sensitive health outcomes.",
    "Data provider: school district","Data access: research center at a private university provides data for download to affiliated faculty","A well-established and mature partnership with streamlined application and review processes that hosts comprehensive data on students, teachers, and schools, and supports data access for multiple projects each year.",
    "Data provider: city government","Data access: approved researchers access a server owned by the city government","A new data policy led to a productive cooperation between the City and academic researchers to create systematic data access.",
    "Data provider: variety of public and private partners","Data access: data is transferred directly to DIME","DIME's group of development economists and analysts apply best practices of research developed over time in partnerships with many different data providers.",
    "Data provider: variety of international government partners","Data access: data is held by national governments or transferred directly to IMF","As part of its mandate, the IMF helps governments overhaul their tax records and systems and conduct research on the tax data.",
    "Data provider: national government agencies","Data access: data is held by the government or transferred directly to researchers","A long-term research partnership with the government enabled multiple nationally representative experiments to improve the targeting of social programs."
  )
)


introtable1<-function(){
  knitr::kable(introt1data, booktabs = TRUE, caption = "Descriptive Table of Chapters", col.names = NULL) %>%
    pack_rows(index = c("Chapter 7: Institute for Employment Research (RDC-IAB)" = 3,
                        "Chapter 8: Ohio Longitudinal Data Archive (OLDA)" = 3,
                        "Chapter 9: New Brunswick Institute for Research, Data, and Training (NB-IRDT)" = 3,
                        "Chapter 10: Private Capital Research Institute (PCRI)" = 3,
                        "Chapter 11: Aurora Health Care" = 3,
                        "Chapter 12: Stanford-San Francisco Unified School District (SFUSD) Partnership" = 3,
                        "Chapter 13: City of Cape Town (CCT)" = 3,
                        "Chapter 14: Development Impact Evaluation (DIME), World Bank Group" = 3,
                        "Chapter 15: International Monetary Fund (IMF)" = 3,
                        "Chapter 16: Government of Indonesia" = 3))
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
ggsave("./figures/intrograph1.png",intrograph1,dpi=300)
pdffile <- "./figures/intrograph1.pdf"
if ( ! file.exists(pdffile) ) {
  ggsave(pdffile,iabfigure1,dpi=pdfdpi)
}



