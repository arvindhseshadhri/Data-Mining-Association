titanic_apriori<-function()
{
  myData <-read.csv(file="/Users/ArvindhS/Classes/Intro to Data Mining/titanic.csv", header=TRUE, sep=",")
  str(myData)
  library(caret)
  library(arules)
  set.seed(4909)
  rules <- apriori(myData)
  inspect(rules)
  betterRules <- apriori(myData, parameter = list(supp = 0.01, conf = 0.9),appearance = list(rhs=c("Survived=No", "Survived=Yes"), default="lhs"),control = list(verbose=F)) 
  inspect(betterRules)
  subsetred <- is.subset(betterRules,betterRules)
  subsetred[lower.tri(subsetred, diag=T)] <- NA
  redundant <- colSums(subsetred, na.rm=T) >= 1
  uniqueBetterRules <- betterRules[!redundant]
  inspect(uniqueBetterRules)
  sortedUniqueBetterRules <- sort(uniqueBetterRules, by = "lift") 
  inspect(sortedUniqueBetterRules)
}
retail_apriori<-function()
{
  myData <-read.csv(file="/Users/ArvindhS/Classes/Intro to Data Mining/retail.csv", header=TRUE, sep=",")
  str(myData)
  library(caret)
  library(arules)
  set.seed(4909)
  myData$TransactionNo<-NULL
  myData <- sapply(myData,as.logical)
  rules1 <- apriori(myData)
  betterRules1 <- apriori(myData, parameter = list(supp = 0.01, conf = 0.9),appearance = list(rhs=c("Beverage","Meat","PersonalCare"), default="lhs"))
  inspect(betterRules1)
  subsetred1 <- is.subset(betterRules1,betterRules1)
  subsetred1[lower.tri(subsetred1, diag=T)] <- NA
  redundant1 <- colSums(subsetred1, na.rm=T) >= 1
  uniqueBetterRules1 <- betterRules1[!redundant1]
  inspect(uniqueBetterRules1)
  sortedUniqueBetterRules1 <- sort(uniqueBetterRules1, by = "lift") 
  inspect(sortedUniqueBetterRules1)
}
GOT_apriori<-function()
{
  myData<- read.arff("/Users/ArvindhS/Classes/game_of_thrones.arff")
  str(myData)
  library(caret)
  library(arules)
  set.seed(4909)
  myData$Name<-NULL
  head(myData)
  rules1 <- apriori(myData)
  betterRules1 <- apriori(myData, parameter = list(supp = 0.01, conf = 0.9),appearance = list(rhs=c("Survives=1","Survives=0"), default="lhs"))
  inspect(betterRules1)
  subsetred1 <- is.subset(betterRules1,betterRules1)
  subsetred1[lower.tri(subsetred1, diag=T)] <- NA
  redundant1 <- colSums(subsetred1, na.rm=T) >= 1
  uniqueBetterRules1 <- betterRules1[!redundant1]
  inspect(uniqueBetterRules1)
  sortedUniqueBetterRules1 <- sort(uniqueBetterRules1, by = "lift") 
  inspect(sortedUniqueBetterRules1)
}