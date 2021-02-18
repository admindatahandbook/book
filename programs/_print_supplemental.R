# Author: Jim Shen
# Description: Print the supplemental materials section
#              by pulling the information from the appropriate
#              section of config.yml

printsupp<-function(chapter,debug=FALSE){
  webinar <- config::get(chapter)$webinar
  slides <- config::get(chapter)$slides
  webinardate <- config::get(chapter)$webinardate
  authorlist <- config::get(chapter)$authors
  
  if (length(authorlist)==1) {
    if (length(webinar)!=0) {
      cat("## Supplemental Materials {-} \n")
    }
    if (length(webinar)!=0 & length(slides)!=0) {
      cat(paste0("This chapter was presented by the author as a webinar on ",webinardate,". A [recording of the webinar](",webinar,") and [slides](",slides,") are available. \n"))
    }
    if (length(webinar)!=0 & length(slides)==0) {
      cat(paste0("This chapter was presented by the author as a webinar on ",webinardate,". A [recording of the webinar](",webinar,") is available. \n"))
    }
    if (length(webinar)!=0 | length(slides)!=0) {
      cat(" \n")
    }
  }
  if (length(authorlist)>1) {
    if (length(webinar)!=0) {
      cat("## Supplemental Materials {-} \n")
    }
    if (length(webinar)!=0 & length(slides)!=0) {
      cat(paste0("This chapter was presented by the authors as a webinar on ",webinardate,". A [recording of the webinar](",webinar,") and [slides](",slides,") are available. \n"))
    }
    if (length(webinar)!=0 & length(slides)==0) {
      cat(paste0("This chapter was presented by the authors as a webinar on ",webinardate,". A [recording of the webinar](",webinar,") is available. \n"))
    }
    if (length(webinar)!=0 | length(slides)!=0) {
      cat(" \n")
    }
  }
}