library(dplyr)
library(semanticaxelrod)

# read in the raw CSV exports from MongoDB, one for each experiment
saa1.full <- read.csv("~/local-research/semanticaxelrod/rawdata/saa1-sampled.csv")
saa2.full <- read.csv("~/local-research/semanticaxelrod/rawdata/saa2-sampled.csv")

# combine the experiments into a single data set
s1 <- tbl_df(saa1.full)
s2 <- tbl_df(saa2.full)

saa12full <- rbind(s1, s2)



# Now calculate additional statistics that weren't contemplated in the original simulation code, mostly simple ratios, and 
# some useful parameter combinations to use as factor levels
saa12full$order_trees <- orderBalancedTree(saa12full$branching_factor, saa12full$depth_factor)
saa12full$size_trait_space <- saa12full$order_trees * saa12full$num_trait_trees
saa12full$radius_frac <- saa12full$mean_radii / saa12full$depth_factor
saa12full$orbit_factor <- saa12full$orbit_number / (saa12full$depth_factor + 1)


# Generate a subset of the observations that are just final samples at 10MM ticks
#saa12final <- subset(saa12full, sample_time == 10000000 & run_finalized == 1)

# save binary versions of both
save(saa12full, file="~/local-research/semanticaxelrod/rawdata/saa12-full.rda")
#save(saa12final, file="~/local-research/semanticaxelrod/rawdata/saa12-final.rda")
