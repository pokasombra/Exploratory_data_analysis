

#code for plotting the third plot.

#extracting the data.frame (using the data.table package) and subsetting for the required dates.
hhpc <- fread("household_power_consumption.txt", verbose = FALSE)
hhpc[, Date := dmy(Date)][]
hhpc <- hhpc[Date >= ymd("2007-02-01") & Date <= ymd("2007-02-02"),]

hhpc[, Def_time := strptime(paste0(Date, "/", Time), "%Y-%m-%d/%H:%M:%S")][]

png(file = "plot3.png", width = 480, height = 480)
  with(hhpc, plot(Def_time, Sub_metering_1, type = "line", ylab = "Energy sub metering", xlab = ""))
  with(hhpc, lines(Def_time,  Sub_metering_2, col = "red"))
  with(hhpc, lines(Def_time,  Sub_metering_3, col = "blue"))
  legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty = 1)
dev.off()