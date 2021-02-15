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
    # number of tokens in name
    nnames <- length(strsplit(name," ")[[1]])
    # get lastname from config or from name
    lastname <- authorinfo$lastname
    if ( is.null(lastname) ) { lastname = strsplit(name," ")[[1]][nnames]}
    # get firstname by blanking lastname
    firstname <- trimws(gsub(lastname,"",name))
    # got all names!
    inst <- authorinfo$inst
    #justfordanny
    title <-authorinfo$title
    if (length(title)==0) {
    nameinst=paste0(name," (",inst,")")
    }
    else {
      nameinst=paste0(name,"  \n",title,"  \n",inst)
    }
    if ( debug ) { print(paste0("nameinst=",nameinst)) }
    

  # output to HTML document / Ebook
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
      authors.cmos <- paste0(lastname,", ",firstname)
      authors.sup <- ""
    }
  if ( debug ) { print(authors.and)}

  if ( length(authorlist) > 2 & i>1 ) {
      if (debug) { print("authorlist>2 not i=1, adding comma")}
      authors.sup <- paste0(authors.sup,",")
    }
  if ( debug ) { print(authors.sup)}

  if ( length(authorlist) > 1 & i == length(authorlist) ) {
      if (debug) { print("authorlist>1 and i at end, adding and")}
      authors.sup <- paste0(authors.sup," and")
    }
  if ( debug ) { print(authors.sup)}

  if ( i <= length(authorlist) & i > 1 ) {
      if (debug) { print("print name")}
      authors.sup <- paste(authors.sup,name)
    }
  } # end of length(authorlist)

  # construct final cmos and and version
  if (length(authorlist) == 2 ) { authors.cmos <- paste0(authors.cmos,", ",authors.sup) }
  if (length(authorlist) >  2 ) { authors.cmos <- paste0(authors.cmos,authors.sup) }
  authors.and  <- paste0(authors.and,authors.sup)

  if ( debug ) { print(authors.sup)}

  # create the comma version
  if (debug) { print("Create the comma version")}

  if ( length(authorlist) == 1 ) authors.comma <- authors.and
  if ( length(authorlist) == 2 ) authors.comma <- str_replace(authors.and," and ",", ")
  if ( length(authorlist) > 2  ) authors.comma <- str_replace(authors.and," and "," ")
 
  # handle copyright
  copyright <- config::get(chapter)$copyright
  copyright.default = TRUE
  if ( is.null(copyright)) { 
    copyright.default = FALSE
    copyright <- authors.comma
  }

  # handle license
  license.chapter <- config::get(chapter)$license
  if (is.null(license.chapter)) {
    license.chapter <- config::get()$license
  }
  # address cc licenses
  license.cc <- ""
  if ( tolower(substr(license.chapter,1,2)) == "cc") {
    license.cc <- substr(license.chapter,4,nchar(license.chapter))
  }

  # debug
  if (debug) { 
    print("finished")
    print(authors.comma)
    print(authors.cmos)
    print(authors.and)
    print(copyright)
    print(license.chapter)
    print(license.cc)
    }



  # The publication is read from the config file. We might also read the DOI from there.
  pubdate <- config$first_publish_date %>%  str_split_fixed(" ",2) 


  # The citation thing is only output to the HTML
  if ( outputformat == "html" ) {
    cat(readLines("./includes/citation-block-link.html"))
    cat('<div id="myCitation" style="display: none;">')
    cat(paste0(authors.cmos,". ",pubdate[2],". ","\"<span id=\"chapTitle\">Title</span>.\" In: "))
    cat(paste0(config$editors," (eds), *",config$title,"*. Accessed at <span id=\"thisURL\"></span> on <span id=\"todayDate\"></span>.<br />"))
    cat(paste0("<span class=\"copyright\">©️ ",copyright,". Licensed under "))
    if ( license.cc != "" ) {
      cat(paste0("<a href=\"https://creativecommons.org/licenses/",license.cc,"/4.0/\"><img alt=\"",toupper(license.chapter)," logo\" src=\"assets/",license.chapter,".png\" height=\"12\"/></a>"))
    } else {
      cat(paste0(toupper(license.chapter)))
    }
    cat(paste0(".</span>"))
    cat('</div>')
  }
  # If this is for the ebook, do this:
  if ( outputformat == "epub3" ) {
    if ( copyright.default == FALSE ) {
      cat('<div id="myCitation" style="display: block;">')
      cat(paste0("<span class=\"copyright\">©️ ",copyright,". "))
      if ( license.cc != "" ) {
        cat("Licensed under ")
        cat(paste0("<a href=\"https://creativecommons.org/licenses/",license.cc,"/4.0/\"><img alt=\"",toupper(license.chapter)," logo\" src=\"assets/",license.chapter,".png\" height=\"12\"/></a>"))
      } else {
      # do nothing in ebook
      #cat(paste0(toupper(license.chapter)))
      }
      cat(paste0(".</span>"))
      cat('</div>')
    }
  }
  

  if (my_is_latex_output(debug)) {
    # finishing up the latex version
    cat(paste0("\\end{authorlist}}\\authorfootnote{",authors.cmos,"}{",authors.and,"}{",chapter,"}\n"))
    cat(paste0("\\authortoc{",authors.comma,"}\n"))
    cat("\\hrulefill\n")


  }

}