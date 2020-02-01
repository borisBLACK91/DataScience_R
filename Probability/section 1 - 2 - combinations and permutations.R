install.packages("gtools")
library(gtools)



set.seed(1, sample.kind="Rounding")
set.seed(1986)



#deck card games in R

suits <- c("Diamonds", "Clubs", "Hearts", "Spades")
numbers <- c("Ace", "Deuce", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King")
deck <- expand.grid(number = numbers, suit = suits)
deck <- paste(deck$number, deck$suit)
deck


kings <- paste("King", suits)
mean(deck %in% kings)
kings

permutations(5, 2)

all_phone_numbers <- permutations(10, 7, v = 0:9)
n <- nrow(all_phone_numbers)
index <- sample(n, 5)
all_phone_numbers[index, ]


library(gtools)
permutations(5,2)    # ways to choose 2 numbers in order from 1:5
all_phone_numbers <- permutations(10, 7, v = 0:9)
n <- nrow(all_phone_numbers)
index <- sample(n, 5)
all_phone_numbers[index,]

permutations(3,2)    # order matters
combinations(3,2)    # order does not matter



#Code: Probability of drawing a second king given that one king is drawn
hands <- permutations(52,2, v = deck)
first_card <- hands[,1]
second_card <- hands[,2]
sum(first_card %in% kings)

sum(first_card %in% kings & second_card %in% kings) / sum(first_card %in% kings)


#Code: Probability of a natural 21 in blackjack
aces <- paste("Ace", suits)
facecard <- c("King", "Queen", "Jack", "Ten")
facecard <- expand.grid(number = facecard, suit = suits)
facecard <- paste(facecard$number, facecard$suit)

hands <- combinations(52, 2, v=deck) # all possible hands

# probability of a natural 21 given that the ace is listed first in `combinations`
mean(hands[,1] %in% aces & hands[,2] %in% facecard)

# probability of a natural 21 checking for both ace first and ace second
mean((hands[,1] %in% aces & hands[,2] %in% facecard)|(hands[,2] %in% aces & hands[,1] %in% facecard))


#Code: Monte Carlo simulation of natural 21 in blackjack
#Note that your exact values will differ because the process is random and the seed is not set.

# code for one hand of blackjack
hand <- sample(deck, 2)
hand

# code for B=10,000 hands of blackjack
B <- 10000
results <- replicate(B, {
  hand <- sample(deck, 2)
  (hand[1] %in% aces & hand[2] %in% facecard) | (hand[2] %in% aces & hand[1] %in% facecard)
})
mean(results)


#the birthday problem : probability that almoth 2 people
#in a group of 50 have their birthday the same day

#Montecarlo solution

n <- 50
bdays <- sample(1:365, n, replace = TRUE)
any(duplicated(bdays))

B <- 10000
results  <- replicate(B, {bdays <- sample(1:365, n, replace = TRUE)
any(duplicated(bdays))})
mean(results)


compute_prob <- function(n, B = 10000){
  same_day <- replicate(B, {bdays <- sample(1:365, n, replace = TRUE)
  any(duplicated(bdays))})
  mean(same_day)
}
n <- seq(1,60)
prob <- sapply(n, compute_prob)
plot(n, prob)

#to compute the previous probability mathematically 
exact_prob <- function(n){
  prob_unique <- seq(365, 365-n+1)/365
  1-prod(prob_unique)
}
n <- 1:60
eprob <- sapply(n,exact_prob)
plot(n, eprob)
lines(n, eprob, col = "red")


#how bigger shall we repeat montecarlo experiment
B <- 10^seq(1, 5, len = 100)

compute_prob  <-  function(B, n=22){
  same_day <- replicate(B, {bdays <- sample(1:365, n, replace = TRUE)
  any(duplicated(bdays))})
  mean(same_day)
}

prob <- sapply(B, compute_prob)

plot(log10(B), prob, type = "l")
