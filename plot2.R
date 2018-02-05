dat <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
twoDaysFeb <- dat[dat$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(twoDaysFeb$Date, twoDaysFeb$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

gap <- as.numeric(twoDaysFeb$Global_active_power)
#gap - Global Active Power

png("plot2.png", width=480, height=480)

plot(datetime, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()