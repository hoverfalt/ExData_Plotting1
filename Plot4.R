# Plot4.R

# Read data, 80 000 rows is enough include the data we want (2007-02-01 - 2007-02-02)
df <- read.table("household_power_consumption.txt", sep=";", nrows=80000, header = TRUE, na.strings="?")

# Change dates and times to proper data formats
df$Date <- as.Date(strptime(df$Date, format="%d/%m/%Y"))
df$Time <- as.ITime(strptime(df$Time, format="%H:%M:%S"))

# Reduce list to only include the data we want (2007-02-01 - 2007-02-02)
df <- df[df$Date >= as.Date("2007-02-01") & df$Date <= as.Date("2007-02-02"),]

# Open png graphis device
#png("Plot4.png")

# Draw plot
plot(df$Sub_metering_1, xlab="", ylab="Energy sub meetering", main="", type="l", xaxt="n", col="black")
lines(df$Sub_metering_2, xlab="", type="l", xaxt="n", col="red")
lines(df$Sub_metering_3, xlab="", type="l", xaxt="n", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=c(1,1), cex=0.64, pt.cex = 2, xjust=1.2, seg.len=1)
axis(1, at=c(0, nrow(df)/2, nrow(df)), labels=c("Thu", "Fri", "Sat"))

# Close png graphics device
#dev.off()