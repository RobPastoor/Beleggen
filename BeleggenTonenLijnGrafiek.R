setwd("C:/Users/RPR/OneDrive - Oasen N.V/Documents/Beleggen")
library(foreign)

fondsen <- c("nn.bas.mat",
             "nn.dmixf.1",
             "nn.dutch",
             "nn.emeu.pc",
             "nn.eu.smcp",
             "nn.g.em.mk",
             "nn.g.obl.f",
             "nn.it.fd",
             "nn.prem.dv",
             "nn.telcoms"
)

ddat <- as.list(rep("", length(fondsen)))
for(i in 1:length(fondsen)) {
  fonds <- fondsen[i]
  ddat[[i]] <- read.dbf(paste("Data/", fonds, ".dbf", sep = ""), as.is = TRUE)
  ddat[[i]]["datum"] <- paste("20", substring(ddat[[i]][,"datumkoers"], 1, 6), sep="")
  ddat[[i]]["koers"] <- as.numeric(substring(ddat[[i]][,"datumkoers"], 8, 15))
  ddat[[i]]["periode"] <- paste("20", substring(ddat[[i]][,"datumkoers"], 1, 2), "-",substring(ddat[[i]][,"datumkoers"], 3, 4), sep="")
  ddat[[i]]["datum2"] <- as.Date(paste("20", substring(ddat[[i]][,"datumkoers"], 1, 2), "-", substring(ddat[[i]][,"datumkoers"], 3, 4), "-", substring(ddat[[i]][,"datumkoers"], 5, 6),sep=""))
}

plot(ddat[[1]][,"datum2"],
     ddat[[1]][,"koers"],
     type = "l",
     main = toupper("Beleggingsfondsen"),
     col = 1,
     ylim = c(0, 120),
     xlab = "Datum",
     las = 1,
     ylab = "€",
     font.lab = 3,
     font.main = 3,
     cex.main = 1
     )

for(j in 2:length(fondsen)) {
  lines(ddat[[j]][,"datum2"], 
        ddat[[j]][,"koers"], 
        col = j
        )
}
abline(h = seq(0, 120, 10), b = 10, col = "gray80")
mtext(Sys.time(), 3, cex=0.8, line = 0)
mtext("Koers in euro's", 2, cex=0.8, line = 2)
legend('topleft',
       legend=c(fondsen),
       lty=1,
       col=c(1,2,3,4,5,6,7,8,9,10),
       bty = 'y',
       cex = 0.75
       )
rm("ddat", "fonds", "fondsen", "i", "j")
