setwd('C:/Users/sjy54/OneDrive - 인하대학교/Son/05. INHA/4-1/통계소프트웨어 및 실습/강의 기록/example_data_part2/')
.Platform

# Load Data
raw_dat = read.csv(file="Ex_data.csv")

# preprocessing
gr_ind = gl(2, 221)
dat_mat <- t(as.matrix(raw_dat[,-1])); dat_mat
dim(dat_mat)
rownames(dat_mat) <- paste0("S", 1:nrow(dat_mat))
colnames(dat_mat) <- raw_dat[,1]
head(dat_mat[,1:10])

## Null Value
indx <- which(is.na(dat_mat), T); indx
nrow(indx)
col_ind = indx[,2]
col_m = apply(dat_mat[,col_ind], 2, mean, na.rm=T); col_m
dat_mat[indx] = col_m
sum(is.na(dat_mat))
dim(dat_mat)

## 동일한 유전자에 대해 측정전 자료를 평균값으로 대체
uq_names <- unique(colnames(dat_mat)); uq_names
p <- length(uq_names); n <- dim(dat_mat)[1]
expr_dat <- matrix(0,n,p)

tic = Sys.time()
for(i in 1:p)
{
  expr_dat[,i] = apply(as.matrix(dat_mat[, colnames(dat_mat) == uq_names[i]]), 1, mean)
  cat("\n",i," / ",p," step ")
}
toc = Sys.time(); as.numeric(toc-tic, units='secs')

head(expr_dat[,1:8])
colnames(expr_dat) <- uq_names
rownames(expr_dat) <- rownames(dat_mat)
head(expr_dat[,1:20])
save(list=c('uq_names', "expr_dat"), file='expr_dat.Rdata')

# merge
dat1 = data.frame(id=1:5,
                  name=c('Kim', 'Lee', 'Jung', 'Park', 'Choi'),
                  dept=c(1,3,2,2,1))
dat2 = data.frame(dept_id=c(1,2,3),
                  dept_name=c('Computer Science', 'Statistics', 'Economics'))
dat1
dat2
merge(dat1, dat2, by.x='dept', by.y='dept_id', sort=F)

# boxplot
dat = read.table("Ex211_utf.txt", header=T)
head(dat)
dat[,6]
dat$Job
attach(dat); Job
x11()
windows()
plot(factor(Job), main="직업의 막대그림", xlab='직업', 
     ylab='인원수(명)', ylim=c(0,15), col = c('red', 'green', 'skyblue', 'magenta'))
grep('sky', colors(), value=T)
box()
detach(dat)
factor(Job) # error

dat = read.table("Ex211_utf.txt", header=T, sep='\t')
attach(dat)
freq = table(Job); freq
detach(dat)

x11()
out = barplot(freq, main="직업의 막대그림", xlab="직업",
              ylab="인원수(명)", ylim=c(0,15), xlim=c(0,5))
box()
text(out, freq+0.5, freq, cex=1.5)
for (i in 1:4)
{
  lines(c(0,5), rep(freq[i],2), lty=3)
}

## png 파일로 여러 그림 저장
dir.create('./test_img'); setwd('./test_img')
for(j in 1:100)
{
  png(filename = paste0("test_img_", j, '.png'),
      width=960, height=960, units="px",
      family="Korea1deb")
  out = barplot(freq, main="직업의 막대그림", xlab="직업",
                ylab="인원수(명)", ylim=c(0,15), xlim=c(0,5))
  box()
  text(out, freq+0.5, freq, cex=1.5)
  for (i in 1:4)
  {
    lines(c(0,5), rep(freq[i],2), lty=3)
  }
  dev.off()
}

dev.off()
dev.list()
dev.cur()
x11()
x11()
dev.set(2)

# gplots
install.packages('gplots')
data(VADeaths); VADeaths
library(gplots)
x11()
barplot2((VADeaths), beside=TRUE, col=gray(seq(0.4, 0.9, length=5)),
         legend=rownames(VADeaths), ylim=c(0,100))
title(main="Death Rates in VIrginia", font.main=4)

# barplot2
hh <- t(VADeaths)[,5:1]; hh
cil <- hh * 0.85
ciu <- hh * 1.15
x11()
mp <- barplot2(hh, beside=TRUE,
               col = gray(seq(0.4, 0.9, length=4)),
               legend=colnames(VADeaths),
               ylim=c(0,100),
               main="Death Rates in Virginia",
               font.main=4,
               sub="Faked 95 percent error bars",
               cex.names=1.5, plot.ci=TRUE,
               ci.l=cil, ci.u=ciu, plot.grid=TRUE)

# pie chart
rainbow(24)
x11()
barplot(rep(1,6), col=paste0("#FF0000",
                             c("00","11","33","55","99","FF")))

x11()
pie(rep(1,24), col=rainbow(24), radius=0.9)
pie.sales <- c(0.12, 0.3, 0.26, 0.16, 0.04, 0.12)
lbl = c("Bluberry", "Cherry", "Apple", "Boston Cream", "Other", "Vanila Cream")
names(pie.sales) = paste0(lbl, " (", pie.sales*100, "%)")

x11()
pie(pie.sales, col=rainbow(length(pie.sales)))
pie.sales

# histogram
load(file='expr_dat.Rdata')
uq_names = colnames(expr_dat)
x <- expr_dat[,10]
x11()
hist(x, breaks=20, col='gray', main=uq_names[10])
x11()
hist(x, breaks=20, freq=F, col='lightblue', main=uq_names[10])
hist(x, breaks=20, plot=F)

out = hist(x, breaks=40, plot=F)
nbins = length(out$mids)
x11()
hist(x, breaks=20, freq=F)
m_x = mean(x, na.rm=T)
sd_x = sd(x, na.rm=T)
t = seq(3,9,by=0.01)
lines(t, dnorm(t,m_x,sd_x),col='red')
x11(); set.seed(1234)
y = rnorm(1000, m_x, sd_x)
hist(y, breaks=20, freq=F)
lines(t, dnorm(t,m_x,sd_x), col='red')
nbin = length(out$mids)
col_vec=rep('lightgray', nbin)
col_vec[out$mids>=5.0 & out$mids<=6.0] = 'steelblue'

x11()
hist(y, breaks=20, col=col_vec)
lines(t,dnorm(t,m_x,sd_x),col='red')