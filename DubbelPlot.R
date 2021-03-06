#http://stackoverflow.com/questions/28810765/combining-lines-and-boxplots-in-r
setwd("C:\\Users\\RPR\\OneDrive - Oasen N.V\\Documents\\Beleggen")
library(XML)
library(tidyr)
library(foreign)
library(dplyr)

fondsen <- c("nn.bas.mat",
             "nn.dutch",
             "nn.dmixf.1",
             "nn.eu.smcp",
             "nn.g.obl.f",
             "nn.it.fd",
             "nn.prem.dv",
             "nn.telcoms"
)

for(i in 1:length(fondsen)) {
  fonds <- fondsen[i]
  rDF <- read.dbf(paste("Data\\", fonds, ".dbf", sep = ""), as.is = TRUE)
  rDF["datum"] <- paste("20", substring(rDF[,1], 1, 6), sep="")
  rDF["koers"] <- as.numeric(substring(rDF[,1], 8, 15))
  rDF["periode"] <- paste("20", substring(rDF[,1], 1, 2), "-",substring(rDF[,1], 3, 4), sep="")
  uMaand <- unique(rDF$periode
  )
  fMaand <- factor(rDF$periode,
                   levels = c(uMaand)
  )
  xrange <- range(rDF$datum)
  yrange <- range(rDF[,(names(rDF) != "datum")])
  #yrange <- range(rDF[,()])
  #plot(c(0,40), rDF.koers)
  #png(file = paste("PNG\\", fonds, "_", Sys.Date(), ".png", sep = ""), width = 1500, height = 828)
  #  boxplot(koers~fMaand,
  #       data=rDF,
  #       main=toupper(fonds),
  #       font.main=3,
  #       cex.main=1,
  #       xlab="Maand",
  #       las=1,
  #       #ylim=c(40.0, 70.0), 
  #       ylab="€",
  #       font.lab=3,
  #       col="yellow",
  #       outline = TRUE
  #)
  #mtext(Sys.time(), 3, cex=0.8, line = 0)
  #mtext("Koers in euro's", 2, cex=0.8, line = 2)
  #dev.off()
  rm("rDF", "fonds", "fMaand", "uMaand")
}
rm("fondsen", "i")
