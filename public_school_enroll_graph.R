setwd("/Users/emaansiddique/MEGAsync/Research/ECON191H195B/input")
results <- read.csv("public_school_enroll.csv")

results <- subset(results, year>2001)

treated <- subset(results,treat==1)
control <- subset(results,treat==0)

treated_agg <- aggregate(treated, by=list(treated$year), mean)
control_agg <- aggregate(control, by=list(control$year), mean)

## Plot of parallel trends ##
plot(treated_agg$year, treated_agg$rate, type='l', lty='dashed', lwd=2,
     xlab='Year', ylab='Mean public school enrollment rates', 
     ylim=c(0,0.5))
par(new = TRUE)
plot(control_agg$year, control_agg$rate, type='l', lty='dotted', lwd=2,
     xlab='Year', ylab='Mean public school enrollment rates', 
     ylim=c(0,0.5))
par(new = TRUE)
abline(v = 2013)
legend("bottomright",legend=c("High intensity","Low intensity"),col=c("black",'black'),
       lty=2:3, cex=0.5, text.width=0.5)
