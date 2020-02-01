

set.seed(1, sample.kind="Rounding")
set.seed(1986)

beads <- rep(c("red", "blue"), times = c (2,3))
beads

#sample function produce a randon event of the beads
sample(beads, 1)


B <- 10000
events <- replicate(B, sample(beads, 1))
#with replicate function, we can sample the beads B=10000 times

tab <- table(events) 
tab

prop.table(tab)


sample(beads, 5)
sample(beads, 5)
sample(beads, 5)

events <- sample(beads, B, replace = TRUE)
prop.table(table(events))



