CIS 6930: Introduction to Data Mining
Individual Project 2 – README FILE


In this project we use the .R script in R Studio to get the output for the various classification algorithms for the data sets: Titanic, Retail, and Game of Thrones

The following are the packages to be installed so as to get the correct output for the functions:

install.packages("caret")
 install.packages("datasets")
install.packages("RWeka")
install.packages("arules")

After the function is finished running use the detach function to remove the packages:

detach("package:caret",unload="TRUE")
detach("package:datasets",unload="TRUE")
detach("package:RWeka",unload="TRUE")
detach("package:arules",unload="TRUE")

The following are the functions used in the file “ArvindhSeshadhri_49930009.R” file for the association rule mining algorithms in all the datasets:

* Titanic Dataset: titanic_apriori()
* Retail Dataset: retail_apriori()
* Game of Thrones Dataset: GOT_apriori()

Here the dataset file is stored in my system and uses the path file for my system and so when running the functions of this dataset don’t forget to change the directory for the myData or myData1 variables in the beginning of the function so as to get the correct output. 
Also in the game of thrones dataset, I have converted the dataset from .csv to .arff format for easy processing. I am attaching the .arff file with the .ZIP file uploaded. Also some of the rules may not be displayed when the program is run and this is because there are too many rules to be displayed by R Studio for the given datasets.
