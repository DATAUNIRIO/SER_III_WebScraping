library(ralger)
#link = "https://bsi.uniriotec.br/disciplinas/#content"
link = "https://bsi.uniriotec.br/obrigatorias/"
obrigatorias<-weblink_scrap(link, case_sensitive = FALSE)
obrigatorias<-obrigatorias[65:99]
link = "https://bsi.uniriotec.br/optativas/"
optativas<-weblink_scrap(link, case_sensitive = FALSE)
optativas<-optativas[65:89]

link<-'https://bsi.uniriotec.br/administracao-de-bancos-de-dados-tin0135/'

paragraphs_scrap(link)
titles_scrap(link)

library(rvest)
aaa <- read_html(link)
s4 <- aaa %>% rvest::html_nodes("h4") %>% html_text()
s1 <- aaa %>% rvest::html_nodes("h1") %>% html_text()
p <- aaa %>% rvest::html_nodes("p") %>% html_text()
lista<-list(s1,s4,p)

N <- 25
for(i in 1:N){
  aaa <- read_html(obrigatorias[i])
  s4 <- aaa %>% rvest::html_nodes("h4") %>% html_text()
  s1 <- aaa %>% rvest::html_nodes("h1") %>% html_text()
  p <- aaa %>% rvest::html_nodes("p") %>% html_text()
  lista[i]<-list(s1,s4,p)
  Sys.sleep(2)
  cat("\r", i, "of", N)
}


#.leaflet-fade-anim
#hotspot-1639 .hotspot-default
#"#hotspots-map-container-1639 > div.leaflet-pane.leaflet-map-pane > div.leaflet-pane.leaflet-overlay-pane > svg > g > path:nth-child(20)"
#<path class="hotspot-default leaflet-interactive" 
#aria-label="Análise de Sistemas" 
#role="listitem"</path>

#<path class="hotspot-default leaflet-interactive" 
#aria-label="Estrutura de Dados II" 
#role="listitem"</path>  
  
library(xml)  
library(rvest)
aaa <- read_html(link)
films <- aaa %>% html_elements("listitem")
aaa  %>%  html_element(".tracklist") %>% 
films  
  
  
  
  
  
  
  
  
#  https://docs.ropensci.org/RSelenium/
#devtools::install_github("johndharrison/seleniumPipes")

#library(seleniumPipes)
#library(RSelenium) # start a server with utility function
#selServ <- RSelenium::rsDriver()
#remDr <- remoteDr()
#remDr %>% go(url = "https://bsi.uniriotec.br/disciplinas/")
#remDr %>% go(url = "http://www.bbc.com")
#remDr %>% back()
#remDr %>% forward()
#remDr %>% refresh()
#remDr %>% go("https://cloud.r-project.org/") %>% getPageSource()
# {xml_document}
# <html>
# [1] <head>\n<title>The Comprehensive R Archive Network</title>\n<meta content="text/html; charset=u ...
# [2] <frameset style="border: none;" cols="1*, 4*">\n<frameset rows="120, 1*">\n<frame frameborder=" ...

#remDr %>% getPageSource() %>% xml_find_all("//frame") %>% xml_attr("name")

# [1] "logo"     "contents" "banner"  

#remDr %>% deleteSession()
#selServ$stop()