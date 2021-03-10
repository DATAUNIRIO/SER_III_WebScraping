#install.packages("webdriver")
library(webdriver)

#?webdriver::install_phantomjs
#install_phantomjs(version = "2.1.1",baseURL = "https://github.com/wch/webshot/releases/download/v0.3.1/")

pjs <- run_phantomjs()
pjs

ses <- Session$new(port = pjs$port)
ses

ses$go("http://www.unirio.br/")
ses$getUrl()
ses$getTitle()
ses$takeScreenshot()

titulo <- ses$findElement(".tileHeadline")
titulo$getName()
titulo$getText()

texto <- ses$findElement(".tileBody")
texto$getText()

texto2 <- ses$findElement(".description")
texto2$getText()
texto2$click()
texto2$takeScreenshot()


titulo2 <- ses$findElement(".url")
titulo2$getName()
titulo2$getText()

titulo2 <- ses$findElements()
