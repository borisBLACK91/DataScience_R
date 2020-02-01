compute_s_n <- function(n){
  x <- 1:n; 
  sum(x)
}

compute_s_n(100)

m<-25
s_m <- vector(length = m)
for(n in 1:m){
  s_m[n] <- compute_s_n(n)
}
s_m
n <- 1:m
plot(n, s_m)
lines(n, n*(n+1)/2)
