MyData <- read.csv(file="Data/BG-NN BASIC MATERIALS FUND.csv", header=TRUE, sep=";")
fMAAND <- factor(MyData$MAAND, 
                 levels = c("jan",
                            "feb",
                            "mrt",
                            "apr",
                            "mei",
                            "jun",
                            "jul",
                            "aug",
                            "sep",
                            "okt",
                            "nov",
                            "dec"
                 )
)
boxplot(WAARDE~fMAAND,
        data=MyData,
        main=toupper("BG-NN BASIC MATERIALS FUND"),
        font.main=3,
        cex.main=1.2,
        xlab="Maand",
        las=1,
        ylim=c(40.0, 70.0), 
        ylab="€",
        font.lab=3,
        col="yellow",
        outline = TRUE
)

MyData <- read.csv(file="Data/BG-NN DUTCH FUND.csv", header=TRUE, sep=";")
fMAAND <- factor(MyData$MAAND, 
                 levels = c("jan",
                            "feb",
                            "mrt",
                            "apr",
                            "mei",
                            "jun",
                            "jul",
                            "aug",
                            "sep",
                            "okt",
                            "nov",
                            "dec"
                 )
)
boxplot(WAARDE~fMAAND,
        data=MyData,
        main=toupper("BG-NN DUTCH FUND"),
        font.main=3,
        cex.main=1.2,
        xlab="Maand",
        las=1,
        ylim=c(40.0, 70.0), 
        ylab="€",
        font.lab=3,
        col="yellow",
        outline = TRUE
)
