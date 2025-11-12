library(revtools)
library(dplyr)
old <- read_bibliography("feb19.bib")
new <- read_bibliography("nov11.bib")

# remove all in old search from new search
new <- new[!(new$unique_id %in% old$unique_id),]

# remove old included from new search
old_included <- read_bibliography("final_feb.bib")
new <- new[!(new$unique_id %in% old_included)]

# new_excluded[,"in_old"] <- new_excluded$doi %in% old_included$doi
#
# # sort, put already screened studies at end
# new_excluded$in_old <- factor(new_excluded$in_old, levels = c(FALSE, TRUE))
# new_excluded <- new_excluded[order(new_excluded$in_old),]
# new_excluded$in_old # 453 - end are already screened and included

# screen titles
screen_titles(new_excluded)

#screen abs
# titles <- readRDS("jan_25_search/jan25_titlescreened.rds")
# titles <- titles[!grepl("excluded", titles$screened_titles),]
# head(titles)
# screen_abstracts(titles)
#
# # read in final csv
# final <- read.csv("jan_25_search/jan25_final.csv")
# final <- final[!grepl("excluded", final$screened_abstracts),]
# head(final)
# # export to bib
# write_bibliography(final, "newfinds_jan25.ris")
