#Maps 

#aggregate based on lon and LT
grouping_df <- aggregate(df$Price, by=list(df$Suburb,df$Day,df$Hour), FUN = sum, na.rm = TRUE)
names(grouping_df)[1] <- "Suburb"
names(grouping_df)[2] <- "Day"
names(grouping_df)[3] <- "Hour"
names(grouping_df)[4] <- "Price"

grouping_df <- arrange(grouping_df,Suburb,Day)

#Import postcodes_geo
postcodes_geo <- read.table("C:/Users/dnadi/Desktop/db/postcodes.csv",header = TRUE,sep = ",")

#Markers for Map
grouping_sub_lng_lat <- df
grouping_sub_lng_lat <- grouping_sub_lng_lat[-c(1,2,3)]
grouping_sub_lng_lat <- distinct(grouping_sub_lng_lat,grouping_sub_lng_lat$Suburb)
names(grouping_sub_lng_lat)[1] <- "Suburb"




#Add Lat to df
x <- 1
for (sub in grouping_sub_lng_lat$Suburb) 
{grouping_sub_lng_lat$LT[x] <- postcodes_geo$latitude[match(grouping_sub_lng_lat$Suburb[x],postcodes_geo$suburb)]
x <- x+1}

#Add Lon to df
x <- 1
for (sub in grouping_sub_lng_lat$Suburb) 
{grouping_sub_lng_lat$Long[x] <- postcodes_geo$longitude[match(grouping_sub_lng_lat$Suburb[x],postcodes_geo$suburb)]
x <- x+1}

names(grouping_sub_lng_lat)[1] <- "Suburb"


grouping_sub_lng_lat <- arrange(grouping_sub_lng_lat,grouping_sub_lng_lat$Suburb)



#Wheelers Hill 
grouping_sub_lng_lat[54,]
grouping_sub_lng_lat[54,3] <- 145.1890
grouping_sub_lng_lat[54,2] <--37.9068

#Ringwood
grouping_sub_lng_lat[46,]
grouping_sub_lng_lat[46,3] <- 145.2307
grouping_sub_lng_lat[46,2] <--37.8106


#Ringwood North
postcodes_geo[297,4] <- -37.7999
postcodes_geo[297,5] <- 145.2269

#Adding Suburb Amount to grouping_sub_lng_lat

sum_Suburbs <- aggregate(df$Price, by=list(df$Suburb), FUN = sum, na.rm = TRUE)
names(sum_Suburbs)[2] <- "Amount"
grouping_sub_lng_lat$Amount <- sum_Suburbs$Amount

#Convert to Character so it can be added to Label
grouping_sub_lng_lat$Amount <- as.character(grouping_sub_lng_lat$Amount)

#Map 1 Total Amounts for Each Suburb 
m <- leaflet(data = grouping_sub_lng_lat) %>%
  addTiles() %>%
  addMarkers(lng = ~Long, 
             lat = ~LT, label = ~Suburb, popup = ~Amount)


#map trial 2 

#Grouping Into Suburb, Days
group_Day <- aggregate(df$Price,by = list(df$Suburb,df$Day),FUN = sum)
names(group_Day)[1] <- "Suburb"
names(group_Day)[2] <- "Day"
names(group_Day)[3] <- "Amount"


group_Day$Suburb <- as.character(group_Day$Suburb)
group_Day <- group_Day %>% arrange(Suburb,Day)

#First Layer Mon
Group_Mon <- group_Day %>% dplyr::filter(Day =="Mon")


#Add Lat to Group_Mon
x <- 1
for (sub in Group_Mon$Suburb) 
{Group_Mon$LT[x] <- postcodes_geo$latitude[match(Group_Mon$Suburb[x],postcodes_geo$suburb)]
x <- x+1}


#Add Lon to Group_Mon
x <- 1
for (sub in Group_Mon$Suburb) 
{Group_Mon$Long[x] <- postcodes_geo$longitude[match(Group_Mon$Suburb[x],postcodes_geo$suburb)]
x <- x+1}


#Second Layer Tue
Group_Tue <- group_Day %>% dplyr::filter(Day =="Tue")


#Add Lat to Group_Tue
x <- 1
for (sub in Group_Tue$Suburb) 
{Group_Tue$LT[x] <- postcodes_geo$latitude[match(Group_Tue$Suburb[x],postcodes_geo$suburb)]
x <- x+1}


#Add Lon to Group_Tue
x <- 1
for (sub in Group_Tue$Suburb) 
{Group_Tue$Long[x] <- postcodes_geo$longitude[match(Group_Tue$Suburb[x],postcodes_geo$suburb)]
x <- x+1}

#Third Layer Wed
Group_Wed <- group_Day %>% dplyr::filter(Day =="Wed")


#Add Lat to Group_Wed
x <- 1
for (sub in Group_Wed$Suburb) 
{Group_Wed$LT[x] <- postcodes_geo$latitude[match(Group_Wed$Suburb[x],postcodes_geo$suburb)]
x <- x+1}


#Add Lon to Group_Wed
x <- 1
for (sub in Group_Wed$Suburb) 
{Group_Wed$Long[x] <- postcodes_geo$longitude[match(Group_Wed$Suburb[x],postcodes_geo$suburb)]
x <- x+1}

#Fourth Layer Thur
Group_Thur <- group_Day %>% dplyr::filter(Day =="Thur")


#Add Lat to Group_Thur
x <- 1
for (sub in Group_Thur$Suburb) 
{Group_Thur$LT[x] <- postcodes_geo$latitude[match(Group_Thur$Suburb[x],postcodes_geo$suburb)]
x <- x+1}


#Add Lon to Group_Thur
x <- 1
for (sub in Group_Thur$Suburb) 
{Group_Thur$Long[x] <- postcodes_geo$longitude[match(Group_Thur$Suburb[x],postcodes_geo$suburb)]
x <- x+1}

#Fifth Layer Fri
Group_Fri <- group_Day %>% dplyr::filter(Day =="Fri")%>% dplyr::filter(Amount > 0)


#Add Lat to Group_Fri
x <- 1
for (sub in Group_Fri$Suburb) 
{Group_Fri$LT[x] <- postcodes_geo$latitude[match(Group_Fri$Suburb[x],postcodes_geo$suburb)]
x <- x+1}


#Add Lon to Group_Fri
x <- 1
for (sub in Group_Fri$Suburb) 
{Group_Fri$Long[x] <- postcodes_geo$longitude[match(Group_Fri$Suburb[x],postcodes_geo$suburb)]
x <- x+1}

#Sixth Layer Sat
Group_Sat <- group_Day %>% dplyr::filter(Day =="Sat") %>% dplyr::filter(Amount>0)


#Add Lat to Group_Sat
x <- 1
for (sub in Group_Sat$Suburb) 
{Group_Sat$LT[x] <- postcodes_geo$latitude[match(Group_Sat$Suburb[x],postcodes_geo$suburb)]
x <- x+1}


#Add Lon to Group_Sat
x <- 1
for (sub in Group_Sat$Suburb) 
{Group_Sat$Long[x] <- postcodes_geo$longitude[match(Group_Sat$Suburb[x],postcodes_geo$suburb)]
x <- x+1}

#Seventh Layer Sun
Group_Sun <- group_Day %>% dplyr::filter(Day =="Sun")

#Add Lat to Group_Sun
x <- 1
for (sub in Group_Sun$Suburb) 
{Group_Sun$LT[x] <- postcodes_geo$latitude[match(Group_Sun$Suburb[x],postcodes_geo$suburb)]
x <- x+1}


#Add Lon to Group_Sun
x <- 1
for (sub in Group_Sun$Suburb) 
{Group_Sun$Long[x] <- postcodes_geo$longitude[match(Group_Sun$Suburb[x],postcodes_geo$suburb)]
x <- x+1}

summary(group_Day)

pal <- colorNumeric(palette = "Reds",domain = c(5:85))

summary(Group_Tue)

nchar_Mon <- as.character(Group_Mon$Amount) 
nchar_Tue <- as.character(Group_Tue$Amount) 
nchar_Wed <- as.character(Group_Wed$Amount)
nchar_Thur <-as.character(Group_Thur$Amount)
nchar_Fri <-as.character(Group_Fri$Amount)
nchar_Sat <-as.character(Group_Sat$Amount)
nchar_Sun <- as.character(Group_Sun$Amount)

#Clear Map
m_group_Days <- m_group_Days %>% clearMarkers()
m_group_Days <- m_group_Days %>% clearControls()

#Create Map
m_group_Days <- leaflet() %>% addTiles() %>% 
  addCircleMarkers(lat = ~LT, lng = ~Long, data = Group_Mon, radius = 8,color = ~pal(Amount),
                   label = ~Suburb, popup = ~nchar_Mon, group = "Mon") %>%
  
  addCircleMarkers(lat = ~LT, lng = ~Long, data = Group_Tue, radius = 8,color = ~pal(Amount),
                   label = ~Suburb, popup = ~nchar_Tue, group = "Tue") %>%
  
  addCircleMarkers(lat = ~LT, lng = ~Long, data = Group_Wed, radius = 8,color = ~pal(Amount),
                   label = ~Suburb, popup = ~nchar_Wed, group = "Wed") %>%
  
  addCircleMarkers(lat = ~LT, lng = ~Long, data = Group_Thur, radius = 8,color = ~pal(Amount),
                   label = ~Suburb, popup = ~nchar_Thur, group = "Thur") %>%
  
  addCircleMarkers(lat = ~LT, lng = ~Long, data = Group_Fri, radius = 8,color = ~pal(Amount),
                   label = ~Suburb, popup = ~nchar_Fri, group = "Fri") %>%
  
  addCircleMarkers(lat = ~LT, lng = ~Long, data = Group_Sat, radius = 8,color = ~pal(Amount),
                   label = ~Suburb, popup = ~nchar_Sat, group = "Sat") %>%
  
  addCircleMarkers(lat = ~LT, lng = ~Long, data = Group_Sun, radius = 8,color = ~pal(Amount),
                   label = ~Suburb, popup = ~nchar_Sun, group = "Sun") %>%
  
  addLayersControl(
    overlayGroups = c("Mon","Tue","Wed","Thur","Fri","Sat","Sun")
  )



m_group_Days <- m_group_Days %>% addLegend(title = "Amount",pal = pal,values = c(5.03:85),position = "bottomleft")

#Map of Each Day and the most popular areas 
m_group_Days

#Map overlay groups of each day and hour filters using sliders and shiny library  

map_group_hours <- grouping_df


  #Add long and lat to map_group_hours

#Add Lat to map_group_hours
x <- 1
for (sub in map_group_hours$Suburb) 
{map_group_hours$LT[x] <- postcodes_geo$latitude[match(map_group_hours$Suburb[x],postcodes_geo$suburb)]
x <- x+1}


#Add Lon to map_group_hours
x <- 1
for (sub in map_group_hours$Suburb) 
{map_group_hours$Long[x] <- postcodes_geo$longitude[match(map_group_hours$Suburb[x],postcodes_geo$suburb)]
x <- x+1}

#create Shiny App 
  #Create Leaflet Map
M <- leaflet(data = map_group_hours) %>% addTiles() %>% addCircleMarkers(lng = ~Long ,lat = ~LT )


library("shiny")
library("dplyr")
library("leaflet")

#One that works but without Colour pallete
ui <- bootstrapPage(
  tags$style(type = "text/css","html,
             body{width:100%;height:100%}"),
  leafletOutput("map",width = "100%",height = "100%"),
  absolutePanel(top =20,right=50,
  selectInput("Day","Enter Weekday", choices = c("Mon","Tue","Wed","Thur","Fri","Sat","Sun" ),selected = "Thur" ),
  selectInput("Hour","Enter Time",
choices = c("00:00:00","01:00:00","02:00:00","09:00:00","10:00:00","11:00:00","12:00:00","13:00:00","14:00:00",
            "15:00:00","16:00:00","17:00:00","18:00:00","19:00:00","20:00:00","21:00:00","22:00:00","23:00:00"),selected = "21:00:00")))



server <- function(input,output,session) {
  filtered <- reactive({dplyr::filter(map_group_hours,map_group_hours$Day == input$Day & map_group_hours$Hour == input$Hour)
})
 
  output$map <- renderLeaflet({
    leaflet(data = filtered()) %>%
    addTiles() %>%
    addCircleMarkers(lat = ~LT, lng = ~Long, radius = 7,label = ~Suburb, popup = ~as.character(Price))
  })
}

shinyApp(ui = ui,server = server)


filtered <- dplyr::filter(map_group_hours,map_group_hours$Day == "Thur" & map_group_hours$Hour == "21:00:00")
colpal <-colorNumeric(palette = "Reds", domain = c(min(filtered$Price):max(filtered$Price)))
colpal <-colorNumeric(palette = "Greens", domain = c(5:40))

leaflet(data = filtered) %>%
  addTiles() %>%
  addCircleMarkers(lat = ~LT, lng = ~Long, radius = 7,label = ~Suburb, popup = ~as.character(Price), color = ~colpal(Price))


library("shiny")
library("dplyr")
library("leaflet")

#Everything is working zoom needs to be adjusted and Col pal needs to fixed for null inputs

selectDay <- as.character(sort(unique(map_group_hours[,2:3][,1])))
selectHour <- as.character(sort(unique(map_group_hours[,2:3][,2])))

ui <- bootstrapPage(
  tags$style(type = "text/css","html,
  body{width:100%;height:100%}"),
  leafletOutput("map",width = "100%",height = "100%"),
  absolutePanel(top =20,right=50,
  
                selectInput("Day","Enter Weekday", choices = c(selectDay),selected = selectDay[4]),
                
                selectInput("Hour","Enter Time",
                            choices = c(selectHour),selected = selectHour[16])))



server <- function(input,output,session) {
filtered <- reactive({dplyr::filter(map_group_hours,map_group_hours$Day == input$Day 
                                    & map_group_hours$Hour == input$Hour)})
  

colpal <-reactive({colorNumeric(palette = "Reds", 
domain = c(min(filtered()[[4]]):(max(filtered()[[4]])+1)))})
  
output$map <- renderLeaflet({
    leaflet() %>%
      addTiles()})
  observe({
pal <- colpal ()
    
    leafletProxy("map", data = filtered()) %>%
    clearMarkers() %>% 
    addCircleMarkers(lat = ~LT, lng = ~Long, radius = 7,
      label = ~Suburb, popup = ~as.character(Price),color = ~pal(Price))})
  
      }

shinyApp(ui = ui,server = server)

#Color pal adjusted for N.A values nex step is to add legend and zoom bounds 

library("shiny")
library("dplyr")
library("leaflet")


selectDay <- as.character(sort(unique(map_group_hours[,2:3][,1])))
selectHour <- as.character(sort(unique(map_group_hours[,2:3][,2])))

ui <- bootstrapPage(
  tags$style(type = "text/css","html,
  body{width:100%;height:100%}"),
  leafletOutput("map",width = "100%",height = "100%"),
  absolutePanel(top =20,right=50,
                
                selectInput("Day","Enter Weekday", choices = c(selectDay),selected = selectDay[4]),
                
                selectInput("Hour","Enter Time",
                            choices = c(selectHour),selected = selectHour[16])))



server <- function(input,output,session) {
  
  observe({
    x <- input$Day
 
  
    updateSelectInput(session,"Hour",
                      label = "Select Hour:",
                      choices = map_group_hours$Hour[map_group_hours$Day == x],
                      selected = head(map_group_hours$Hour[map_group_hours$Day == x],1))
  })
  
  filtered <- reactive({dplyr::filter(map_group_hours,map_group_hours$Day == isolate({input$Day})
                                      & map_group_hours$Hour == input$Hour)})
  
  colpal <-reactive({colorNumeric(palette = "Reds", 
                                  domain = c(min(filtered()[[4]]):(max(filtered()[[4]])+1)))})
  
  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles()})
  
  observe({
    pal <- colpal ()
    
    leafletProxy("map", data = filtered()) %>%
      clearMarkers() %>% 
      addCircleMarkers(lat = ~LT, lng = ~Long, radius = 7,
                       label = ~Suburb, popup = ~as.character(Price),color = ~pal(Price))})
  
}

shinyApp(ui = ui,server = server)

#Test legend and zoom bound

library("shiny")
library("dplyr")
library("leaflet")


ui <- bootstrapPage(
  tags$style(type = "text/css","html,
  body{width:100%;height:100%}"),
  leafletOutput("map",width = "100%",height = "100%"),
  absolutePanel(top =20,right=50,
                
                selectInput("Day","Enter Weekday", choices = c(selectDay),selected = selectDay[4]),
                
                selectInput("Hour","Enter Time",
                            choices = c(selectHour),selected = selectHour[16])))



server <- function(input,output,session) {
  
  observe({
    x <- input$Day
    
    
    updateSelectInput(session,"Hour",
                      label = "Select Hour:",
                      choices = map_group_hours$Hour[map_group_hours$Day == x],
                      selected = head(map_group_hours$Hour[map_group_hours$Day == x],1))
  })
  
  filtered <- reactive({dplyr::filter(map_group_hours,map_group_hours$Day == isolate({input$Day})
                                      & map_group_hours$Hour == input$Hour)})
  
  colpal <-reactive({colorNumeric(palette = "Reds", 
                                  domain = c(min((filtered()[[4]])):(max(filtered()[[4]])+1)))})
  
  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles()})
  
  observe({
    pal <- colpal ()
    
    leafletProxy("map", data = filtered()) %>%
      clearMarkers() %>% 
      addCircleMarkers(lat = ~LT, lng = ~Long, fill = TRUE, fillOpacity = 1,
                       label = ~Suburb, popup = ~as.character(Price),color = ~pal(Price))
    })
  
  observe({
    proxy <- leafletProxy("map",data = filtered())
    
    proxy %>% clearControls()
    pal <- colpal()
    proxy %>% addLegend(position = "bottomright", pal = pal, values = ~Price) %>%
      fitBounds(~min(Long), ~min(LT), ~max(Long), ~max(LT))
  })
}
shinyApp(ui = ui,server = server)


