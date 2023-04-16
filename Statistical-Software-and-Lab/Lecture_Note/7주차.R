# 예제
## 1) 문자 벡터를 입력받아서 parsing 작업
## 2) parsing된 문자(단어)들 중 관사(a,an,the) 제외
## 3) 각 단어들의 빈도 계산
## 4) 단어 빈도 계산 결과 반환
x = c('a bat, cat', 'x,y/z')
sep = '/'
temp = gsub("[(),.?!/ ]", sep, x); temp
temp = unlist(strsplit(temp,sep))
xrm = c("", "a", "an", "the")
temp = temp[!(temp %in% xrm)] # temp[temp!=""]
table(tolower(temp))

x = c('a bat, cat', 'x,y/z')
sep = '/'
# temp = gsub("[(),.?!/ ]", sep, x)
temp = unlist(strsplit(x,sep))
xrm = c("", "a", "an", "the")
temp = temp[!(temp %in% xrm)] # temp[temp!=""]
table(tolower(temp))

wd_cnt = function(x, sep='[/, ]')
{
  temp = unlist(strsplit(x,sep))
  xrm = c("", "a", "an", "the")
  temp = temp[!(temp %in% xrm)] # temp[temp!=""]
  return(table(tolower(temp)))  
}
y = c('a bat, cat'); wd_cnt(y, sep)

y = c('a bat, cat')
wd_cnt(x=y, sep=',')

# 실습 문제(처음은 그냥 아래 문제 구현, 두번째는 nbox,a,b를 인수로 하는 함수)
## ftn = function(x) return(x^2)
## nbox = 10
## 적분구간을 (a,b) : a=0, b=5
## 밑변의 길이 d : (b-a)/nbox
## 시작위치값 : st=seq(a,b-d,by=d)
## 전체 사각형 넓이는 (ftn(시작위치)*밑변의 길이)의 합

### 1.
ftn = function(x)
{
  return(x^2)
}
nbox = 10
a = 0
b = 5
d = (b-a)/nbox
st = seq(a,b-d,by=d)
area= sum(ftn(st)*d); area # 실제 값이랑 차이가 큼 -> 함수로 구성해 nbox 값 조정

### 2.
area = function(nbox, a, b)
{
  d = (b-a)/nbox
  st = seq(a,b-d,by=d)
  area = sum(ftn(st)*d)
  return(area)
}
area(10,0,5)
area(15,0,5)
area(1000,0,5)

# 피보나치 수열
fibo <- function(n) {
  if(n==0) return(0)
  if(n==1) return(1)
  if(n==2) return(rep(1,2))
  x <- rep(1,n)
  for(i in 3:n)
    x[i] <- x[i-1]+x[i-2]
  return(x)
}
fibo(1); fibo(2)
fibo(30)
fibo(0)

# 피보나치 수열 - recurrent form
fibr = function(n) {
  if(n==0) return(0)
  if(n==1) return(1)
  return(fibr(n-1) + fibr(n-2)) # 재귀 호출(함수 내 자신의 함수를 호출) - 권장 x
}
fibr(1); fibr(2)
fibr(30)

# 지역번수와 전역변수
a <- c(1,3,5)
noact <- function(x){
  loc <- 3
  a[1] = 10
  return(loc)
}
noact(a)
loc # not found
a

noact2 <- function(x){
  a[1] <- 3
  glb <<- c(1,2) # 전역 할당 연산자
  return(a)
}
noact2(10)
a
glb