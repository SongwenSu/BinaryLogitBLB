library(tidyverse)

readdata <- function(inputfile) {
  bank = read.csv(inputfile, sep=";")
  drop<-c("duration", "emp.var.rate", "loan", "default", "education")
  bank<-bank[,!names(bank)%in%drop]

  bank<-bank[1:4118,]

 # bank$y = as.character(bank$y)
  #bank$ynum = ifelse(bank$y == "yes", 1, 0)

#  bank$yfac = as.factor(bank$y)

}

partitiondata <- function(bank) {
  set.seed(1335)
  nr <- nrow(bank)
  index <- sample(1:nr, size=ceiling(length(bank$y)/2),replace=FALSE)
  bank.train<-bank[index,]
  bank.valid<-bank[-index,]
  return(bank.train)
}

buildmodel <- function(bank.train) {
  logitmodel<-glm(as.factor(y) ~ (.),
                data=bank.train, family = binomial("logit"),
                control = list(maxit = 50))
  return(logitmodel)
}
