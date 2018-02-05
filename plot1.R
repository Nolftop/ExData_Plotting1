dat <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
twoDaysFeb <- dat[dat$Date %in% c("1/2/2007","2/2/2007") ,]


gap <- as.numeric(twoDaysFeb$Global_active_power)
#gap - Global Active Power

png("plot1.png", width=480, height=480)

hist(gap, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

dev.off()

  
  
  
    