library(revtools)
library(tidyr)
setwd('~/R_files/lit_review/')
data <- read_bibliography('rec2.bib')
summary(old_data)

## Find duplicates and remove
screen_duplicates(data)
data <- data[-7,]

##  Manual Screening

screen_titles(data)
# including: human interaction with wildlife
# excluding: Reviews, parasites, chemical studies, disease, rural
# plant focused (plant diversity), no mention of wildlife
# habitat preference with no mention of human interference, soils
# molecular, plant-human interaction, stormwater systems
# public spaces(not garden), pollution tolerance, management -> biodiversity
# zoo conservation

title_screen <- read_bibliography('title_screen.csv')
head(title_screen)
## remove studies that have been 'excluded'
title_screen_ex <- title_screen[!title_screen$screened_titles == "excluded",]
head(title_screen_ex)
cont_screen_ab <- read_bibliography('60_85.csv')

screen_abstracts(cont_screen_ab)
screen_abstracts(title_screen_ex)
## including: wildlife -> resident
## excluding: resident -> wildlife
abs_screened <- read_bibliography('abs_screened.csv')
head(abs_screened)
final_batch <- abs_screened[abs_screened$screened_abstracts == 'selected',]
head(final_batch)
write.csv(final_batch, "~/R/research/screened_articles.csv")
