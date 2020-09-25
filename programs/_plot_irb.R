# Author: Jim Shen
# Description: This will generate various plots for the IRB chapter.

# Table 1

irbt1data <- data.frame(
  rev = c("Exempt", 
          "Expedited",
          "Full Board"),
  reg = c("Ethical principles of Belmont (respect for persons, beneficence, and justice)",
          "Belmont and 45 CFR 46.111",
          "Belmont and 45 CFR 46.111"),
  risk = c("Minimal risk (often anonymous or deidentified data)",
           "Minimal risk (identifiable, personal or sensitive information)",
           "Greater than minimal risk (could include minimal risk research that does not fit in exempt or expedited review categories)"),
  des = c("Briefer application and typically reviewed in the IRB office",
          "Reviewed in the office by one or more IRB members. If expedited reviewer does not approve, the study may go to the full board",
          "All studies involving prisoners and certain research with vulnerable populations regardless of risk such as children, fetuses, and neonates. Projects can only be disapproved at a convened meeting"))

irbtable1<-function(){
  pander::pander(irbt1data,
                 keep.line.breaks = TRUE,
                 style = 'grid',
                 justify = 'left',
                 split.cells = c(10,15,15,20),
                 col.names = c("Review Type",
                               "Regulatory Authority",
                               "Risk",
                               "Description"),
                 caption = '(\\#tab:irbtable1) Categories of review conducted by an IRB.')
}
