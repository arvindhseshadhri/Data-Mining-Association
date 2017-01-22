myData<- read.arff("/Users/ArvindhS/Classes/game_of_thrones.arff")
str(myData)
library(caret)
library(arules)
set.seed(4909)
#Printing all of the rules
myData$Name<-NULL
head(myData)
rules1 <- apriori(myData)
#Rules which meet the criteria (such as support and confidence)
betterRules1 <- apriori(myData, parameter = list(supp = 0.01, conf = 0.9),appearance = list(rhs=c("Survives=1","Survives=0"), default="lhs"))
#inspect(betterRules1)
#finding redundant rules
subsetred1 <- is.subset(betterRules1,betterRules1)
subsetred1[lower.tri(subsetred1, diag=T)] <- NA
redundant1 <- colSums(subsetred1, na.rm=T) >= 1
#Removing redundant rules
uniqueBetterRules1 <- betterRules1[!redundant1]
inspect(uniqueBetterRules1)
#Sorting based on lift
sortedUniqueBetterRules1 <- sort(uniqueBetterRules1, by = "lift") 
inspect(sortedUniqueBetterRules1)