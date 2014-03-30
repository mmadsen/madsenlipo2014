
source("data_preparation.r")

s2.melt <- melt(subset(s2, select=c("depth_factor", "branching_factor", "num_trait_trees", "size_trait_space", "mean_radii",
                                       "mean_density", "mean_degree", "mean_orbits", "mean_groupsize", "radius_frac", "learning_rate",
                                       "order", "msg_lambda","msg_beta", "mem_beta")), 
                measure.vars=c("radius_frac","mean_density",  "mean_degree", "mean_orbits", "mean_groupsize", "mean_radii", 
                               "msg_lambda","msg_beta", "mem_beta"))
s2c <- s2.melt[complete.cases(s2.melt),]


