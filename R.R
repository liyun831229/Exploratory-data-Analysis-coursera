options(stringsAsFactors=F)
dat <- read.csv('household_power_consumption.txt', sep = ';',header = T)
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
idx <- which(dat$Date == "2007-02-02"| dat$Date == "2007-02-01" )
keep <- dat
dat <- dat[idx,]
dat$Time <- strptime(paste(dat$Date,dat$Time[1:4],sep =","),"%Y-%m-%d, %H:%M:%s")

png("plot1.png")
hist(as.numeric(dat[,3]),xlab = 'Global Active Power(kilowatts)', main = "Global Active Power", col = 'red')
dev.off()

with(dat, plot(dat[,2],as.numeric(dat[,3])))

