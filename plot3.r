data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

## Creates overlayed line graphs of second element's effect on first element,
dev.copy(png, file="plot3.png", height=480, width=480)

with(data1, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="", lwd = 2)
  ## Add second line graph
  points(Sub_metering_2~Datetime, type="l")
  lines(Sub_metering_2~Datetime, type="l", col = "red")
  ## Add third line graph
  points(Sub_metering_3~Datetime, type="l")
  lines(Sub_metering_3~Datetime, type="l", col = "blue")
})

## Adds a legend
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = (c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")))



dev.off()