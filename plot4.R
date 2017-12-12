##Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
plot4 <- function(){
  library(ggplot2)
  
  # read the data
  NEI <- readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")

  #grep coal combustion releated data
  greppedCoal <- grep("\\b[Cc]oal\\b", SCC$EI.Sector, value = TRUE)
  
  #using "Fuel Comb - Comm/Institutional - Coal", "Fuel Comb - Electric Generation - Coal", "Fuel Comb - Industrial Boilers, ICEs - Coal"
  coal <- subset(SCC, EI.Sector %in% greppedCoal)
  
  coalRelated <- subset(NEI, SCC %in% coal$SCC)
  ggplot(data = coalRelated, aes(x=as.factor(year), y=Emissions, fill= as.factor(year))) +
    geom_bar(stat = "identity", position = "dodge") +
    xlab("Year") +
    ylab("Emission") +
    ggtitle("Decrease in PM2.5 emissions from coal combustion-related sources from 1999–2008") +
    labs(fill = "Year") +
    scale_fill_brewer(palette = "Spectral")
  ggsave("plot4.png", width = 8.76, height = 5.78)
}