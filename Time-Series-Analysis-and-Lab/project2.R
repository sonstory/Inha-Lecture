rm(list=ls())
library(readxl)

data = read_excel('ProjectDat.xlsx',
                  sheet = '??ũ??Ʈ 1',
                  range="R2C7:R501C7",
                  col_names = 'UW')

library(dplyr)
as.data.frame(data)

nrow(data)
index = 1: nrow(data)

library(astsa)
library(lmtest)
library(tseries)
library(fUnitRoots)

# Time series Plot of Original Series 

tsdata = ts(data, start = 1961, frequency=12)
ts.plot(tsdata)

logtsdata = log(tsdata)
ts.plot(logtsdata)

acf2(logtsdata)

d12tsdata = diff(logtsdata, lag=12)

ts.plot(d12tsdata)

acf2(d12tsdata)

d121tsdata = diff(d12tsdata)
ts.plot(d121tsdata)


acf2(d121tsdata)
adf.test(d121tsdata)

fit1 = arima(d121tsdata, order = c(3,0,2), seasonal = list(order = c(2,0,0), period = 12))
ts.plot(resid(fit1))
acf2(resid(fit1))             
adf.test(resid(fit1))

qqnorm(resid(fit1))
qqline(resid(fit1))

Box.test(resid(fit1), type = "Ljung")

summary(fit1)

auto.arima(d121tsdata)
