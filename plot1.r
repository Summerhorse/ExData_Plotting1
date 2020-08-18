## Reads data set into R and labels it data_full 
## Subsets dates needed from data_full and labels that data1
## Converts date format and saves it to data1$Date
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

## Draws a histogram of required data,
## Uses color and labels axis and chart appropriately
dev.copy(png, file="plot1.png", height=480, width=480)

hist(data1$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.off()