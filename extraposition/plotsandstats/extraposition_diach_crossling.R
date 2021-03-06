library(ggplot2)
library(plyr)

####For English data.
####Read the file of CorpusSearch codes into an R data frame.

foo <- read.delim("allLangsEx.cod.ooo",header=F,sep=":")


####Give appropriate column names to the columns

colnames(foo) <- c("Extraposed","Position","Clause","TextOrSpeech", "Weight","Year","Language")


####Throw out all the codes that refer to tokens that are irrelevant for the study.

"Got up to subsetting"

ex.data <- subset(foo,Extraposed != "z" & Clause != "z" & Position == "sbj" & Year != "z" & Year != "0" & Year != "" & Weight != "z" & Language != "")


library(gdata)


####Make sure R factor groups don't include factors for the irrelevant codes.

ex.data <- droplevels(ex.data)

"finished droplevels"

####Make sure dates abd 0/1 codes are stored as numbers, and weights

ex.data$Year <- as.numeric(as.character(ex.data$Year))
ex.data$Extraposed <- as.numeric(as.character(ex.data$Extraposed))
ex.data$Weight <- as.numeric(as.character(ex.data$Weight))

"finished converting to numeric"


library(RColorBrewer)


####Experimenting with cubic splines

library(splines)
library(MASS)



####Create a new variable in the data frame which will bin the data by century. The only point to doing this is to make a pretty graph of percentages across time.

ex.data$Time2 <- floor(ex.data$Year/50)*50

tail(ex.data)


####Create a new data frame for the percentage plot which averages percentages for each century. Again, this is not useful for real data analysis -- just for making this particular plot.

plot.data <- ddply(ex.data, .(Time2,Language),summarize, whet = mean(Extraposed, na.rm = T), n = sum(!is.na(Extraposed)))

"finished plot.data"

plot.data

p <- ggplot(plot.data, aes(Time2, whet, color=Language, group=Language)) + labs(y = "Probability of Extraposition", x = "\nTime Period") + geom_point(aes(size = n)) + scale_size_area(max_size=12) + stat_smooth() + scale_alpha_continuous(guide="none", limits = c(0,.7)) + scale_color_brewer(palette = "Set1") + ylim(0,1)

"finished plot"
"N for English =" 
sum(plot.data$n)


ggsave(p, file = "exYearBinned50Loess.all.pdf", width = 8, height = 5)