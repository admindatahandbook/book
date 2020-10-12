# Author: Jim Shen
# Description: Print the author names at the top of each chapter 
#              by pulling the information from the appropriate
#              section of config.yml

printauthor<-function(chapter,debug=FALSE){

  my_is_latex_output <- function(debug=FALSE) {
    if (debug) {
      return(TRUE)
    } else {
      return(knitr::is_latex_output())
    }
  }
  
  authorlist <- config::get(chapter)$authors
  
  authors.and <- ""

    if (my_is_latex_output(debug)) {
    # prepare author list for latex
    cat(paste0("\\printchapterauthor{%\n"))
    cat("\\begin{authorlist}\n")
    
    }


  for(i in 1:length(authorlist)){
    if ( debug ) { print(i) }
 
    author <- authorlist[i]
    authorinfo <- eval(parse(text=paste0("config$contributor$",author)))
    name <- authorinfo$name
    inst <- authorinfo$inst
    nameinst=paste0(name," (",inst,")")
    if ( debug ) { print(paste0("nameinst=",nameinst)) }
    

  # output to HTML document
  if (knitr::is_html_output()) {
    cat(paste0("*",nameinst,"*  \n"))
    }
# output to LaTeX document
  if (my_is_latex_output(debug)) {
    if ( debug ) { print("Output of nameinst") }
    cat(paste0("  ",nameinst,"  \\\\\n"))
    }

     # collect names for citation
  if ( i == 1 ) {
      authors.and <- name
    }
  if ( debug ) { print(authors.and)}

  if ( length(authorlist) > 1 & i>1 ) {
      if (debug) { print("authorlist>2 not i=1, adding comma")}
      authors.and <- paste0(authors.and,",")
    }
  if ( debug ) { print(authors.and)}

  if ( length(authorlist) > 1 & i == length(authorlist) ) {
      if (debug) { print("authorlist>1 and i at end, adding and")}
      authors.and <- paste0(authors.and," and")
    }
  if ( debug ) { print(authors.and)}

  if ( i <= length(authorlist) & i > 1 ) {
      if (debug) { print("print name")}
      authors.and <- paste(authors.and,name)
    }
  if ( debug ) { print(authors.and)}
    # create the comma version
    if (debug) { print("Create the comma version")}
    authors.comma <- str_replace(authors.and," and "," ")
    if (debug) { print(authors.comma)}
  } 
# end of length(authorlist)

  # The publication is read from the config file. We might also read the DOI from there.
  pubdate <- config$first_publish_date %>%  str_split_fixed(" ",2) 



  if (knitr::is_html_output()) {
    cat(readLines("./includes/citation-block-link.html"))
    cat('<div id="myCitation" style="display: none;">')
    cat(paste0(authors.and,". ",pubdate[2],". ","\"<span id=\"chapTitle\">Title</span>.\" In: "))
    cat(paste0(config$editors," (eds), *",config$title,"*. Accessed at <span id=\"thisURL\"></span> on <span id=\"todayDate\"></span>."))
    cat('</div>')
  }

  if (my_is_latex_output(debug)) {
    # finishing up the latex version
    cat(paste0("\\end{authorlist}}\n"))
    cat(paste0("\\authortoc{",authors.comma,"}\n"))
    cat("\\hrulefill\n")


  }

}