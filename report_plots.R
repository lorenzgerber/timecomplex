# load experimental data
setwd('~/github/timecomplex/')
rawData<-read.table(file='test.txt', sep='\t', dec='.')

# truncate data for measurments below one second
rawData<-rawData[which(rawData[,1]>10000),]

# assemble and attach data.frame
rawData<-data.frame(nTimes = rawData[,1], runTime = rawData[,2])
attach(rawData)

# aggregate data
results<-aggregate(runTime ~ nTimes, FUN = mean)

par(mfcol=c(1,2))

plot(results[,1], results[,2], type = 'b', ylab = 'runtime s', xlab='n runs')

# transforming the data
plot(results[,1], sqrt(results[,2]), type = 'b', ylab = expression(paste('runtime ', sqrt(s))), xlab = 'n runs' )

summary(lm(sqrt(runTime) ~ nTimes, results))

curve(5.4e-9*x^2 + 2.05e-6*x + 0.2e-4, xlim=c(0,3000), ylab="runtime s", xlab="n repetitions")
curve(6.4e-9*x^2, add=TRUE, col='red')

legend(0, 0.05, c(expression(y = 5.4%*%10^-9*x^2+2.05%*%10^-6*x+0.2%*%10^-4), 
                  expression(y = 6.4%*%10^-9*x^2)), lty=c(1,1), lwd=c(2.5,2.5),col=c('black','red'))
