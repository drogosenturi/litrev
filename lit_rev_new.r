library(revtools)
setwd('~/R_files/lit_review/')
setwd('~/litrev/')

old_final <- read_bibliography('final_bib.ris')
data <- read_bibliography('new_search_5-24.bib')

# remove studies that were in final bib
data[,"in_old"] <- data[,"abstract"] %in% old_final[,"abstract"]
dupeless <- data[!(data$in_old %in% "TRUE"),]

# add object for old removals
title_screen <- read_bibliography('title_screen.csv')
excluded_og <- title_screen[title_screen$screened_titles == "excluded",]

#remove old title screened studies from dupeless
dupeless[,"title_screened"] <- dupeless[,'abstract'] %in% excluded_og[,"abstract"]
new_title_scr <- dupeless[!(dupeless$title_screened %in% "TRUE"),]

# add object for old abstract screens
abs_screened <- read_bibliography('abs_screened.csv')
ex_abs_og <- abs_screened[abs_screened$screened_abstracts == 'excluded',]

# remove old screened abstracts from new title scr
new_title_scr[,"abs_screened"] <- new_title_scr[,'abstract'] %in% ex_abs_og[,"abstract"]
final_pre_scr <- new_title_scr[!(new_title_scr$abs_screened %in% "TRUE"),]

# SCREEN FINAL PRE SCR FOR NEW STUDIES!
screen_titles(final_pre_scr)

# SCREEN ABSTRACTS 
screened_titles <- readRDS('screened_titles_5-24.rds')
#remove excluded studies
screened_titles_selected <- screened_titles[!(screened_titles$screened_titles
                                              %in% "excluded"),]
screen_abstracts(screened_titles_selected)
