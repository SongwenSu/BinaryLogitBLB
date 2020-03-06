readdata <- function(inputfile) {
  bank = read.csv(inputfile, sep=";")
  drop<-c("duration", "emp.var.rate", "loan", "default", "education")
  bank<-bank[,!names(bank)%in%drop]

  bank<-bank[1:4118,]

  # bank$y = as.character(bank$y)
  #bank$ynum = ifelse(bank$y == "yes", 1, 0)

  #  bank$yfac = as.factor(bank$y)

}
