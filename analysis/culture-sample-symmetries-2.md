


## Lambda ##

Without innovation:


```r

p <- ggplot(saa12finalnoinnov, aes(x = msg_lambda)) + geom_density(fill = "red")
p + facet_grid(learning_rate ~ size_trait_space, scale = "free_y")
```

![plot of chunk lambda-noinnov](figure/lambda-noinnov.png) 


And with innovation:


```r

p <- ggplot(saa12finalinnov, aes(x = msg_lambda)) + geom_density(fill = "red")
p + facet_grid(learning_rate ~ size_trait_space, scale = "free_y")
```

![plot of chunk lambda-innov](figure/lambda-innov.png) 


## Radius ##


Without innovation:


```r

p <- ggplot(saa12finalnoinnov, aes(x = radius_frac)) + geom_density(fill = "red")
p + facet_grid(learning_rate ~ size_trait_space, scale = "free_y")
```

![plot of chunk radius-noinnov](figure/radius-noinnov.png) 


And with innovation:


```r

p <- ggplot(saa12finalinnov, aes(x = radius_frac)) + geom_density(fill = "red")
p + facet_grid(learning_rate ~ size_trait_space, scale = "free_y")
```

![plot of chunk radius-innov](figure/radius-innov.png) 


## Mean Degree ##

Without innovation:


```r

p <- ggplot(saa12finalnoinnov, aes(x = mean_degree)) + geom_density(fill = "red")
p + facet_grid(learning_rate ~ size_trait_space, scale = "free_y")
```

![plot of chunk degree-noinnov](figure/degree-noinnov.png) 


And with innovation:


```r

p <- ggplot(saa12finalinnov, aes(x = mean_degree)) + geom_density(fill = "red")
p + facet_grid(learning_rate ~ size_trait_space, scale = "free_y")
```

![plot of chunk degree-innov](figure/degree-innov.png) 




