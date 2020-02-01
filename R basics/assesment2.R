name <- c("Mandi", "Amy", "Nicole", "Olivia")
distance <- c(0.8, 3.1, 2.8, 4.0)
time <- c(10, 30, 40, 50)
time <- time/60
speed <- distance/time
olivia_hours <- distance[4]/speed[4]
olivia_hours
speed[1]
name[which.max(speed)]