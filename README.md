# Função xmlToList do pacote XML
tt = 
  '<x>
     <a>text</a>
     <b foo="1"/>
     <c bar="me">
        <d>a phrase</d>
     </c>
  </x>'  
  
xml_data <- XML::xmlToList(XML::xmlParse(tt, encoding = 'UTF-8'))



# Novos links e pacotes
### Tutorial: Web Scraping in R with rvest
https://www.dataquest.io/blog/web-scraping-in-r-rvest/
### Webscraping with R - TABLES
https://r-tastic.co.uk/post/from-messy-to-tidy/
### The goal of ralger is to facilitate web scraping in R.
https://github.com/feddelegrand7/ralger/blob/master/README.md
### Web crawling with R part 1: Teaching rvest how to crawl
https://stefan-stein.github.io/posts/2020-01-09-webcrawling1/
### Scraping the Web with rvest
https://jarrodpelkofer.netlify.app/posts/rvest_web_scrape/
### Web Scraping with rvest + Astro Throwback
https://heads0rtai1s.github.io/2020/01/23/rvest-intro-astro/

# III SER - WebScraping

Minicurso de Webscraping com pacote Rvest

UFF - Campos de Valonguinhos - 5. Andar

Horário: 14h - 17h

Website: https://ser2018.weebly.com/programmee.html

# Pacotes utilizados

## Principais

library(tidyverse)  
library(Rvest)

## Auxiliares

library(ggplot2)  
library(tm)  
library(wordcloud)  

# Páginas "scrapeadas" durante o curso

## Site da Secretária de Segurança Pública da Bahia

- http://www.ssp.ba.gov.br/modules/consultas_externas/index.php?cod=5

- http://200.187.8.90/boletim-stelecom/?bo_cod=2990

## Stackoverflow

- https://stackoverflow.com/

- https://stackoverflow.com/questions/tagged/r

## DevianArt

- https://www.deviantart.com/

# Páginas úteis

## Seletores de CSS

- https://www.w3schools.com/cssref/css_selectors.asp

## Xpath

- https://www.w3schools.com/xml/xpath_syntax.asp


# Welcome R version 3.5.0 (Joy in Playing)

<p align="center">
  <img width="460" height="300" src="https://i.pinimg.com/236x/44/21/de/4421de17ce2dc4cd3843ba00b224fbe0--music-jokes-music-humor.jpg">
</p>
