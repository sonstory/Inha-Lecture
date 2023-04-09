dat = data.frame()
edit(dat) # 수정한 결과를 그대로 return
fix(dat) # 수정한 결과를 적용
dat

# readline
a = readline("Input any integer: "); a
b = readline("Input two integers with comma (ex:1,2) :")
as.numeric(unlist(strsplit(b,"[,]")))

# scan
path = "C:/Users/sjy54/OneDrive - 인하대학교/Son/05. INHA/4-1/통계소프트웨어 및 실습/강의 기록/example/example_data/"
setwd(path)
dir()
x1 = scan(file="input_noh.txt", what=numeric()); x1[1:5]
x2 = scan(file="input_noh.txt", what=character()); x2[1:5]
x3 = scan(file="input_h.txt"); x3[1:5] # 실수가 아닌 문자열이 있어서 에러
x4 = scan(file="input_h.txt", what=character()); x4[1:5]
x = matrix(as.numeric(x4[-(1:2)]), ncol=2, byrow=T); x

setwd("C:/Users/sjy54/OneDrive - 인하대학교/Son/05. INHA/4-1/통계소프트웨어 및 실습/강의 기록/")
grep('^i', dir(), value=T)
dat = read.table(file="./example/example_data/input_noh.txt"); dat
dat2 = read.table(file="./example/example_data/input_noh.txt", header=T); dat2
dat3 = read.table(file="./example/example_data/input_h.txt", header=F); dat3
dat4 = read.table(file="./example/example_data/input_h.txt", header=T); dat4
dat5 = read.table(file="./example/example_data/input_h.txt", header=F, stringsAsFactors=T); dat5

dat3[1:6,1]
dat5[1:6,1]
head(dat); head(dat2)
head(dat3,4); head(dat4); tail(dat,3)
options()$stringsasFactors
options(stringsAsFactors = T)

dim(dat2)
nrow(dat2)
ncol(dat2)

# cat
x <- 1:10; x
cat(x, sep="\t")
cat("\n", 1, "st element of x = ", x[1])
cat(x, file="x.txt", sep="\t", append=F)
cat('\t', file="x.txt", sep="", append=T)
cat(x, file="x.txt", sep='\t', append=T)

i = 0
while(1){
  i = i+1
  cat('\n', i) # cat은 화면에 찍고 저장하지 않음. paste는 저장
}

for(i in 1:1000){
  if(i %% 100 == 0)
    cat('\n', i, 'th iteration has finished.')
}

# write.table
setwd("C:/Users/sjy54/OneDrive - 인하대학교/Son/05. INHA/4-1/통계소프트웨어 및 실습/강의 기록/file/")
x1 <- 1:20
x2 <- rep(c("A", "B", "B", "A"), 5); x2
x3 <- rep(c(T,F), each=10); x3
dat <- data.frame(x1,x2,x3); dat
write.table(dat, file='test1.txt', row.names=T,
            col.names=T, quote=T, sep='\t')
write.table(dat, file='test2.txt', row.names=F,
            col.names=F, quote=F, sep='\n')
write.table(dat, file='test3.csv',sep=",", row.names=F)
write.table(dat, file='test4.txt', row.names=T,
            col.names=T, quote=T, sep=' ')

dat = read.csv(file="test3.csv"); dat
dat2 = read.csv(file="test3.csv", stringsAsFactors = F); dat2

install.packages("readxl")
library(readxl)
dat = read_xlsx(path='../example/food.xlsx', sheet=1, skip=0, col_names=T); dat
head(dat)

# save
save(list = c("dat"), file="ex_dat1.Rdata")
save.image(file="ex_data2.Rdata")
rm(list=ls())
load(file = "ex_dat1.Rdata")
ls()
load(file="ex_data2.Rdata")
ls()

# head & tail
dat = matrix(1:10, 5, 2); dat
dat2 = data.frame(1:5, 6:10); dat2
length(dat)
length(dat2)
dim(dat)
dim(dat2)

# lapply & sapply
v = c("a,b,c,d,e", "a,b", "d,e,f"); v
lapply(v, nchar)
sp = strsplit(v, ','); sp
lapply(sp, length)
lapply(sp, paste0, 3)
sapply(v, nchar)
lapply(sp, "[[", 2); sapply(sp, "[[", 2)
get_elm = function(x,k) {return(x[k])}
lapply(sp, get_elm , 2)
sapply(sp, length)
x = list(a=1:10, b=rnorm(20)); x
sapply(x, quantile, c(0.25, 0.5, 0.75))

search()
ls(8)

install.packages("deplyr")
library(deplyr)
ls(2)
filter(mtcars, cyl==4, am==1)
filter(mtcars, wt>2, cyl==8)
names(mtcars)

# select, mutate
install.packages("deplyr")
library(dplyr); search()
select(mtcars, mpg, cyl, wt)
select(mtcars, -hp, -gear) # 강의노트에 있는 mpg 빼야함
mtf = select(mtcars, mpg, am, cyl, hp, wt)
mutate(mtf, hw_rat = hp/wt)
mutate(mtf, hw_rat=hp/wt, cw_rat=cyl/wt)

# arrange
arrange(mtf, mpg, desc(cyl))
arrange(mtf, am, cyl, wt)
summarize(mtcars, m_mpg=mean(mpg), v_mpg=var(mpg))
summarize(mtcars, md_mpg=median(mpg), md_wt=median(wt))
summarise_all(select(mtcars, mpg, cyl, wt), mean)
summarise_all(select(mtcars, mpg, cyl, wt), list(mean,sd))
summarise_all(select(mtcars, mpg, cyl, wt), 
              list(mean=mean, sd=sd))              

# group_by
mt_gr = group_by(mtcars, cyl)
summarize(mt_gr, m_mpg=mean(mpg), m_wt=mean(wt))
summarize(mt_gr, v_mpg=var(mpg), v_wt=var(wt))
summarise_all(mt_gr, list(mean=mean, var=var))

# pipe
dat <- group_by(mtcars, cyl); dat
dat <- select(dat, mpg, wt, cyl); dat
dat <- summarize(dat, m_mpg=mean(mpg)); dat
dat <- summarize(dat, m_mpg > 16); dat
dat2 <- mtcars %>%
  group_by(cyl) %>%
  select(mpg, wt, cyl) %>%
  summarize(m_mpg=mean(mpg)) %>%
  filter(m_mpg > 16)
dat2

# 결측값 확인
x <- matrix(c(NA,1,3,NA,NA,2),3,2); is.na(x)

sum(is.na(x)) # number of missing values
which(is.na(x)) # 1차원 위치
which(is.na(x), T) # 2차원 위치
apply(x,2,mean,na.rm=T)
x[which(is.na(x))]
x[which(is.na(x), T)]
x[which(is.na(x))] = 2; x

x <- matrix(c(NA,1.6, 3.5, 3.8, NA, NA, 2.4, 2.3),4,2); x
apply(x,2, mean, na.rm=T)
indx = which(is.na(x), T)
x[indx] = apply(x,2, mean, na.rm=T)[indx[,2]];x