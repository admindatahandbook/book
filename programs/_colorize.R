# Author: Jim Shen
# Description: generate colored text
# Note: color inputs must be hex values in the format of #0A1B2C

colorize <- function(x, color) {
  if (knitr::is_latex_output()) {
    color<-substr(color,2,7)
    sprintf("\\textcolor[HTML]{%s}{%s}", color, x)
  } else if (knitr::is_html_output()) {
    sprintf("<span style='color: %s;'>%s</span>", color, x)
  } else x
}
