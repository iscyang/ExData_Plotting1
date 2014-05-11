#
#Before running this code, please be sure the data file exists in current working directory.
#
if (file.exists('household_power_consumption.txt')) {
	tmp=read.csv('household_power_consumption.txt',sep=";",stringsAsFactor=FALSE,na.string="?")
	tmp$Date=as.Date(tmp$Date,"%d/%m/%Y")
	dataset=subset(tmp, tmp$Date>=as.Date("2007-02-01","%Y-%m-%d") & tmp$Date<=as.Date("2007-02-02","%Y-%m-%d"))
	png(filename="plot1.png")
	hist(dataset$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
	dev.off()
} else {
	warning("Before running this code, please be sure the data file, 'household_power_consumption.txt,' exists in current working directory.")
}