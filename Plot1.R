
#code for plotting the first plot.

#extracting the data.frame (using the data.table package) and subsetting for the required dates.
hhpc <- fread("household_power_consumption.txt")
hhpc[, Date := dmy(Date)][]
hhpc <- hhpc[Date >= ymd("2007-02-01") & Date <= ymd("2007-02-02"),]

hhpc[, Global_active_power := as.numeric(Global_active_power)]

png(file = "plot1.png", width = 480, height = 480)
  with(hhpc, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()

