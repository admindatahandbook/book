# Author: Jim Shen
# Description: Print the author names at the top of each chapter 
#              by pulling the information from the appropriate
#              section of config.yml

printauthor<-function(chapter){
  
  authorlist <- c("config$",chapter,"$authors")
  authorlist <- paste(authorlist, sep=" ",collapse="")
  authorlist <- eval(parse(text=authorlist))
  
  for(author in authorlist){
    name1 <- c("config$contributor$",author,"$name")
    name2 <- paste(name1, sep=" ", collapse="")
    name3 <- eval(parse(text=name2))
    
    inst1 <- c("config$contributor$",author,"$inst")
    inst2 <- paste(inst1, sep=" ", collapse="")
    inst3 <- eval(parse(text=inst2))
    
    nameinst=paste0("*",name3,": ",inst3,"*  \n")
    
    cat(nameinst)
  }
}