rm(list=ls())
install.packages("readxl")
library(readxl)

data = read_excel('ProjectDat.xlsx',
           sheet = '1',
           range="R2C2:R198C2",
           col_names = 'constration')

data

library(dplyr)
as.data.frame(data)

nrow(data)
index = 1: nrow(data)

install.packages("astsa")
install.packages("lmtest")
install.packages("tseries")
install.packages("fUnitRoots")
install.packages("forecast")

library(astsa)
library(lmtest)
library(tseries)
library(fUnitRoots)
library(forecast)

install.packages("ggplot2")

# Time series Plot of Original Series 
library(ggplot2)
ggplot(data, aes(x=index, y=constration)) + geom_line(color="blue", size=1) + geom_point(color ="red", size = 3) + ggtitle("Time Series Plot of Original Series")

tsdata = ts(data)
acf2(tsdata)

# ACF : Slow Decay
# PACF : Cut-Off After Lag 2

d1_data = diff(tsdata)
ts.plot(d1_data, col='blue')

sdata, main = "Autocorrelation Function for D1_concent")
pacf(d1tsdata, main = "Partial Autocorrelation Function for D1_concent")

# ACF?? ???t1 = arima(data,o2 = arima(data, order = c(0,1,1))

t1))
acf2(resid(f2), pch=0)

)             2))

0adf.test(resid(fit2))
1ne(resid(fit1))
2), col='blue')
qqline(resid(fit2), col='blue')

pe = "Ljung")

ata,order =2)
fit2
