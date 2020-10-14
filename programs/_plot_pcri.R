# Author: Lars Vilhuber
# Description: This will generate various plots and tables
#     for the PCRI chapter


# Summary Table

pcritable1.csv <- read_delim("./assets/pcri/pcri-vendors.csv", 
                               ";", escape_double = FALSE, trim_ws = TRUE)
pcritable2.csv <- read_delim("./assets/pcri/pcri-by-state.csv", 
                               ";", escape_double = FALSE, trim_ws = TRUE)
pcritablea1.csv <- read_delim("./assets/pcri/pcri-tablea1.csv", 
                              ";", escape_double = FALSE, trim_ws = TRUE)
pcritablea2.csv <- read_delim("./assets/pcri/pcri-tablea2.csv", 
                              ";", escape_double = FALSE, trim_ws = TRUE)
pcritablea3.csv <- read_delim("./assets/pcri/pcri-tablea3.csv", 
                              ";", escape_double = FALSE, trim_ws = TRUE)



