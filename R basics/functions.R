
avg<-function(x){
  s <- sum(x)
  n <- length(x)
  s/n
}

v <- 1:100
avg(v)