# Author: Jim Shen
# Description: Print the author names at the top by calling 
#              the appropriate section from the front matter
#              from index.Rmd, supplying the appropriate yaml
#              section as the argument for the function

printauthor<-function(yamlsection){
  sectionauthors <- rmarkdown::yaml_front_matter(knitr::current_input())
  x<- c("sectionauthors$chapterauthors$", yamlsection)
  printthis<-paste(x, sep=" ", collapse="")
  print(eval(parse(text=printthis)))
}