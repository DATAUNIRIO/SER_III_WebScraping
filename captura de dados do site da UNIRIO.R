

library(XML)
library(rvest)
#url<-"https://www.fulljoin.com.br/posts/2018-10-24-classificando-comentrios-txicos/"
#library(RCurl)

url<-"http://www.unirio.br/"

html.doc <-rvest::html_session(url)
#html.doc <- getURL(url)  
#doc = htmlParse(html.doc, asText=TRUE)
#capture.output(doc, file="TESTE.html")

titulo<-html.doc %>%
  html_nodes('h2') %>%
  html_text()

texto<-html.doc %>%
  html_nodes('p') %>%
  html_text()

url<-"http://www.unirio.br/"
     "http://www.unirio.br/?b_start:int=20"
     "http://www.unirio.br/?b_start:int=40"
     "http://www.unirio.br/?b_start:int=980"
     
titulo<-tibble::tibble()
texto<-tibble::tibble()
SEQ  <- seq(20,980,by=20)
SEQ  <- seq(20,40,by=20)

library(dplyr)
for(i in SEQ){
  url<-paste0("http://www.unirio.br/?b_start:int=",as.character(i))
  html.doc <-rvest::html_session(url)
  titulo_provisorio<-html.doc %>%
    html_nodes('h2') %>%
    html_text()
  
  texto_provisorio<-html.doc %>%
    html_nodes('p') %>%
    html_text()
  
  titulo<-bind_rows(titulo,data.frame(titulo_provisorio))
  texto <-bind_rows(texto,data.frame(texto_provisorio))
  Sys.sleep(10)
  cat("\r", i, "de", 980)
}


library(tm)
library(wordcloud)
auxCorpus <- Corpus(VectorSource(titulo$titulo_provisorio))
auxCorpus <- Corpus(VectorSource(texto$texto_provisorio))
wordcloud(auxCorpus,colors=c("blue","red"))
wordcloud(auxCorpus,colors=RColorBrewer::brewer.pal(9,"Reds"))
wwrite.tableordcloud(auxCorpus,colors=RColorBrewer::brewer.pal(9,"Blues"))
wordcloud(auxCorpus,ordered.colors=TRUE)

par(bg="black")
wordcloud(auxCorpus,max.words=100,colors=c("white","#eaef88","#e1e85a","#e1e85a"))

write.csv(texto,"texto.csv",row.names = FALSE, col.names = NA)
