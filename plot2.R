##Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?
plot2 <- function(){
  # read the data
  NEI <- readRDS("summarySCC_PM25.rds")
  baltimore <- subset(NEI, NEI$fips =="24510")
  totalPerYear <- tapply(baltimore$Emissions, baltimore$year, sum)
  png("plot2.png", width=640, height=640)
  plot(totalPerYear, xaxt = "n",yaxt = "n",col = "purple",pch = 20, cex = 3, xlab = "Years", ylab = "Emission", main = "Decrease in total emissions from PM2.5 in Baltimore City, Maryland (1999-2008)")
  axis(1, at=1:4, labels = names(totalPerYear))
  axis(side=2, at=axTicks(2), labels=formatC(axTicks(2), format="d", big.mark=','))
  lines(x = totalPerYear, lwd = 4, col = "orange")
  dev.off()
}