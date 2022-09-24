install.packages("datetime")
library("datetime")
install.packages("dplyr")
library(dplyr)



#as Charecter
PUTimes <- as.character(Uber_Trip_Details$Pick_Up_Time)

#splits data into sublists 
PUTimes <- strsplit(PUTimes,split = " ")

#turn into one whole list
PUTimes <- unlist(PUTimes,recursive = FALSE)

#turn into dataframe 
PUTimes <- data.frame(PUTimes)

#removes odds from data 
PUTimes <- PUTimes[c(FALSE,TRUE),]

#turn into dataframe 
PUTimes <- data.frame(PUTimes)

#Changing Column Names
names(PUTimes)[1] <- "Pick_Up_Time"



#Remove unwanted data 
rm(Test,Times,dtsplit,dtunsplit,PU_Times,test,charpick_up_time,dtunlist)

#add NA Row 

#Create Vector add the extra row
Pick_Up_Times_Vector <- c(as.character(Test$Pick_Up_Time),NA)

#Create the Data Frame
PUTimes <- data.frame(Pick_Up_Times_Vector)


#Data Structure
str(Times)

#View as Table
View(Times)

Test <- Uber_Trip_Details

Test$Pick_Up_Time <- PUTimes$Pick_Up_Times_Vector
