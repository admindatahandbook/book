# Author: Jim Shen
# Description: Print the supplemental materials section
#              by pulling the information from the appropriate
#              section of config.yml

printsupp<-function(chapter,debug=FALSE){
  webinar <- config::get(chapter)$webinar
  slides <- config::get(chapter)$slides
  
  if (length(webinar)!=0 | length(slides)!=0) {
    cat("## Supplemental Materials {-} \n")
  }
  if (length(webinar)!=0) {
    cat(paste0("The webinar video can be found [here](",webinar,"). \n"))
  }
  if (length(slides)!=0) {
    cat(paste0("The webinar slides can be found [here](",slides,"). \n"))
  }
  if (length(webinar)!=0 | length(slides)!=0) {
    cat(" \n")
  }
}