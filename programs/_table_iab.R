# Author: Jim Shen
#
# Description: This program generates tables for the IAB chapter.
# This was separated out from _plot_iab.R to avoid having to
# re-generate the figures every time we build  the book.

# Table 1

#library(kableExtra)

iabt1data <- data.frame(
  Items = c("Population / Sample Size","Time Period covered and frequency","Additional information","Population / Sample Size", 
            "Time Period covered and frequency",
            "Additional information",
            "Population / Sample Size", 
            "Time Period covered and frequency",
            "Additional information"),
  Features = c(
    "2 percent random sample (more than 1.8 million individuals) of the Integrated Employment Biographies, a database which includes records from:<br>- 1975 onwards: employment subject, receipt of benefits in accordance with Social Code Act III<br>- 1999 onwards: Marginal part-time employment<br>- 2000 onwards: participation in an employment or training measure<br>- 2007 onwards: Registered jobseeker",
    "1975 until 2017 for West Germany, 1992 until 2017 for East Germany, updated every 2nd year by RDC-IAB", 
    "DOI: [10.5164/IAB.SIAB7517.de.en.v1](https://doi.org/10.5164/IAB.SIAB7517.de.en.v1)",
    "Repeated cross-sectional dataset (640,000-1.5 million establishments) on June 30, on all establishments with at least one employee liable to social security (until 1988) and/or at least one marginal worker (since 1999), and thereof a 50 percent random sample",
    "1975 until 2018 for West Germany, 1992 until 2018 for East Germany, annual updated by RDC-IAB",
    "DOI: [10.5164/IAB.BHP7518.de.en.v1](https://doi.org/10.5164/IAB.BHP7518.de.en.v1)",
    "Worker information from administrative data are linked to the IAB-Establishment Panel, an annual representative survey since 1993 in West Germany and 1996 in East Germany including approx. 16,000 establishments per year.<br>
    Stratified sample of all establishments with at least one employee liable to social security on June 30 of the year before by establishment size, industry, and federal state. There are two versions of LIAB:<br>- LIAB cross-sectional model: all establishment surveys combined with administrative worker data as of June 30 (establishment: 67,407 in total; individuals approx. 12.5 million in total)<br>- LIAB longitudinal model: selection of repeatedly interviewed establishments (2009-2016) combined with longitudinal worker biographies (establishment: 41,777 in total; individuals approx. 1.7 million in total)",
    "LIAB Cross-sectional model: 1993-2017<br>LIAB longitudinal model: 1975-2017",
    "DOI: [10.5164/IAB.LIABQM29317.de.en.v1](https://doi.org/10.5164/IAB.LIABQM29317.de.en.v1)<br>DOI: [10.5164/IAB.LIABLM7517.de.en.v1](https://doi.org/10.5164/IAB.LIABLM7517.de.en.v1)"
  )
)

# 
# iabt1latexdata <- data.frame(
#   Items = c("Population / Sample Size","Time Period covered and frequency","Additional information","Population / Sample Size", 
#             "Time Period covered and frequency",
#             "Additional information",
#             "Population / Sample Size", 
#             "Time Period covered and frequency",
#             "Additional information"),
#   Features = c(
#     "2 percent random sample (more than 1.8 million individuals) of the Integrated Employment Biographies, a database which includes records from:<br>- 1975 onwards: employment subject, receipt of benefits in accordance with Social Code Act III<br>- 1999 onwards: Marginal part-time employment<br>- 2000 onwards: participation in an employment or training measure<br>- 2007 onwards: Registered jobseeker",
#     "1975 until 2017 for West Germany, 1992 until 2017 for East Germany, updated every 2nd year by RDC-IAB", 
#     "DOI: 10.5164/IAB.SIAB7517.de.en.v1",
#     "Repeated cross-sectional dataset (640,000-1.5 million establishments) on June 30, on all establishments with at least one employee liable to social security (until 1988) and/or at least one marginal worker (since 1999), and thereof a 50 percent random sample",
#     "1975 until 2018 for West Germany, 1992 until 2018 for East Germany, annual updated by RDC-IAB",
#     "DOI: 10.5164/IAB.BHP7518.de.en.v1",
#     "Worker information from administrative data are linked to the IAB-Establishment Panel, an annual representative survey since 1993 in West Germany and 1996 in East Germany including approx. 16,000 establishments per year<br>
#     Stratified sample of all establishments with at least one employee liable to social security on June 30 of the year before by establishment size, industry, and federal state. There are two versions of LIAB:<br>- LIAB cross-sectional model: all establishment surveys combined with administrative worker data as of June 30 (establishment: 67,407 in total; individuals approx. 12.5 million in total)<br>- LIAB longitudinal model: selection of repeatedly interviewed establishments (2009-2016) combined with longitudinal worker biographies (establishment: 41,777 in total; individuals approx. 1.7 million in total)",
#     "LIAB Cross-sectional model: 1993-2017<br>LIAB longitudinal model: 1975-2017",
#     "DOI: 10.5164/IAB.LIABQM29317.de.en.v1<br>DOI: 10.5164/IAB.LIABLM7517.de.en.v1"
#   )
# )

iabtable1 <- function(){
  # if (is_html_output()) {
    iabt1data %>%
      kable("html", escape = F, caption="Selected RDC-IAB Data", col.names = NULL, booktabs=T) %>%
      kable_styling(full_width = F) %>%
      column_spec(1, width="10em") %>%
      #column_spec(2, width="25em") %>%
      pack_rows("Sample of Integrated Labour Market Biographies (SIAB)",1,3) %>%
      pack_rows("Establishment History Panel (BHP)",4,6) %>%
      pack_rows("Linked Employer-Employee Data (LIAB)",7,9) %>%
      footnote(general="The time period covered by each data set represents the status as of 02 June 2020. For a complete list of all data products see the [RDC website](https://fdz.iab.de/en/FDZ_Overview_of_Data.aspx).", footnote_as_chunk = T, general_title = "Notes: ")
}    
#   } else {
#     outfile <- "./assets/iab/iabtable1.tex"
#     if ( ! file.exists(outfile) ) {
#       iabt1latexdata <- data.frame(lapply(iabt1data, function(x) {gsub("<br>", "\n", x)}), stringsAsFactors = F)
#       
#       inMinipage <- function(x, width) 
#         paste0("\\begin{minipage}[t]{", 
#                width, 
#                "}\\raggedright\\setstretch{0.8}", 
#                x, 
#                "\\end{minipage}")
#       
#       
#       iabt1data[[1]] <- inMinipage(iabt1data[[1]], "2.5cm") 
#       
#       iabt1data %>%  
#         mutate_all(linebreak) %>%
#         kable("latex", escape = F, caption="Selected RDC-IAB data", col.names = NULL, booktabs=T) %>%
#         kable_styling(latex_options="scale_down") %>%
#         column_spec(1, width="10em") %>%
#         column_spec(2, width="25em") %>%
#         pack_rows("Sample of Integrated Labour Market Biographies (SIAB)",1,3) %>%
#         pack_rows("Establishment History Panel (BHP)",4,6) %>%
#         pack_rows("Linked Employer-Employee Data (LIAB)",7,9) %>%
#         footnote(general="The time period covered by each data set represents the status as of 02 June 2020. For a complete list of all data products see the RDC website: https://fdz.iab.de/en/FDZ_Overview_of_Data.aspx.", threeparttable=T)
#     } else {
#       # write to latex to include the file
#       cat(paste0("\\input{",outfile,"}"))
#     }
#   }
# }

# Table 2

iabt2data<-read.csv("./assets/iab/table2.csv")

iabtable2<-function(){
  knitr::kable(iabt2data, booktabs = TRUE,
               caption = "Number of publications in 2018, including all publications with RDC-IAB data (excluding Bachelor and Master theses)") %>%
    kable_styling(full_width = F) %>%
    add_indent(c(c(2)))
}