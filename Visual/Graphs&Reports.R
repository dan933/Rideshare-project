#Graph Income in Days of the Week 
ggplot(IncomePD,aes(Days,Sum_Price))+geom_bar(stat = "identity")

#Time to Income ggplot2
IncomePH <- c(rowsum(income_Ph_PD$Sum_Price,income_Ph_PD$Time))
PHH <- c(levels(dataHour))
IncomePH <- data.frame(PHH,IncomePH)
names(IncomePH)[1] <- "Time"
names(IncomePH)[2] <- "Sum_Price"

ggplot(IncomePH,aes(Time,Sum_Price))+geom_bar(stat = "identity")

#Graph with Date and time 
  #factor the Sum_price 
    RM <- cut(income_Ph_PD$Sum_Price,c(0,18.75,31.79,39.90,76.70),labels = c("$0-18.75","$18.75-31.79","$31.79-39.90","39.90-76.70"))    
    
GPT <- ggplot(income_Ph_PD, aes(Day,Time))
GPT <- GPT + geom_point(aes(colour = factor(RM)),size = 4)
GPT <-GPT + labs(colour = "Profit")

#Shape Graph
GST <- ggplot(income_Ph_PD,aes(Day,Time))
GST <- GST+geom_point(aes(shape = factor(RM)),size = 3)
GST <- GST + labs(shape = "Profit")


#location graph 
GPS<- income_Ph_PD <- aggregate(df$Price, by=list(df$Suburb,df$Day,df$Hour), FUN = sum, na.rm = TRUE)
names(GPS)[1] <- "Day"
names(GPS)[2] <- "Hour"
names(GPS)[3] <- "Suburb"
names(GPS)[4] <- "Profit"

GPS <- GPS %>% arrange(Day)
GPS <- ggplot(GPS,aes(Hour,Day)) + geom_point (aes(col=Suburb,size = Profit))


              
#Profit_per_Suburb <- aggregate(df$Price, by=list(df$Suburb,df$Day,df$Hour), FUN = sum, na.rm = TRUE)
#Date and Time on the same graph
#setupPUDO <- income_Ph_PD
#setupPUDO$Time <- as.character(setupPUDO$Time)
#setupPUDO$Time <- paste(Uber_Trip_Details$Date[1:54],setupPUDO$Time,sep = " ")
#setupPUDO$Time <- as_datetime(setupPUDO$Time,format = "%Y-%m-%d %H:%M:%S")
#ggplot(setupPUDO,aes(Time,Sum_Price))+geom_bar()
#https://rdrr.io/r/graphics/axis.POSIXct.html
#https://www.r-graph-gallery.com/279-plotting-time-series-with-ggplot2.html
#Dataframe %>% group_by(day, time) %>% summarise(Sum_Price =sum(price))
#Ggplot(income_ph_pd, aes(x=*dayandtime*, y=Sum_Price)) + geom_bar()


