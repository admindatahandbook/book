# Run after each chapter

#if (knitr::is_latex_output()) {
   cat("% adding bibunits chapter bibliography\n")
   cat("\\putbib\n")
#}