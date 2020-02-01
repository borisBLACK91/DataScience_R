a <- 0
if(a!=0){
  print(1/a)
}else{
  print("No reciprocal for 0")
}


library(dslabs)
data(murders)
murder_rate <- murders$total/murders$population*100000
ind <- which.min(murder_rate)
if(murder_rate[ind]<0.25){
  print(murders$state[ind])
}else{
  print("No state has murder rate that low!")
}

data("na_example")
sum(is.na(na_example))
no_nas <- ifelse(is.na(na_example), 0, na_example)
sum(is.na(no_nas))
