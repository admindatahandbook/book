# Author: Jim Shen
# Description: This will generate various plots for the OLDA chapter.

# Table 1

oldat1data <- data.frame(
  agency = c("Ohio Department of Job and Family Services", 
             "Ohio Department of Higher Education",
             "Ohio Department of Education",
             "Ohio Housing Finance Agency", 
             "Opportunities for Ohioans with Disabilities"),
  datasets = c("* Unemployment Insurance Wage Data\ \n* Quarterly Census on Wages and Employment\ \n* Job Seeker Information\ \n* Workforce Investment Act Standardized Record Data\ \n* Unemployment Insurance Claimant Data",
               "* Higher Education Information (Student, Course, and Faculty)\ \n* Ohio Technical Centers\ \n* Adult Basic and Literacy Education",
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
  pander::pander(oldat1data,
                 keep.line.breaks = TRUE,
                 style = 'grid',
                 justify = 'left',
                 split.cells = c(10,26,12,12),
                 col.names = c("Agency",
                               "Datasets^[The full list of data files is maintained on the Ohio Longitudinal Data Archive website and changes over time. This is a selected list of core data holdings.]",
                               "Years Available",
                               "Records"),
                 caption = '(\\#tab:oldatable1) Specific files maintained at the Ohio State University')
}


# Table 2

oldat2data <- data.frame(
  study = c("Program evaluations",
            "Descriptive and multivariate studies"),
  title = c("* Wage Pathway Evaluation Study [@hawley2019]\ \n* Ohio TechNet TAACCC Grant Evaluation [@newgrowthgrouptheohioeducationresearchcenter2018]\ \n* GEAR UP Evaluation[^olda8]",
            "* College Credit Plus [@harlow2018]\ \n* Academic Momentum and Undergraduate Student Attrition [@kondratjeva2017]"))

oldatable2<-function(){
  pander::pander(oldat2data,
                 keep.line.breaks = TRUE,
                 style = 'grid',
                 justify = 'left',
                 split.cells = c(20,25),
                 col.names = c("Type of Study","Example Project Title"),
                 caption = '(\\#tab:oldatable2) Example approved studies using the Ohio Longitudinal Data')
  }