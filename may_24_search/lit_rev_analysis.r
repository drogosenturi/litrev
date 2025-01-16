# r script to analyze results from lit search and review
setwd('~/R_files/lit_review/')
library(ggplot2)
library(reshape2)
library(tidyr)
library(dplyr)
library(RColorBrewer)

df <- read.csv('lit_results.csv')
summary(df)
df <- df[-39,] # remove gusto et al. 2022

as.data.frame(table(df$category, useNA = 'always')) # shows count of unique occurrences
# yard response = 1
# opinions = 21
# attract/deter = 20
# NA/blank = 14

# graph continent data
ggplot(df, aes(y = continent)) +
    geom_bar(width = 0.75, fill = "black") +
    theme_minimal() + 
    ylab(NULL) + xlab("Number of articles") + xlim(0,30) +
    theme(axis.text.x = element_text(size=24)) +
    theme(axis.text.y = element_text(size = 24, angle = 45)) +
    theme(axis.title = element_text(face = "bold", size = 20)) +
    theme(axis.title.x = element_text(vjust = -1)) +
    theme(axis.title.y = element_text(vjust = 2)) +
    theme(plot.margin = unit(c(1,1,1,1), "cm"))

# graph year of articles
years <- df %>%
            count(year)
years <- years[-14,]
ggplot(years, aes(x = year, y = n)) +
    geom_area() +
    theme_minimal() +
    xlab("Year") + ylab("Number of articles") +
    scale_x_continuous(breaks = seq(2007,2023, by = 2)) +
    scale_y_continuous(breaks = seq(0, 10, by = 1)) +
    theme(axis.text.x = element_text(size = 24, angle = 45)) +
    theme(axis.text.y = element_text(size = 24)) +
    theme(axis.title = element_text(face = "bold", size = 24)) +
    theme(axis.title.x = element_text(vjust = 1)) +
    theme(axis.title.y = element_text(vjust = 1))

# pie chart for categories
palette <- brewer.pal()
#category count data
categories <- df %>% count(category)
pie(categories$n, labels = NULL, )
