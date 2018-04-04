

#code for plotting the second plot.

#extracting the data.frame (using the data.table package) and subsetting for the required dates.
hhpc <- fread("household_power_consumption.txt")
hhpc[, Date := dmy(Date)][]
hhpc <- hhpc[Date >= ymd("2007-02-01") & Date <= ymd("2007-02-02"),]

hhpc[, Def_time := strptime(paste0(Date, "/", Time), "%Y-%m-%d/%H:%M:%S")][]

png(file = "plot2.png", width = 480, height = 480)
  with(hhpc, plot(Def_time, Global_active_power, type = "line", ylab = "Global Active Power (kilowatts)"))
dev.off()