#.....................................................#
#1.- ANOTAR EL TIEMPO AL INICIO

init <- Sys.time()
#.....................................................#
#2.- LEER FICHERO

require(lubridate)
path_file <- "C:/Users/Jose Antonio Rios/Downloads/CourseraData/"
file_energy <- "household_power_consumption.txt"

fich_energy <- paste(path_file,file_energy,sep ="")
df_energy   <- read.table(fich_energy, sep=";",dec=".",header=TRUE,encoding = "UTF-8")

df_energy$fecha <- dmy_hms(paste(df_energy$Date, df_energy$Time))

init <- ymd_hms("2007_02_01 00:00:00 UTC")
fin  <- ymd_hms("2007_02_03 00:00:00 UTC")

df_1 <- subset(df_energy,fecha >= init & fecha<= fin)

n<- as.numeric(as.character(df_1[,7]))
r<- as.numeric(as.character(df_1[,8]))
a<- as.numeric(as.character(df_1[,9]))
#.....................................................#
#3.- GRAFICAR Y SALVAR GRAFICO
limite <- max(n)
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(df_1$fecha,n,type="l",col="black",ylim=c(0,limite),xlab="",ylab="")
par(new=T)
plot(df_1$fecha,r,type="l",col="red",ylim=c(0,limite),xlab="",ylab="")
par(new=T)
plot(df_1$fecha,a,type="l",col="blue",ylim=c(0,limite),xlab="",ylab="Energy Sub metering")
legend("topright", legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1,cex=0.6)
dev.off()
#......................................................#
#4.- CALCULO TIEMPO PGM

end <- Sys.time()
elapsed <- paste("elapsed time for pgm   :", end-init, "  seconds")
print(elapsed)


