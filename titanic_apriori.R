myData <-read.csv(file="/Users/ArvindhS/Classes/Intro to Data Mining/titanic.csv", header=TRUE, sep=",")
str(myData1)
library(caret)
library(arules)
set.seed(4909)
#Printing all of the rules
rules <- apriori(myData)
inspect(rules)
#Rules which meet the criteria (such as support and confidence)
betterRules <- apriori(myData, parameter = list(supp = 0.01, conf = 0.9),appearance = list(rhs=c("Survived=No", "Survived=Yes"), default="lhs"),control = list(verbose=F)) 
inspect(betterRules)
#finding redundant rules
subsetred <- is.subset(betterRules,betterRules)
subsetred[lower.tri(subsetred, diag=T)] <- NA
redundant <- colSums(subsetred, na.rm=T) >= 1
#Removing redundant rules
uniqueBetterRules <- betterRules[!redundant]
inspect(uniqueBetterRules)
#Sorting based on lift
sortedUniqueBetterRules <- sort(uniqueBetterRules, by = "lift") 
inspect(sortedUniqueBetterRules)