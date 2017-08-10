#.....................................................#
#1.- ANOTAR EL TIEMPO AL INICIO

init <- proc.time()
#.....................................................#
#2.- LEER  Y SELECCIONAR FICHERO

require(lubridate)

path_file <- "C:/Users/Jose Antonio Rios/Downloads/CourseraData/"
file_energy <- "household_power_consumption.txt"

fich_energy <- paste(path_file,file_energy,sep ="")
df_energy   <- read.table(fich_energy, sep=";",dec=".",header=TRUE,encoding = "UTF-8")

df_energy$fecha <- dmy_hms(paste(df_energy$Date, df_energy$Time))

init <- ymd_hms("2007_02_01 00:00:00 UTC")
fin  <- ymd_hms("2007_02_03 00:00:00 UTC")

df_1 <- subset(df_energy,fecha >= init & fecha <= fin)

#.....................................................#
#4.- PREPARAR DATOS PLOT_4

v<- as.numeric(as.character(df_1[,5]))
g<- as.numeric(as.character(df_1[,4]))
a<- as.numeric(as.character(df_1[,3]))

n<- as.numeric(as.character(df_1[,7]))
r<- as.numeric(as.character(df_1[,8]))
p<- as.numeric(as.character(df_1[,9]))
#.....................................................#
#4.1.- GRAFICAR Y SALVAR GRAFICO
limite_s <- max(v)
limite_i <- min(v)
limite_h <- max(g)
limite   ?zip.unpack()<- max(n)

#.....................................................#
#3.- GRAFICAR Y SALVAR GRAFICO

png(filename = "plot4.png", width = 480, height = 480, units = "px") 

par(mfrow=c(2,2))

plot(df_1$fecha,a,type="l",xlab="",ylab="Global active power (kilowatts)")

plot(df_1$fecha,v,type="l",col="black",ylim=c(limite_i,limite_s),xlab="datetime",ylab="Voltage")

plot(df_1$fecha,n,type="l",col="black",ylim=c(0,limite),xlab="",ylab="")
par(new=T)
plot(df_1$fecha,r,type="l",col="red",ylim=c(0,limite),xlab="",ylab="")
par(new=T)
plot(df_1$fecha,a,type="l",col="blue",ylim=c(0,limite),xlab="",ylab="Energy Sub metering")
legend("topright", legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1,cex=0.2)

plot(df_1$fecha,g,type="l",col="black",ylim=c(0,limite_h),ylab="Global_reactive_power",xlab="datetime")

dev.off()

#......................................................#
#4.- CALCULO TIEMPO PGM

end <- proc.time()
end - init

