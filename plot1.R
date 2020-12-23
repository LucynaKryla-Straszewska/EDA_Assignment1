# EDA Assignment 1 plot1

# Downloading and reading data
if (!file.exists("./data")) {dir.create("./data")}

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./data/Dataset.zip", method = "curl")

# Unziping files, overwrite = TRUE to replace files if previously extracted
unzip("./data/Dataset.zip", overwrite = TRUE)

# Reading data: set sep as ";" and na values as "?"
powerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na = "?")

# creating new variable datetime
powerData$datetime <- strptime(paste(powerData$Date, powerData$Time),format="%d/%m/%Y %H:%M:%S")

#selecting 2007-02-01 and 2007-02-02 for myData
myData <- powerData[(powerData$datetime >= "2007-02-01" & powerData$datetime < "2007-02-03"), -c(1,2)]

# clear memory
rm("powerData")

# generating histogram and saving to png at specified resolution, default units are "px" - shown here for clarity
png("plot1.png", width = 480, height = 480, units = "px")
hist(myData$Global_active_power, breaks = 12, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
