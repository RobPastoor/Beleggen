setwd("C:/Users/RPR/OneDrive - Oasen N.V/Documents/Beleggen")
library(XML)
library(tidyr)
library(foreign)
library(dplyr)

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

for(i in 1:length(fondsen)) {
  fonds <- fondsen[i]
  rDF <- read.dbf(paste("Data/", fonds, ".dbf", sep = ""), as.is = TRUE)
  fileUrl <- paste("http://www.behr.nl/Beurs/Slotkoersen/slotkoersen.php?fd=", fonds, sep = "")
  doc <- htmlTreeParse(fileUrl, useInternal = TRUE)
  koers <- xpathSApply(doc, "//pre", xmlValue)
  sKoers <- unlist(strsplit(koers, split = "\n"))
  wDF <- data.frame(datumkoers = unlist(sKoers), stringsAsFactors = FALSE)
  rbDF <- rbind(rDF, wDF)
  oDF <- rbDF %>% distinct(datumkoers, .keep_all = TRUE)
  write.dbf(oDF, paste("Data/", fonds, ".dbf", sep = ""), factor2char = TRUE)
  rm("oDF", "rbDF", "rDF", "wDF", "doc", "fileUrl", "fonds", "koers", "sKoers")
}
rm("fondsen", "i")