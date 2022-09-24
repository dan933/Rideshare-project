library(readxl)
Uber_Trip_Details <- read_excel("C:/Users/dnadi/Downloads/Uber_Trip_Details.xlsx", 
                                col_types = c("date", "date", "date", 
                                              "date", "numeric", "numeric", "numeric", 
                                              "numeric", "numeric", "numeric", 
                                              "numeric", "text", "numeric", "text", 
                                              "numeric", "numeric"))
View(Uber_Trip_Details)

names(Uber_Trip_Details)[3] <- "Pick_Up_Time"
names(Uber_Trip_Details)[4] <- "Drop_Off_Time"

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


#Create Vector add the extra row
PUTimes <- c(as.character(PUTimes$Pick_Up_Time))



#Create the Data Frame

PUTimes <- data.frame(PUTimes)

#Convert to Charecter
Uber_Trip_Details$Date <- as.character(Uber_Trip_Details$Date)
Uber_Trip_Details$Pick_Up_Time <- PUTimes$PUTimes

#Change to Character the Pick_Up_Time Variable 
Uber_Trip_Details$Pick_Up_Time <- as.character(Uber_Trip_Details$Pick_Up_Time)

#Combine the Two Strings 
CPUT <- paste(Uber_Trip_Details$Date,PUTimes$PUTimes, sep = "")

#ADD to Dataframe 
Uber_Trip_Details$Pick_Up_Time <- CPUT

#Convert To Date 
Uber_Trip_Details$Pick_Up_Time <- strptime(Uber_Trip_Details$Pick_Up_Time, format = "%Y-%m-%d %H:%M:%S")


#Drop_OFF_TIME

DOTimes <- as.character(Uber_Trip_Details$Drop_Off_Time)

#splits data into sublists 
DOTimes <- strsplit(DOTimes,split = " ")

#turn into one whole list
DOTimes <- unlist(DOTimes,recursive = FALSE)

#turn into dataframe 
DOTimes <- data.frame(DOTimes)

#removes odds from data 
DOTimes <- DOTimes[c(FALSE,TRUE),]

DOTimes<- c(as.character(DOTimes))

DFDOTimes <- data.frame(DOTimes)


#Change to Charecter the DO Variable 
Uber_Trip_Details$Drop_Off_Time <- as.character(Uber_Trip_Details$Drop_Off_Time)

#Combine the Two Strings 
CPUT <- paste(Uber_Trip_Details$Date,DFDOTimes$DOTimes, sep = "")

#ADD to Dataframe 
Uber_Trip_Details$Drop_Off_Time <- CPUT
Uber_Trip_Details$Drop_Off_Time<- strptime(Uber_Trip_Details$Drop_Off_Time, format = "%Y-%m-%d %H:%M:%S")



str(Uber_Trip_Details$Date)

unlist(Uber_Trip_Details$Date)

#Convert to Date 
Uber_Trip_Details$Date <- as.Date(Uber_Trip_Details$Date,"%Y-%m-%d")

#Convert to Weekdays
wkDays <- weekdays(as.Date(Uber_Trip_Details$Date,"%Y-%m-%d"))

#paste in Days Column 
Uber_Trip_Details$Day <- wkDays 




