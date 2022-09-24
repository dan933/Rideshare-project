#Create New df to protect Uber data
setupPUDO <- Uber_Trip_Details

#convert Time to 00:00 format 
dataHour <- factor(paste(substr(setupPUDO$Pick_Up_Time,12,14),"00:00", sep = ""))

#Factor Days Mon-Sun 
dataDay <- factor(setupPUDO$Day, levels = c("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"),labels = c("Mon","Tue","Wed","Thur","Fri","Sat","Sun"))

#add Price 
dataPrice <- setupPUDO$Total

#Add Pick Up Location 
PU_L <- setupPUDO$`Pick Up Location`


# Script to Group by Day and Hour

df <- data.frame(dataDay,dataHour,dataPrice,PU_L)
names(df)[1] <- "Day"
names(df)[2] <- "Hour"
names(df)[3] <- "Price"
names(df)[4] <- "Suburb"

#Sum Total by hour and Day 
income_Ph_PD <- aggregate(df$Price, by=list(df$Day,df$Hour), FUN = sum, na.rm = TRUE)
names(income_Ph_PD)[1] <- "Day"
names(income_Ph_PD)[2] <- "Time"
names(income_Ph_PD)[3] <- "Sum_Price"

#sort dataframe Mon-Sun
income_Ph_PD <- income_Ph_PD %>% arrange(Day)


#df sum by weekdays
IncomePD <-c(rowsum(income_Ph_PD$Sum_Price,income_Ph_PD$Day))

PDD <- c("Mon","Tue","Wed","Thur","Fri","Sat","Sun")
IncomePD <- data.frame(PDD,IncomePD)
names(IncomePD)[1] <- "Days"
names(IncomePD)[2] <- "Sum_Price"

#Order Factor Mon-Sun 
IncomePD$Days <-factor(IncomePD$Days, levels = c("Mon","Tue","Wed","Thur","Fri","Sat","Sun"))

