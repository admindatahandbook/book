# Author: Lars Vilhuber
# Description: This will generate various plots and tables
#     for the PCRI chapter


# Summary Table

pcritable1.csv <- read_delim("./assets/pcri/pcri-vendors.csv", 
                               ";", escape_double = FALSE, trim_ws = TRUE)
pcritable1<-function() {
   pcritable1.csv %>%
   kable(format.args = list(big.mark = ",")) %>%
   kable_styling(full_width = F)  %>%
    row_spec(nrow(pcritable1.csv),bold=T) %>%
    footnote(general="As of 2015. Source: @jeng2015.")
}

