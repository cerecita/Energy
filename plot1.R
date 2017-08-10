#....................................................#
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
df_1[,3]<- as.numeric(as.character(df_1[,3]))
#.....................................................#
#3.- GRAFICAR Y SALVAR GRAFICO

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(df_1$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")
dev.off()
#......................................................#
#4.- CALCULO TIEMPO PGM

end <- Sys.time()
elapsed <- paste("elapsed time for pgm   :", end-init, "  seconds")
print(elapsed)


