x <- c(sample(1:9, 4))
#x is the number computer guess and convert it to vector

gutime <- 0

for (l in 1:10) {
  bulls <- 0
  tog <- 0
  gutime <- gutime + 1
  rematime <- 10 - gutime
  numbers_string <-
    readline("Please enter four digit numbers without replacement from 1 to 9 > ")
  user_numbers <- as.integer(unlist(strsplit(numbers_string, " ")))
  #ask for the input number from the user each time start the loop
  user_choice = vector(length = 4)
  user_choice[1] <- floor(user_numbers / 1000)
  
  user_choice[2] <-
    floor((user_numbers - 1000 * user_choice[1]) / 100)
  
  user_choice[3] <-
    floor((user_numbers - 1000 * user_choice[1] - 100 * user_choice[2]) / 10)
  
  user_choice[4] <-
    user_numbers - 1000 * user_choice[1] - 100 * user_choice[2] - 10 * user_choice[3]
  #convert the user's number to a vector
  for (i in 1:4) {
    if (x[i] == user_choice[i]) {
      bulls <- bulls + 1
    }
  }
  #find bulls
  if (bulls == 4) {
    print("win")
    break
  }
  
  for (i in 1:4) {
    for (j in 1:4) {
      if (x[i] == user_choice[j]) {
        tog <- tog + 1
      }
    }
  }
  cows <- tog - bulls
  #find cows
  print(
    paste(
      "you guess",
      gutime,
      "times" ,
      "you have",
      rematime,
      "times to guess you have",
      bulls,
      "bulls",
      cows,
      "cows"
    )
  )
  #print answer each time
  
}
print(paste("you guess", gutime, "times"))
if (bulls != 4) {
  print("not win")
}
print(paste("correct answer is", x[1], x[2], x[3], x[4]))
