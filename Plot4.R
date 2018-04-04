

#code for plotting the fourth plot.

#extracting the data.frame (using the data.table package) and subsetting for the required dates.
hhpc <- fread("household_power_consumption.txt", verbose = FALSE)
hhpc[, Date := dmy(Date)][]
hhpc <- hhpc[Date >= ymd("2007-02-01") & Date <= ymd("2007-02-02"),]

hhpc[, Def_time := strptime(paste0(Date, "/", Time), "%Y-%m-%d/%H:%M:%S")][]

png(file = "plot4.png", width = 480, height = 480)
      
  par(mfrow = c(2,2))
  
  with(hhpc, plot(Def_time, Global_active_power, type = "line", ylab = "Global Active Power (kilowatts)"))
  
  with(hhpc, plot(Def_time, Voltage, type = "line", xlab = "datetime"))
  
  with(hhpc, plot(Def_time, Sub_metering_1, type = "line", ylab = "Energy sub metering", xlab = ""))
  with(hhpc, lines(Def_time,  Sub_metering_2, col = "red"))
  with(hhpc, lines(Def_time,  Sub_metering_3, col = "blue"))
  legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty = 1)
  
  with(hhpc, plot(Def_time, Global_reactive_power, type = "line", xlab = "datetime"))
  
dev.off()

par(mfrow = c(1,1))