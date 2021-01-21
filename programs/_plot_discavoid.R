# # Read in the spreadsheet, and write it out as CSV
# discavoidtable <- head(read_ods("./assets/discavoid/summary_methods.ods"),12)
# discavoidtable[is.na(discavoidtable)] <- " "
# outcsv <- "./tables/discavoid/discavoid_table1.csv"
# 
# if ( ! file.exists(outcsv) ) { 
#     write_csv(discavoidtable,outcsv)
# }
# 
#library(kableExtra)
discavoidt1data<-data.frame(example=c("IAB On-Site Access",
                                      "IAB Scientific Use Files",
                                      "OLDA",
                                      "NB-IRDT",
                                      "PCRI",
                                      "Aurora Public-Use File",
                                      "Stanford-SFUSD",
                                      "City of Cape Town",
                                      "DIME (World Bank)",
                                      "Survey of Consumer Finances",
                                      "American Community Survey",
                                      "Quarterly Workforce Indicators"),
                            handbook=c("Yes",
                                       "Yes",
                                       "Yes",
                                       "Yes",
                                       "Yes",
                                       "Yes",
                                       "Yes",
                                       "Yes",
                                       "Yes",
                                       "No",
                                       "No",
                                       "No"),
                            direct=c("Yes",
                                     "Yes",
                                     "Yes",
                                     "Yes",
                                     "Yes",
                                     "Yes",
                                     "Partial",
                                     "Partial",
                                     "Partial",
                                     "Yes",
                                     "Yes",
                                     "Yes"),
                            quasi=c("No",
                                    "Yes",
                                    "Partial",
                                    "---",
                                    "---",
                                    "Partial",
                                    "Yes",
                                    "---",
                                    "Yes",
                                    "---", 
                                    "---",
                                    "No"),
                            suppression=c("Yes",
                                          "Yes",
                                          "Yes",
                                          "Yes",
                                          "No",
                                          "Yes",
                                          "Yes",
                                          "---",
                                          "---",
                                          "Yes",
                                          "No",
                                          "Yes"),
                            coarsening=c("Yes",
                                         "Yes",
                                         "Yes",
                                         "Yes",
                                         "---",
                                         "Yes",
                                         "No",
                                         "Yes",
                                         "---",
                                         "Yes",
                                         "Yes",
                                         "Yes"),
                            swapping=c("No",
                                       "No",
                                       "No",
                                       "No",
                                       "No",
                                       "No",
                                       "No",
                                       "---",
                                       "---",
                                       "No",
                                       "Yes",
                                       "No"),
                            sampling=c("Yes",
                                       "Yes",
                                       "No",
                                       "No",
                                       "No",
                                       "No",
                                       "No",
                                       "No",
                                       "---",
                                       "Yes",
                                       "Yes",
                                       "No"),
                            noise=c("No",
                                    "No",
                                    "No",
                                    "No",
                                    "No",
                                    "No",
                                    "No",
                                    "No",
                                    "No",
                                    "No",
                                    "No",
                                    "Yes"),
                            synthetic=c("No",
                                        "No",
                                        "No",
                                        "No",
                                        "No",
                                        "No",
                                        "No",
                                        "---",
                                        "---",
                                        "Yes",
                                        "Partial",
                                        "No"))

column=c("handbook","direct","quasi","suppression","coarsening","swapping","sampling","noise","synthetic")

for(i in column) {
  # discavoidt1data[,i]<-gsub("Yes", paste("<img src='./assets/discavoid/yesweb.png'>"),discavoidt1data[,i])
  # discavoidt1data[,i]<-gsub("Partial", paste("<img src='./assets/discavoid/partialweb.png'>"),discavoidt1data[,i])
  # discavoidt1data[,i]<-gsub("No", paste("<img src='./assets/discavoid/noweb.png'>"),discavoidt1data[,i])
  discavoidt1data[,i]<-gsub("Yes",paste("![](./assets/discavoid/yesweb.png)"),discavoidt1data[,i])
  discavoidt1data[,i]<-gsub("Partial",  paste("![](./assets/discavoid/partialweb.png)"),discavoidt1data[,i])
  discavoidt1data[,i]<-gsub("No", paste("![](./assets/discavoid/noweb.png)"),discavoidt1data[,i])
}

# discavoidt1display<-discavoidt1data
# 
# for(i in column) {
#   discavoidt1display[,i]<-gsub("Yes","",discavoidt1display[,i])
#   discavoidt1display[,i]<-gsub("No","",discavoidt1display[,i])
#   discavoidt1display[,i]<-gsub("Partial","",discavoidt1display[,i])
#   discavoidt1display[,i]<-gsub("---","",discavoidt1display[,i])
# }


discavoidtable1<-function(){
  knitr::kable(discavoidt1data, booktabs=T, escape=F, caption="Summary of SDL methods",
      col.names = c("","In this \nHand-\nbook",
                    "Remov-\nal of \nDirect \nIdenti-\nfiers",
                    "Remov-\nal of \nQuasi-\nIdenti-\nfiers",
                    "Supp-\nress-\nion",
                    "Coars-\nening",
                    "Swapp-\ning",
                    "Sampl-\ning",
                    "Noise Infus-\nion",
                    "Synth-\netic Data")) %>%
  kable_styling(full_width = F) %>%
    footnote(general="![](./assets/discavoid/yesweb.png) = Yes, ![](./assets/discavoid/partialweb.png) = Partially, ![](./assets/discavoid/noweb.png) = No, --- = No Info", footnote_as_chunk = T)
}