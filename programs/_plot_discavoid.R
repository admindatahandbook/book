# Read in the spreadsheet, and write it out as CSV
discavoidtable <- head(read_ods("./assets/discavoid/summary_methods.ods"),12)
discavoidtable[is.na(discavoidtable)] <- " "
write_csv(discavoidtable,"./assets/discavoid/discavoid_table1.csv")

