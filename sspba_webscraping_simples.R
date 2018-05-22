# Webscraping - Site da Secretária de segurança pública da Bahia

library(tidyverse)
library(rvest)

# Level 1: Raspando tabela de veiculos roubados do dia anterior

# Acessar o site - http://www.ssp.ba.gov.br/modules/consultas_externas/index.php?cod=5
# Copiar link de uma das urls disponíveis

url  <- 'http://200.187.8.90/boletim-stelecom/?bo_cod=2986'

page <- read_html(url)

# Visualizando de forma geral o HTML extraido

page %>% 
  html_text()

# Extraindo o título das tabelas

table_names <- page %>% 
  html_nodes('h1') %>% 
  html_text()

# Extraindo contéudo das tabelas - parte 1

table_ssp <- page %>% 
  html_nodes('td') %>% 
  html_text()

# Extraindo contéudo das tabelas - parte 2

table_ssp <- page %>% 
  html_nodes('table') %>%             # 'tag'
  html_table() %>% 
  .[[1]]

# Sobre a sintaxe do 'html_nodes'

table_ssp <- page %>% 
  html_nodes('table') %>%              # 'tag'
  html_table() 

page %>% 
  html_nodes('.tabelaResultado') %>%   # '.class'
  html_table()


page %>% 
  html_nodes('#content-i') %>%         # '#id'
  html_nodes('.tabelaResultado') %>%   # '.class'
  html_table()