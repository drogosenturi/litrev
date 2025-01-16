library(revtools)
setwd("~/R_files/lit_review/")
old <- read_bibliography("excluded_5-29.ris")
new <- read_bibliography("7-15.bib")

# remove old exluded from new search
new_excluded <- new[!(new$doi %in% old$doi),]

# mark studies that were already screened and included from prev search
old_included <- read_bibliography("final_batch_5-29.ris")
head(old_included)
new_excluded[,"in_old"] <- new_excluded$doi %in% old_included$doi

# sort, put already screened studies at end
new_excluded$in_old <- factor(new_excluded$in_old, levels = c(FALSE, TRUE))
new_excluded <- new_excluded[order(new_excluded$in_old),]
new_excluded$in_old # 453 - end are already screened and included

# screen titles
screen_titles(new_excluded)
