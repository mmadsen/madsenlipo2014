library(dplyr)
library(semanticaxelrod)

# read in the raw CSV exports from MongoDB, one for each experiment
# saa2.full <- read.csv("~/local-research/semanticaxelrod/rawdata/saa2-full.csv")
# saa2a.full <- read.csv("~/local-research/semanticaxelrod/rawdata/saa2a-full.csv")
# saa3.full <- read.csv("~/local-research/semanticaxelrod/rawdata/saa3-full.csv")
# saa4.full <- read.csv("~/local-research/semanticaxelrod/rawdata/saa4-full.csv")
# saa7.full <- read.csv("~/local-research/semanticaxelrod/rawdata/saa7-full.csv")
# saa8.full <- read.csv("~/local-research/semanticaxelrod/rawdata/saa8-full.csv")

saatest <- read.csv("~/local-research/semanticaxelrod/rawdata/saa-test.csv")
saa1interim <- read.csv("~/local-research/semanticaxelrod/rawdata/saa1-interim.csv")

# combine the experiments into a single data set
# s2 <- tbl_df(saa2.full)
# s2a <- tbl_df(saa2a.full)
# s3 <- tbl_df(saa3.full)
# s4 <- tbl_df(saa4.full)
# s7 <- tbl_df(saa7.full)
# s8 <- tbl_df(saa8.full)
st <- tbl_df(saatest)
s1i <- tbl_df(saa1interim)

s1i10M <- subset(s1i, sample_time == 10000000 & run_finalized == 1)

saa_full_combined <- rbind(s1i10M)

# Now calculate additional statistics that weren't contemplated in the original simulation code, mostly simple ratios, and 
# some useful parameter combinations to use as factor levels
saa_full_combined$order_trees <- orderBalancedTree(saa_full_combined$branching_factor, saa_full_combined$depth_factor)
saa_full_combined$size_trait_space <- saa_full_combined$order_trees * saa_full_combined$num_trait_trees
saa_full_combined$radius_frac <- saa_full_combined$mean_radii / saa_full_combined$depth_factor

# save a binary version of this for fast loading, in local storage since it's too big for Github
#save(saa_full_combined, file="~/local-research/semanticaxelrod/rawdata/saa-test.r")

# create a subset with only finalized runs for initial analysis
# this is small so save it in the Github analysis directory
# saa_finalized_combined <- subset(saa_full_combined, run_finalized == 1)
# 
# save(saa_finalized_combined, file="data/saa_finalized_combined.rda")
# 

save(s1i, file="~/local-research/semanticaxelrod/rawdata/saa-test-full.rda")
save(saa_full_combined, file="data/saa-test.rda")
