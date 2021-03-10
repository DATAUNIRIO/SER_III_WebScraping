

# devtools::install_github("feddelegrand7/ralger")


library(ralger)

my_link <- "http://www.shanghairanking.com/ARWU2020.html"

my_node <- "#UniversityRanking a" # The ID, we recommend SelectorGadget

best_uni <- scrap(link = my_link, node = my_node)

head(best_uni, 10)

data <- table_scrap(link ="https://www.boxofficemojo.com/chart/top_lifetime_gross/?area=XWW")



my_link <- "https://www.imdb.com/search/title/?groups=top_250&sort=user_rating"

my_nodes <- c(
  ".lister-item-header a", # The title 
  ".text-muted.unbold", # The year of release 
  ".ratings-imdb-rating strong" # The rating)
)

names <- c("title", "year", "rating") # respect the nodes order


tidy_scrap(link = my_link, nodes = my_nodes, colnames = names)


#Using titles_scrap(), one can efficiently scrape titles which correspond to the h1, h2 & h3 HTML tags.
#If we go to the New York Times, we can easily extract the titles displayed within a specific web page :
  
titles_scrap(link = "https://www.nytimes.com/")

titles_scrap(link = "http://www.unirio.br/")

titles_scrap(link = "https://www.nytimes.com/", contain = "TrUMp", case_sensitive = FALSE)
titles_scrap(link = "http://www.unirio.br/", contain = "professor", case_sensitive = FALSE)


paragraphs_scrap(link = "https://ropensci.org/")
paragraphs_scrap(link = "http://www.unirio.br/")


weblink_scrap(link = "https://www.worldbank.org/en/access-to-information/reports/", 
              contain = "PDF", 
              case_sensitive = FALSE)

weblink_scrap(link = "http://www.unirio.br/", 
              case_sensitive = FALSE)


images_preview(link = "https://rstudio.com/")
images_preview(link = "http://www.unirio.br/")

# Suppose we're in a project which has a folder called my_images: 

images_scrap(link = "https://rstudio.com/", 
             imgpath = here::here("my_images"), 
             extn = "png") # without the .