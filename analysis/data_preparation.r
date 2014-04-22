library(dplyr)
library(semanticaxelrod)

# read in the raw CSV exports from MongoDB, one for each experiment
saa1.full <- read.csv("~/local-research/semanticaxelrod/rawdata/saa1-sampled.csv")
saa2.full <- read.csv("~/local-research/semanticaxelrod/rawdata/saa2-sampled.csv")
saa3.full <- read.csv("~/local-research/semanticaxelrod/rawdata/saa3-sampled.csv")
saa4.full <- read.csv("~/local-research/semanticaxelrod/rawdata/saa4-sampled.csv")
saa5.full <- read.csv("~/local-research/semanticaxelrod/rawdata/saa5-sampled.csv")
saa6.full <- read.csv("~/local-research/semanticaxelrod/rawdata/saa6-sampled.csv")

# combine the experiments into a single data set
s1 <- tbl_df(saa1.full)
s2 <- tbl_df(saa2.full)
s3 <- tbl_df(saa3.full)
s4 <- tbl_df(saa4.full)
s5 <- tbl_df(saa5.full)
s6 <- tbl_df(saa6.full)

saa12full <- rbind(s1, s2)
saa34full <- rbind(s3, s4)
saa56full <- rbind(s5, s6)




# Now calculate additional statistics that weren't contemplated in the original simulation code, mostly simple ratios, and 
# some useful parameter combinations to use as factor levels
saa12full$order_trees <- orderBalancedTree(saa12full$branching_factor, saa12full$depth_factor)
saa12full$size_trait_space <- saa12full$order_trees * saa12full$num_trait_trees
saa12full$radius_frac <- saa12full$mean_radii / saa12full$depth_factor
saa12full$orbit_factor <- saa12full$orbit_number / (saa12full$depth_factor + 1)


# Now calculate additional statistics that weren't contemplated in the original simulation code, mostly simple ratios, and 
# some useful parameter combinations to use as factor levels
saa34full$order_trees <- orderBalancedTree(saa34full$branching_factor, saa34full$depth_factor)
saa34full$size_trait_space <- saa34full$order_trees * saa34full$num_trait_trees
saa34full$radius_frac <- saa34full$mean_radii / saa34full$depth_factor
saa34full$orbit_factor <- saa34full$orbit_number / (saa34full$depth_factor + 1)

# Now calculate additional statistics that weren't contemplated in the original simulation code, mostly simple ratios, and 
# some useful parameter combinations to use as factor levels
saa56full$order_trees <- orderBalancedTree(saa56full$branching_factor, saa56full$depth_factor)
saa56full$size_trait_space <- saa56full$order_trees * saa56full$num_trait_trees
saa56full$radius_frac <- saa56full$mean_radii / saa56full$depth_factor
saa56full$orbit_factor <- saa56full$orbit_number / (saa56full$depth_factor + 1)

saa_alldata <- rbind(saa12full, saa34full, saa56full)


# Generate a subset of the observations that are just final samples at 10MM ticks
#saa12final <- subset(saa12full, sample_time == 10000000 & run_finalized == 1)

# save binary versions of both
save(saa12full, file="~/local-research/semanticaxelrod/rawdata/saa12-full.rda")
save(saa34full, file="~/local-research/semanticaxelrod/rawdata/saa34-full.rda")
save(saa56full, file="~/local-research/semanticaxelrod/rawdata/saa56-full.rda")
save(saa_alldata, file="~/local-research/semanticaxelrod/rawdata/saa-full.rda")