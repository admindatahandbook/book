# Author: Jim Shen
# Description: Print the author names at the top of each chapter 
#              by pulling the information from the appropriate
#              section of config.yml

printauthor<-function(chapter,debug=FALSE){
  
  authorlist <- config::get(chapter)$authors
  
  authors.and <- ""

  for(i in 1:length(authorlist)){
    author <- authorlist[i]
    authorinfo <- eval(parse(text=paste0("config$contributor$",author)))
    name <- authorinfo$name
    inst <- authorinfo$inst

  # output to HTML document
  if (knitr::is_html_output()) {
    nameinst=paste0("*",name," (",inst,")*  \n")
    cat(nameinst)
  }

    if ( debug ) { print(i) }
    # collect names for citation
    if ( i == 1 ) {
      authors.and <- name
    }
    if ( debug ) { print(authors.and)}

    if ( length(authorlist) > 2 ) {
      authors.and <- paste0(authors.and,",")
    }
    if ( debug ) { print(authors.and)}

    if ( length(authorlist) > 1 & i > 1 ) {
      authors.and <- paste0(authors.and," and")
    }
    if ( debug ) { print(authors.and)}

    if ( i <= length(authorlist) & i > 1 ) {
      authors.and <- paste(authors.and,name)
    }
    if ( debug ) { print(authors.and)}
  }

  # The publication is read from the config file. We might also read the DOI from there.
  pubdate <- config$first_publish_date %>%  str_split_fixed(" ",2) 



  if (knitr::is_html_output()) {
    cat(readLines("./includes/citation-block-link.html"))
    cat('<div id="myCitation" style="display: none;">')
    cat(paste0(authors.and,". ",pubdate[2],". ","\"<span id=\"chapTitle\">Title</span>.\" In: "))
    cat(paste0(config$editors," (eds), *",config$title,"*. Accessed at <span id=\"thisURL\"></span> on <span id=\"todayDate\"></span>."))
    cat('</div>')
  }

  if (knitr::is_latex_output()) {
    # not defined yet
    # citation info should go into the footnote on the title page
    # possibly something like 
  }

}