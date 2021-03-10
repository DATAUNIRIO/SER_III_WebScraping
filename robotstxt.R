require("devtools")
install_github("tidymodels/textrecipes")


#We found vacationrentalslbi.com has an extensive list
#of rentals, and doesn’t restrict to the particular 
#agency maintaining the listing, so this is the perfect 
#place to gather our data. Naturally, we would like to 
#be polite, so check that we are allowed to scrape. 
#We can see from the R robotstxt library, which indicates 
#that paths_allowed is TRUE, that we are good to go with 
#our intended link.

# Robots.txt says okay to scrape
robotstxt::paths_allowed('https://www.vacationrentalslbi.com/search/for.rent/sleeps_min.4/')

robotstxt::paths_allowed('http://www.unirio.br/')

library(robotstxt)
paths_allowed("http://google.com/")
## [1] TRUE
paths_allowed("http://google.com/search")
## [1] FALSE
