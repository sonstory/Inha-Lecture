# if statement
x <- 1:5; y<- -2:2
if(any(x<0)) print(x)
if(any(y>0)) print(abs(y))
if(y<0) print(y) # error

if(any(y<0))
{
  print(abs(y))
  cat("\n y contains negative values")
}

x<-1:5
if(length(x)==5)
{
  if(sum(x)==15)
    cat("\n length=", length(x), ", sum = ", sum(x))
  else
  {
  cat("\n length 5 !=", length(x))
}
}

# ifelse function
x = c(10,3,6,9)
y = c(1,5,4,12)
ifelse(x>y, x, y)
score = c(80, 75, 40, 98)
grade = ifelse(score >=50, "pass", "fail"); grade
data.frame(score, grade)

y <- -2:2
ifelse(y>=0, y, -y)
abs(y)

# switch
x <- c(1,3,2,5,2)
i <- 3
switch(i, mean(x), median(x), sd(x), var(x))
sd(x)
type <- "mean"
y = switch(type, mean=mean(x), sd=sd(x), var=var(x)); y

# for statement
s = 0
for(i in 1:100)
{
  s = s + i
}
s

## 예제1 : 동전을 100번 던져서 앞면이 나오면 1000원, 뒷면이 나오면 -500원, 앞면이 10번 나올 떄마다 500원 추가 상금
price = 0
cnt = 0
for (i in 1:100)
{
  coin = sample(c("H", "T"),1)
  if (coin == "H") 
  {
    price = price + 1000
    cnt = cnt + 1
  } else {
      price - 500
  }    
  if(cnt %% 10 == 0)
    price = price + 500
}
price

## 예제2 : 데이터를 10개의 행마다 다른 파일로 저장하는 코드
setwd('C:/Users/sjy54/OneDrive - 인하대학교/Son/05. INHA/4-1/통계소프트웨어 및 실습/강의 기록')
dir.create('./datafile')
f_pre = './datafile/file_'
f_post = '.txt'
dat = mtcars
n = nrow(dat)
cut = 10
nfile = ceiling(n/cut)
for(i in 1:(nfile-1))
{
  ind = (cut*(i-1)+1):(cut*i)
  write.table(dat[ind,],
              file=paste0(f_pre,i,f_post),sep='\t')
}
ind = (cut*i+1):n
write.table(dat[ind,],
            file=paste0(f_pre,i+1,f_post),sep='\t') 

## 예제3 : file_1.txt부터 file_4.txt까지 순차적으로 for문으로 불러와서 4개의 데이터를 하나의 데이터프레임으로 합치기(hint : rbind)
setwd('./datafile')
dat = data.frame()
for (i in 1:4){
  temp = read.table(file=paste0('file_',i,'.txt'), header=T)
  dat = rbind(dat,temp)
}
dat
dim(dat)

# while statement
s = 0
i = 1
while(i<=100)
{
  s = s+i
  i = i+1
}

## 예제 1 : 1부터 100까지 더해나갈 때 3500을 넘게 만드는 숫자와 그때 합은?
s = 0
i = 1
while(s<=3500)
{
  s = s+i
  i = i+1
}
i; s

## 예제 2 : 특정 단어를 만나기 전까지 "/"로 parsing 작업 수행
ch = c("A/B/C/D/F", "A/A/A/AA", "BB/B", "Quit", "D/CC/C")
xp = list()
i = 1
while(ch[i]!="Quit" & i <= length(ch))
{
  xp[[i]] = unlist(strsplit(ch[i],'/'))
  print(xp[[i]])
  i = i + 1

}  
table(unlist(xp))

# break & next
s = 0
for(i in 1:10){
  s = s+i
  if(s>=10)
    break
}
i;s

s=0
for(i in 1:10){
  if(i %% 2 == 1)
    next
  s = s+i
}
i;s

setwd('C:/Users/sjy54/OneDrive - 인하대학교/Son/12. Github/Inha-Lecture/Statistical-Software-and-Lab/Lecture_Note/')
getwd()

# R에서 프로그램 실행 소요 시간 측정하기
system.time({
  s=0
  for(i in 1.1:1e8){
    s = s + i
  }
})
y <- system.time(sum(1.1:1e8)) ## 1e6 = 1 * 10^6, 1e-4 = 1* 10^(-4)
y[1]; y[2]; y[3]; y

tic1 = Sys.time() # 블럭 잡아서 실행
s=0
for(i in 1.1:1e8){
  s = s + i
}
toc1 = Sys.time()
y <- system.time(sum(1.1:1e8))
as.numeric(toc1 - tic1, units='secs')

tic2 = Sys.time()
y <- system.time(sum(1.1:1e8))
toc2 = Sys.time()
as.numeric(toc2 - tic2, units='secs')

n_rep = 10
n = 1e6
xm = rep(0, n_rep)
tic1 = Sys.time()
for(i in 1:n_rep){
  tic2 = Sys.time()
  samp = rnorm(n,2,2)
  xm[i] = mean(samp)
  toc2 = Sys.time()
  cat('\n i=', i, 'time', as.numeric(toc2-tic2, units='secs'))
}
Sys.time()-tic1

tic <- Sys.time()
s = 0
for(i in 1.1:1e5){
  if(i %% 2 == 0 || i %% 3 == 0)
    s = s + i
}
toc <- Sys.time(); as.numeric(toc-tic, units='secs')

tic2 <- Sys.time()
x <- 1.1:1e5
s2 = sum(x[x%%2==0 | x%%3 ==0])
toc2 <- Sys.time()
as.numeric(toc2-tic2, units='secs')