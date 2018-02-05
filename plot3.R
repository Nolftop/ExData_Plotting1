dat <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
colnames(dat) <- unlist(header)
twoDaysFeb <- dat[dat$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(twoDaysFeb$Date, twoDaysFeb$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

gap <- as.numeric(twoDaysFeb$Global_active_power)
#gap - Global Active Power


sm1 <- as.numeric(twoDaysFeb$Sub_metering_1)
sm2 <- as.numeric(twoDaysFeb$Sub_metering_2)
sm3 <- as.numeric(twoDaysFeb$Sub_metering_3)

png("plot3.png", width=480, height=480)

plot(datetime, sm1, type="l", ylab="Energy Submetering", xlab="", yaxt = "n")

lines(datetime, sm2, type="l", col="red")

lines(datetime, sm3, type="l", col="blue")
axis(2, at=c(0,10,20,30), labels = c(0,10,20,30),  col = NA, col.ticks = 1)


legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()