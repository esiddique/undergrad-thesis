setwd("/Users/emaansiddique/MEGAsync/Research/ECON191H195B/input")
rural <- read.csv("years_edu_rural.csv")
rural <- subset(rural, year>2001)

## Parallel trends assumption -- rural
treated2 <- subset(rural,treat==1)
control2 <- subset(rural,treat==0)

treated_agg2 <- aggregate(treated2, by=list(treated2$year), mean)
control_agg2 <- aggregate(control2, by=list(control2$year), mean)

plot(treated_agg2$year, treated_agg2$years_edu, type='l', lty='dashed', lwd=2,
     xlab='Year', ylab='Mean years of education', 
     ylim=c(0,7))
par(new = TRUE)
plot(control_agg2$year, control_agg2$years_edu, type='l', lty='dotted', lwd=2,
     xlab='Year', ylab='Mean years of education', 
ylim=c(0,7))
par(new = TRUE)
abline(v = 2013)
legend("topleft",legend=c("High intensity","Low intensity"),col=c("black",'black'),
       lty=2:3, cex=0.75, text.width=0.5)

### WOMEN ###
setwd("/Users/emaansiddique/MEGAsync/Research/ECON191H195B/input")
rural <- read.csv("years_edu_rural_WOMEN.csv")
rural <- subset(rural, year>2001)

## Parallel trends assumption -- rural
treated2 <- subset(rural,treat==1)
control2 <- subset(rural,treat==0)

treated_agg2 <- aggregate(treated2, by=list(treated2$year), mean)
control_agg2 <- aggregate(control2, by=list(control2$year), mean)

plot(treated_agg2$year, treated_agg2$years_edu, type='l', lty='dashed', lwd=2,
     xlab='Year', ylab='Mean years of education', 
     ylim=c(0,7))
par(new = TRUE)
plot(control_agg2$year, control_agg2$years_edu, type='l', lty='dotted', lwd=2,
     xlab='Year', ylab='Mean years of education', 
     ylim=c(0,7))
par(new = TRUE)
abline(v = 2013)
legend("topleft",legend=c("High intensity","Low intensity"),col=c("black",'black'),
       lty=2:3, cex=0.75, text.width=0.5)

