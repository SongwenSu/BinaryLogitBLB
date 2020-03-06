partitiondata <- function(bank) {
  set.seed(1335)
  nr <- nrow(bank)
  index <- sample(1:nr, size=ceiling(length(bank$y)/2),replace=FALSE)
  bank.train<-bank[index,]
  bank.valid<-bank[-index,]
  return(bank.train)
}
