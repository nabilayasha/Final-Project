set.seed(1)
rexp(3)

hist(rexp(10))
hist(rexp(100))
hist(rexp(1000))
hist(rexp(10000))

lamda <- 3
rataan <- 1 / lamda
rataan
varian <- 1 / (lamda * lamda)
varian
