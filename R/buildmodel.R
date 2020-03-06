buildmodel <- function(bank.train) {
  logitmodel<-glm(as.factor(y) ~ (.),
                  data=bank.train, family = binomial("logit"),
                  control = list(maxit = 50))
  return(logitmodel)
}
