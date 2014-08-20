# graphs and additions for Semantic Axelrod revisions Aug 2014
library(dplyr)
library(ggplot2)

# for cultural differentation
rc <- select(saa12full, simulation_run_id, num_culture_regions, size_trait_space, learning_rate, innovation_rate)
full_region_count <- unique(rc)

# Data subsets

# used in figure "img:culture-count-sm-trait-high-innov"
smallts_highinnov <- filter(full_region_count, innovation_rate == 1e-04,size_trait_space == 160)
smallts_highinnov_subset <- filter(smallts_highinnov, learning_rate %in% c(0.1, 0.3, 0.5, 0.7, 0.9))

# used in figure "img:culture-count-lr04-by-traitspace-size"
lr04_highinnov <- filter(full_region_count, innovation_rate == 1e-04, learning_rate == 0.4)

# used in figure "img:culture-count-lr04-noinnov-by-traitspace-size"
lr04_noinnov <- filter(full_region_count, innovation_rate == 0, learning_rate == 0.4)

# Figure "img:culture-count-sm-trait-high-innov"
p <- ggplot(smallts_highinnov_subset, aes(x=num_culture_regions)) + geom_density(fill="darkgrey") + ggtitle("Population Size = 100, Trait Space Size = 160, Innovation = 1e-04")
p + xlab("Number of Distinct Cultural Configurations")+ facet_grid(. ~ learning_rate, as.table=FALSE) + theme_bw(base_size = 12, base_family = "Helvetica")
ggsave(filename="../paper/small-trait-high-innovation-num-configs.eps")


# Figure "img:culture-count-lr04-by-traitspace-size"
q <- ggplot(lr04_highinnov, aes(x=num_culture_regions))  + geom_density(fill="darkgrey") + ggtitle("Population Size = 100, Learning Rate = 0.4, Innovation = 1e-04")
q + xlab("Number of Distinct Cultural Configurations") + facet_grid(. ~ size_trait_space, as.table=FALSE) + theme_bw(base_size = 12, base_family = "Helvetica")
ggsave(filename="../paper/culture-count-lr04-by-traitspace-size.eps")

# Figure "img:culture-count-lr04-noinnov-by-traitspace-size"
r <- ggplot(lr04_noinnov, aes(x=num_culture_regions))  + geom_density(fill="darkgrey") + ggtitle("Population Size = 100, Learning Rate = 0.4, No Individual Innovation")
r + xlab("Number of Distinct Cultural Configurations") + facet_grid(. ~ size_trait_space, as.table=FALSE) + theme_bw(base_size = 12, base_family = "Helvetica")
ggsave(filename="../paper/culture-count-lr04-noinnov-by-traitspace-size.eps")
