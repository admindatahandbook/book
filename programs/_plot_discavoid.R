# Read in the spreadsheet, and write it out as CSV
discavoidtable <- head(read_ods("./assets/discavoid/summary_methods.ods"),12)
discavoidtable[is.na(discavoidtable)] <- " "
outcsv <- "./tables/discavoid/discavoid_table1.csv"

if ( ! file.exists(outcsv) ) { 
    write_csv(discavoidtable,outcsv)
}

