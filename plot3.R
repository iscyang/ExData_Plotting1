#
#Before running this code, please be sure the data file exists in current working directory.
#
if (file.exists('household_power_consumption.txt')) {
	tmp=read.csv('household_power_consumption.txt',sep=";",stringsAsFactor=FALSE,na.string="?")
	tmp$Date=as.Date(tmp$Date,"%d/%m/%Y")
	dataset=subset(tmp, tmp$Date>=as.Date("2007-02-01","%Y-%m-%d") & tmp$Date<=as.Date("2007-02-02","%Y-%m-%d"))
	png(filename="plot3.png")
	mn=dataset$Date[1]
	plot(dataset$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="",xaxt="n")
	lines(dataset$Sub_metering_2,type="l",col="red")
	lines(dataset$Sub_metering_3,type="l",col="blue")
	legend("topright",lty=1,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))
	axis(1,at=seq(1,nrow(dataset)+1,60*24),labels=format(seq(mn,mn+2,1),"%a"))
	dev.off()
} else {
	warning("Before running this code, please be sure the data file, 'household_power_consumption.txt,' exists in current working directory.")
}