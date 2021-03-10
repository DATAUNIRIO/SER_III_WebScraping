
#written  in JavaScript. 
#instructions on using PhantomJS to convert the website into HTML. 
# http://flovv.github.io/Scrape-JS-Sites/
# https://www.datacamp.com/community/tutorials/scraping-javascript-generated-data-with-r


# passo a passo
# 1 - o PhantomJS transforma o JavaScript em html.   
# 2 - download do html transformado.   
# 3 - Raspagem de dados do download com o rvest

options(stringsAsFactors = FALSE)
library(rvest)

scrapeJSSite <- function(dfrom, dto, date="2016-03-27"){
  ## change Phantom.js scrape file
  url <- paste0("https://www.busliniensuche.de/suche/?From=",dfrom,"&To=",dto,"&When=",date,"&ShowRidesharing=false&Company=Alle+Busunternehmen&Passengers=1&SearchMode=0&Radius=15000")
  lines <- readLines("C:/Users/Hp/Documents/GitHub/SER_III_WebScraping/phantomjs/scrape_final.js")
  lines[1] <- paste0("var url ='", url ,"';")
  writeLines(lines, "scrape_final.js")
  
  #-------------------------------------------------------
  ## Download website
  system("phantomjs scrape_final.js")
  #-------------------------------------------------------  
  
  ### use Rvest to scrape the downloaded website.
  pg <- read_html("1.html")
  price <- pg %>% html_nodes(".soldout , .field-price strong") %>% html_text()
  price <- price[nchar(price)>1]
  duration <- pg %>% html_nodes(".field-duration") %>% html_text()
  departure_time <- pg %>% html_nodes(".col-departure .field-time") %>% html_text()
  departure_date <- pg %>% html_nodes(".col-departure .field-date") %>% html_text()
  company <- pg %>% html_nodes(".company-changeover , .company-hover span") %>% html_text()
  company <- company[nchar(company)>1]
  
  df <- data.frame(price, duration, departure_date, departure_time, company)
  df$destination <- dto
  df$departure <- dfrom
  df$date <- date
  df$scrapeDate <- Sys.Date()
  return(df)
}












#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
I wrapped this in a system() call inside R Studio, but it could just as easily be done from the command line.

library(rvest)

# example of using phantomjs for scraping sites that use a twisty maze
# of javascript to render HTML tables or other tags

# grab phantomjs binaries from here: http://phantomjs.org/
# and stick it somehere PATH will find it

# this example scrapes the user table from:

url <- "http://64px.com/instagram/"

# write out a script phantomjs can process

writeLines(sprintf("var page = require('webpage').create();
page.open('%s', function () {
    console.log(page.content); //page source
    phantom.exit();
});", url), con="scrape.js")

# process it with phantomjs

system("phantomjs scrape.js > scrape.html")

# use rvest as you would normally use it

page_html <- html("scrape.html")
page_html %>% html_nodes(xpath="//table[2]") %>% html_table()

# OR #

page_html %>% html_nodes("table:nth-of-type(2)") %>% html_table()

# if you prefer CSS selectors over XPath