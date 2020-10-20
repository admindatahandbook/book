# Author: Jim Shen
# Description: This will generate various plots for the OLDA chapter.

# Table 1

# oldat1data <- data.frame(
#   agency = c("Ohio Department of Job and Family Services", 
#              "Ohio Department of Higher Education",
#              "Ohio Department of Education",
#              "Ohio Housing Finance Agency", 
#              "Opportunities for Ohioans with Disabilities"),
#   datasets = c("* Unemployment Insurance Wage Data\ \n* Quarterly Census on Wages and Employment\ \n* Job Seeker Information\ \n* Workforce Investment Act Standardized Record Data\ \n* Unemployment Insurance Claimant Data",
#                "* Higher Education Information (Student, Course, and Faculty)\ \n* Ohio Technical Centers\ \n* Adult Basic and Literacy Education",
#                "Education Management Information System",
#               "Ohio Housing Tenant Files",
#               "Vocational Rehabilitation"),
#   years = c("From 1995 to present (varies based on files)",
#             "From 1999 to present (varies based on files)",
#             "From 2001 to present (varies based on table)",
#             "From 2014 to present",
#             "From 2011 to present"),
#   records = c("130 million wage records",
#               "2 million unique students in higher education",
#               "1.8 million unique students in K12 education",
#               "200,000 unique individuals",
#               "100,000 unique individuals"))


oldat1data <- data.frame(
  agency = c("Ohio Department of Job and Family Services", 
             "Ohio Department of Higher Education",
             "Ohio Department of Education",
             "Ohio Housing Finance Agency", 
             "Opportunities for Ohioans with Disabilities"),
  datasets = c("<li>Unemployment Insurance Wage Data</li><li>Quarterly Census on Wages and Employment</li><li>Job Seeker Information</li><li>Workforce Investment Act Standardized Record Data</li><li>Unemployment Insurance Claimant Data</li>",
               "<li>Higher Education Information (Student, Course, and Faculty)</li><li>Ohio Technical Centers</li><li>Adult Basic and Literacy Education</li>",
               "Education Management Information System",
               "Ohio Housing Tenant Files",
               "Vocational Rehabilitation"),
  years = c("From 1995 to present (varies based on files)",
            "From 1999 to present (varies based on files)",
            "From 2001 to present (varies based on table)",
            "From 2014 to present",
            "From 2011 to present"),
  records = c("130 million wage records",
              "2 million unique students in higher education",
              "1.8 million unique students in K12 education",
              "200,000 unique individuals",
              "100,000 unique individuals"))

oldatable1<-function(){
  kable(oldat1datatest, format="html", booktabs=T, escape=F, 
        col.names = c("Agency", "Datasets", "Years Available", "Records"),
        caption = "Specific files maintained at the Ohio State University") %>%
    footnote(general="The full list of data files is maintained on the Ohio Longitudinal Data Archive website and changes over time. This is a selected list of core data holdings", footnote_as_chunk = T)
}

# Table 2

oldat2data <- data.frame(
  study = c("Program evaluations",
            "Descriptive and multivariate studies"),
  title = c("<li>Wage Pathway Evaluation Study [@hawley2019]</li><li>Ohio TechNet TAACCC Grant Evaluation [@newgrowthgrouptheohioeducationresearchcenter2018]</li><li>GEAR UP Evaluation<sup>1</sup></li>",
            "<li>College Credit Plus [@harlow2018]</li><li>Academic Momentum and Undergraduate Student Attrition [@kondratjeva2017]</li>"))

oldatable2<-function(){
  kable(oldat2data, format="html", booktabs=T, escape=F,
        col.names = c("Type of Study","Example Project Title"),
        caption = "Example approved studies using the Ohio Longitudinal Data") %>%
        footnote(number=c("This project is not finished, but it is described on the [website](https://www.ohiohighered.org/gearup)"))
  }