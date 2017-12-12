##Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
plot1 <- function(){
  # read the data
  NEI <- readRDS("summarySCC_PM25.rds")
  totalPerYear <- tapply(NEI$Emissions, NEI$year, sum)
  png("plot1.png", width=640, height=640)
  plot(totalPerYear, xaxt = "n",yaxt = "n",col = "black",pch = 20, cex = 3, xlab = "Years", ylab = "Emission", main = "Decrease in total emissions from PM2.5 in the United States (1999-2008)")
  axis(1, at=1:4, labels = names(totalPerYear))
  axis(side=2, at=axTicks(2), labels=formatC(axTicks(2), format="d", big.mark=','))
  lines(x = totalPerYear, lwd = 4, col = "red")
  dev.off()
}
