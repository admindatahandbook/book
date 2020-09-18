# Author: Jim Shen
# Description: Print the author names at the top of each chapter 
#              by pulling the information from the appropriate
#              section of config.yml

printauthor<-function(chapter){
  
  authorlist <- c("config$",chapter,"$authors")
  authorlist <- paste(authorlist, sep=" ",collapse="")
  authorlist <- eval(parse(text=authorlist))
  
  for(author in authorlist){
    name <- c("config$contributor$",author,"$name")
    name <- paste(name, sep=" ", collapse="")
    name <- eval(parse(text=name))
    
    inst <- c("config$contributor$",author,"$inst")
    inst <- paste(inst, sep=" ", collapse="")
    inst <- eval(parse(text=inst))
    
    nameinst=paste0("*",name," (",inst,")*  \n")
    
    cat(nameinst)
  }
}