# Plot1.R

# Read data, 80 000 rows is enough include the data we want (2007-02-01 - 2007-02-02)
df <- read.table("household_power_consumption.txt", sep=";", nrows=80000, header = TRUE, na.strings="?")

# Change dates and times to proper data formats
df$Date <- as.Date(strptime(df$Date, format="%d/%m/%Y"))
df$Time <- as.ITime(strptime(df$Time, format="%H:%M:%S"))

# Reduce list to only include the data we want (2007-02-01 - 2007-02-02)
df <- df[df$Date >= as.Date("2007-02-01") & df$Date <= as.Date("2007-02-02"),]

# Open png graphis device
png("Plot1.png")

# Draw plot
hist(df$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

# Close png graphics device
dev.off()