# https://eric-ekholm.netlify.app/blog/dss-webscrape/
  
#Let’s walk through this. 
#First, we pipe the dss object into html_nodes(), which will 
#– in this case – extract all of the “form” elements from the page. 
#Note that I’m using html_nodes() rather than html_node() here – 
#this is because the form I want is actually the 2nd one on the page, 
#so I get both of them and then extract the second one using 
#magrittr::extract2(). Next, I pass that into html_form, which does 
#some voodoo to tell R that this is a form.

#When we take a peek at the form, here’s what we see:
library(rvest)
dss <- read_html("https://www.dss.virginia.gov/facility/search/cc2.cgi")

dss_form <- dss %>% 
  html_nodes("form") %>% 
  magrittr::extract2(2) %>% 
  html_form()

fdh_val <- set_values(dss_form,
                      `search_modifiers_mod_cde` = NULL,
                      `search_quality_rating_1` = NULL,
                      `search_quality_rating_2` = NULL,
                      `search_quality_rating_3` = NULL,
                      `search_quality_rating_4` = NULL,
                      `search_quality_rating_5` = NULL,
                      `search_quality_rating_all` = NULL,
                      `search_require_client_code-2101` = NULL,
                      `search_require_client_code-2102` = 1,
                      `search_require_client_code-2106` = NULL,
                      `search_require_client_code-2105` = NULL,
                      `search_require_client_code-2201` = 1,
                      `search_require_client_code-2104` = NULL,
                      `search_require_client_code-3001` = NULL,
                      `search_require_client_code-3002` = 1,
                      `search_require_client_code-3003` = NULL,
                      `search_require_client_code-3004` = NULL)


dss_session <- html_session("https://www.dss.virginia.gov/facility/search/cc2.cgi")

subbed <- submit_form(dss_session, fdh_val)

tbls <- subbed %>% html_nodes("table")

length(tbls)
# There are 4 tables.
library(dplyr)
fdh_tbl <- bind_rows(tbls[[3]] %>% html_table(),
                     tbls[[4]] %>% html_table())

glimpse(fdh_tbl)
