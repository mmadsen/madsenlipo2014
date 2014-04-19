


## Orbit Number and |Aut(G)|:  How Much Symmetry? ##

Without innovation:


```r

p <- ggplot(saa12finalnoinnov, aes(x = orbit_number)) + geom_density(fill = "red")
p + facet_grid(learning_rate ~ size_trait_space, scale = "free_y")
```

![plot of chunk orbits-noinnov](figure/orbits-noinnov.png) 


And with innovation:


```r

p <- ggplot(saa12finalinnov, aes(x = orbit_number)) + geom_density(fill = "red")
p + facet_grid(learning_rate ~ size_trait_space, scale = "free_y")
```

![plot of chunk orbits-innov](figure/orbits-innov.png) 


Aut(g) first without innovation:


```r

p <- ggplot(saa12finalnoinnov, aes(x = log(autgroupsize))) + geom_density(fill = "red")
p + facet_grid(learning_rate ~ size_trait_space, scale = "free_y")
```

![plot of chunk autg-noinnov](figure/autg-noinnov.png) 


And with innovation:


```r

p <- ggplot(saa12finalinnov, aes(x = log(autgroupsize))) + geom_density(fill = "red")
p + facet_grid(learning_rate ~ size_trait_space, scale = "free_y")
```

![plot of chunk autg-innov](figure/autg-innov.png) 




