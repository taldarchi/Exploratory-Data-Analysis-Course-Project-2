##How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
plot5 <- function(){
  library(ggplot2)
  
  # read the data
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  #grep motor vehicle releated data
  greppedVeh <- grep("\\b[Vv]ehicle\\b|\\b[Vv]ehicles\\b|", SCC$SCC.Level.Two, value = TRUE)
  
  veh <- subset(SCC, SCC.Level.Two %in% greppedVeh)
  
  vehRelated <- subset(NEI, SCC %in% veh$SCC & NEI$fips =="24510")
  ggplot(data = vehRelated, aes(x=as.factor(year), y=Emissions, fill= as.factor(year))) +
    geom_bar(stat = "identity", position = "dodge") +
    xlab("Year") +
    theme_bw() +
    ylab("Emission") +
    ggtitle("Changes in PM2.5 emissions from motor vehicle sources from 1999–2008 in Baltimore City") +
    labs(fill = "Year") +
    scale_fill_brewer(palette = "Dark2")

  ggsave("plot5.png", width = 8.76, height = 5.78)
}