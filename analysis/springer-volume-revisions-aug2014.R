# graphs and additions for Semantic Axelrod revisions Aug 2014
library(dplyr)
library(ggplot2)
library(ggthemes)

# for cultural differentation
rc <- select(saa12full, simulation_run_id, num_culture_regions, size_trait_space, learning_rate, innovation_rate)
full_region_count <- unique(rc)

# Data subsets

# used in figure "img:culture-count-sm-trait-high-innov"
smallts_highinnov_subset <- filter(full_region_count, innovation_rate == 1e-04,size_trait_space == 160 learning_rate %in% c(0.1, 0.3, 0.5, 0.7, 0.9))

# used in figure "img:culture-count-lr04-by-traitspace-size"
lr04_highinnov <- filter(full_region_count, innovation_rate == 1e-04, learning_rate == 0.4)

# used in figure "img:culture-count-lr04-noinnov-by-traitspace-size"
lr04_noinnov <- filter(full_region_count, innovation_rate == 0, learning_rate == 0.4)

# used in figure popsize mean radius
saafullinnov <- filter(saa_alldata, innovation_rate == 1e-04 )

by_popsize <- group_by(saa_alldata, 
                       population_size, 
                       learning_rate, 
                       innovation_rate, 
                       size_trait_space) 

rd_by_group <- summarise(by_popsize, 
                         mean_rd = mean(remaining_density), 
                         sd_rd = sd(remaining_density), 
                         count = n(), 
                         mean_richness = mean(trait_richness))

rd_ts_15624 <- filter(rd_by_group, size_trait_space == 15624)

###### Figures for Revised Paper ########


# Figure "img:culture-count-sm-trait-high-innov"
p <- ggplot(smallts_highinnov_subset, aes(x=num_culture_regions)) + geom_density(fill="darkgrey") + ggtitle("Number of Cultural Configurations by Learning Rate")
p + xlab("Number of Distinct Cultural Configurations") + ylab("Probability Density") + facet_grid(. ~ learning_rate, as.table=FALSE) + geom_rangeframe() + theme_tufte(base_size=16)
#+ theme_bw(base_size = 12, base_family = "Helvetica")
ggsave(filename="../paper/small-trait-high-innovation-num-configs.pdf",dpi=300)

# Figure "img:culture-count-lr04-by-traitspace-size"
q <- ggplot(lr04_highinnov, aes(x=num_culture_regions))  + geom_density(fill="darkgrey") + ggtitle("Number of Cultural Configurations by Design Space Size")
q + xlab("Number of Distinct Cultural Configurations") + ylab("Probability Density") + facet_grid(. ~ size_trait_space, as.table=FALSE) + geom_rangeframe() + theme_tufte(base_size=16)
#+ theme_bw(base_size = 12, base_family = "Helvetica")
ggsave(filename="../paper/culture-count-lr04-by-traitspace-size.pdf",dpi=300)

# # Figure "img:culture-count-lr04-noinnov-by-traitspace-size"
# r <- ggplot(lr04_noinnov, aes(x=num_culture_regions))  + geom_density(fill="darkgrey") + ggtitle("Population Size = 100, Learning Rate = 0.4, No Individual Innovation")
# r + xlab("Number of Distinct Cultural Configurations") + facet_grid(. ~ size_trait_space, as.table=FALSE) + geom_rangeframe() + theme_tufte()
# #+ theme_bw(base_size = 12, base_family = "Helvetica")
# ggsave(filename="../paper/culture-count-lr04-noinnov-by-traitspace-size.pdf")
# ggsave(filename="../paper/culture-count-lr04-noinnov-by-traitspace-size.eps", plot=r)


####### NOT USED IN FINAL SUBMITTED VERSION #####
# Figure "img:design-space-occupied-by-popsize"
#s <- ggplot(rd_ts_15624, aes(x=population_size, y=mean_rd)) + geom_point(aes(colour=factor(learning_rate))) + stat_smooth(method = "loess", formula = y ~ x, size = 1) + scale_x_continuous(breaks=c(100,225,400)) + scale_colour_discrete(name="Learning Rate") + xlab("Population Size") + ylab("Fraction of Design Space Occupied")
#s + facet_grid(. ~ innovation_rate, scales="free", as.table=FALSE,labeller = label_both) + geom_rangeframe() + theme_tufte(base_size=16)
#+ theme_bw(base_size = 12, base_family = "Helvetica")
# ggsave(filename="../paper/design-space-occupied-by-popsize.pdf",dpi=300)
# \begin{figure}[htbp] 
# \centering 
# \includegraphics[scale=0.4]{design-space-occupied-by-popsize.pdf} 
# \caption{Fraction of the design space occupied by population size, for a large trait space of 15,624 traits, with a LOESS fit trend line (and points colored by learning rate).} 
# \label{img:design-space-occupied-by-popsize} 
# \end{figure}

# Figure population size comparisons "img:mean-radius-cultures-pop"
t <- ggplot(data=saafullinnov, aes(y=radius_frac, x=factor(learning_rate), fill=factor(population_size))) + ylab("Mean Radii of Trait Graphs (Normalized)") + xlab("Prerequisite Learning Rate") + labs(fill="Population Size")
t + geom_boxplot(notch=FALSE) + theme_tufte(base_size=16)
ggsave("../paper/mean-radius-by-learning-rate-pop.pdf",dpi=300)

# Figure "img:mean-radius-cultures-100"
u<- ggplot(data=saa12full, aes(y=radius_frac, x=factor(learning_rate), fill=factor(innovation_rate))) + ylab("Mean Radii of Trait Graphs (Normalized)") + xlab("Prerequisite Learning Rate") + labs(fill="Global Innovation Rate")
u + geom_boxplot(notch=FALSE) + theme_tufte(base_size=16)
ggsave("../paper/mean-radius-by-learning-rate-innov-12.pdf",dpi=300)






