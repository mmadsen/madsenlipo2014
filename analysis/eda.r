library(ggplot2)


qplot(msg_lambda, data=s23, geom="histogram") + facet_grid(learning_rate ~ population_size)
qplot(log(autgroupsize), data=s23, geom="histogram") + facet_grid(learning_rate ~ population_size)
qplot(orbit_number, data=s23, geom="histogram") + facet_grid(learning_rate ~ population_size)


s2.bigspace866 <- subset(s2, size_trait_space == 447896)
qplot(msg_lambda, data=s2.bigspace866, geom="histogram") + facet_grid(learning_rate ~ .)
qplot(mem_beta, data=s2.bigspace866, geom="histogram") + facet_grid(learning_rate ~ .)
qplot(radius_frac, data=s2.bigspace866, geom="histogram") + facet_grid(learning_rate ~ .)

s2.smallspace433 <- subset(s2, size_trait_space == 160)
qplot(msg_lambda, data=s2.smallspace433, geom="histogram") + facet_grid(learning_rate ~ .)
qplot(mem_beta, data=s2.smallspace433, geom="histogram") + facet_grid(learning_rate ~ .)

# seems like no real dependence of msg_lamba on convergence time,
# but weak differentiation of histograms by learning rate
qplot(convergence_time, msg_lambda, data=s2, geom="point") + facet_grid(learning_rate ~ .)
qplot(msg_lambda, data=s2, geom="histogram") + facet_grid(learning_rate ~ .)
                                                                      