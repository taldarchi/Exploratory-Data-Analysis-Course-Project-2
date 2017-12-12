##Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources
##in Los Angeles County, California (fips == "06037").Which city has seen greater changes over time in motor vehicle emissions?
plot6 <- function(){
  library(ggplot2)
  
  # read the data
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  
  greppedVeh <- grep("\\b[Vv]ehicle\\b|\\b[Vv]ehicles\\b|", SCC$SCC.Level.Two, value = TRUE)
  
  veh <- subset(SCC, SCC.Level.Two %in% greppedVeh)
  
  vehRelatedBalt <- subset(NEI, SCC %in% veh$SCC & NEI$fips =="24510")
  vehRelatedBalt$City <- "Baltimore"
  vehRelatedLa <- subset(NEI, SCC %in% veh$SCC & NEI$fips =="06037")
  vehRelatedLa$City <- "Los Angeles"
  totalRelated <- rbind(vehRelatedBalt,vehRelatedLa)
  ggplot(data = totalRelated, aes(x=as.factor(year), y=Emissions, fill = totalRelated$City)) +
    geom_bar(stat = "identity", position = "dodge") +
    xlab("Year") +
    theme_bw() +
    ylab("Emission") +
    ggtitle("Comparison between L.A County and Baltimore in emissions from motor vehicle sources from 1999–2008") +
    labs(fill = "City") +
    scale_fill_brewer(palette = "Set1")
  
  ggsave("plot6.png", width = 8.76, height = 5.78)
}