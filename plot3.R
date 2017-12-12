##Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
##which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City?

plot3 <- function(){
  library(ggplot2)
  # read the data
  NEI <- readRDS("summarySCC_PM25.rds")
  baltimore <- subset(NEI, NEI$fips =="24510")
  ggplot(data = baltimore, aes(x=as.factor(year), y=Emissions, fill= as.factor(year))) +
    facet_grid(.~type) +
    geom_bar(stat = "identity", position = "dodge") +
    xlab("Year") +
    ylab("Emission") +
    ggtitle("Decrease in PM2.5 emissions by source from 1999–2008 for Baltimore City") +
    labs(fill = "Year")
  ggsave("plot3.png", width = 8.76, height = 5.78)
}