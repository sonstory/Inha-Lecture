# 2주차 R objects & Basic operations
# 기말고사 cheating sheet 가능

# 정수형(integer) : R에서는 실수형 자료가 기본. 입력 시 정수형으로 정의 또는 아래의 함수를 정의하여 변환
real <- 3.5
as.integer(real) # 정수로 변경. 실제 변수는 변화 x
intg <- 3
is.integer(1:2)
is.integer(intg) # 해당 자료형인지 확인 -> True/False 출력
intg2 <- as.integer(3)
is.integer(intg2) 

# 실수형(double) : 정수형, 실수형을 합쳐서 numeric
real <- 3
is.double(real)

# 문자형(character) : R에서는 따옴표로 문자임을 나타냄 -> 따옴표는 홑따옴표와 겹다옴표 두가지 사용 가능(혼용 안됨)
ch <- c("red", "blue","yellow")
ch[1]
ch[3]
ch[-2] # 두 번째꺼 빼고
ch[7] # NA(Not Available)
ch2 <- c("a","b","c")
ch2 = c("ab\"",'a\'') # \ : escape 문자(\" : " 문자 그대로)
ch2
cat(ch2) # 실제 출력해봄

# 논리형(logical) -> TRUE : 1 / FALSE : 0 
test <- c(TRUE, FALSE, TRUE)
is.logical(test)
test2 <- c(T,F,T)
as.numeric(test2)
as.character(test2)
as.logical(c(-1,2,0,3)) # 0만 FALSE이고 나머진 1

# 유형 확인 및 변환 함수
x <- "char"
mode(x) # mode : 일반적인 유형 확인

## is : 자료의 유형(변수명 or 값)
x <- 5 
is.character(x) 
is.numeric(x)
is.double(x)

## as : 유형 변환 함수. 숫자->문자, 숫자 및 문자 -> 숫자 가능 / 다른 경우는 NA
x <- "abc"
as.double(x) # 변환 안됨

x <- 1
as.character(x)
as.character(123)
as.character("123.3")

# 벡터와 객체의 이름 규칙
## 벡터(vector) : R에서 가장 기본이 되는 객체로 수학에서 정의하는 벡터와 동일 -> 값과 위치를 갖는다.
vec <- c(1,3,4,2,5) ; vec
vec[1]
vec[3:5]
vec[7]
vec2 = c()
vec2[7] = 3
vec2

## 객체의 이름 규칙
### 영문자와 숫자,.,_의 조합으로 이름 붙일 수 있다.
### 이름의 첫글자로 "_" 및 숫자가 올 수 없다.
### 특정 키워드는 객체의 이름으로 사용할 수 없다.
if <- c(1,2,3) # 특정 키워드는 객체 이름 불가
vec[-2:4] # 오류 발생

# 벡터의 생성을 위한 함수
## c(arguments) : 콤마(,)로 값을 구분하여 생성 가능 -> 별표 2개!
### 하나의 벡터에는 같은 형태의 값을 가져야 한다.(자동변환) -> 자동 변환이 중요
num <- c(1,2,3) # numeric
ch <- c("red","blue","yellow") ; ch # character
lo <- c(T,F,F,T) ; lo # logical
num2 <- c(1,2,"red","blue") ; num2 # character
lo2 <- c(T,F,T,1,3) ; lo2 # numeric
lo3 <- c(T,F,"abc") ; lo3 # character

# 변수에 객체를 할당하는 함수 및 연산자
## 사용자 정의 변수에 객체를 할당하는 함수 및 연산자
## assign() : 변수들 이름을 패턴화하여 여러 개의 변수를 만들 때 사용. 하지만 번거롭기 때문에 자주 사용 x
assign("x", 1:10) ; x
x1 <- 1:10 ; x1 # local assign
x2 = 5:1 ; x2

paste0(c("X","Y"), 1:5) # paste : 벡터와 벡터를 원소별로 붙여줌(길이가 다르면 짧은거 반복)
rm(list=ls())
for(i in 1:100)
  assign(paste0("Z",i), seq(i,i+5,by=1))
ls() # 우리가 생각하는 순서랑은 다름

# 벡터의 연산
## 사칙연산 및 거듭제곱 : +,-,*,/,^
## 길이가 다른 벡터의 연산 : 길이가 짧은 벡터의 원소가 순서대로 반복하여 길이를 맞추어 연산
x <- c( 1,2,3) ; y <- c(1,2,3,4) # 길이가 다르다는 경고 메시지 출력
v <- 2*x + y + 1 ; v
z = c(4,5)
w = 2*z + y ; w

## 할당 연산자(<- or =, <<-) -> 연산자 우선순위 암기 시험 x. 단순 연산 문제 출제(너무 복잡한 문제는 X)
3 ** 2
3 * 3 %% 2 # 나머지
4 + 3^3 %/% 4 # 몫
a = 3 ; b <- 2 ; c <- 3+3
a - b - c
a / b - c
a ^ b * c
a ^ (b + c)
a ** (b+c)
a ^ b + c

# And 연산자 : &, && -> 두 값을 비교하여 둘 다 참일 때만 참을 반환
A <- T ; B <- F ; C <- c(T,T) ; D <- c(F,T)
A & B # & : 모든 원소를 각 원소 별로 and로 참, 거짓을 비교
A && B # && : 각 벡터의 첫 번째 원소만 and로 비교하여 결과 반환(길이가 1보다 큰 경우 Warning 출력)
C & D
C && D # warning

# Or 연산자 : |, || -> 두 값을 비교하여 둘 중 하나가 참일 때 참을 반환
A | B # | : 모든 원소를 각 원소별로 or로 참, 거짓을 비교
A || B # || : 각 벡터의 첫 번째 원소만 or로 비교하여 결과 반환
C | D
C || D # warning

# 비교 연산자 : <, >, <=, >=, ==, != -> 문자의 경우 정규표현식으로 비교
a <- c(1,2) ; b <- c(2,2) ; d <- c(3,4)
a < b ; a <= b
a < d ; a <= d
1 < "a"
"1" < "a"
"a" < "A"
TRUE < "A"
"a" < "b"
"aaaaaaaa" < "b"
"ㄱㄱㄱㄱㄱㄱ" < "ㄴㄴㄴㄴㄴㄴ" # 문자 비교는 되도록 하지 말자

A <- c(T,T) ; B <- c(F,T) ; C <- c(T,T) ; D <- c(T,F)
A == B ; C == D
all(A == B) ; any(A == C) # all(논리값) : 전체가 모두 다른지 확인
A != B ; B != D
all(A != B) ; any(B != D) # any(논리값) : 전체 중 하나라도 참이면 참

T == 1
T > "1"
"T" > "1"

# 수학 관련 함수들
a = 1 ; a = a + 2 ; a
set.seed(123) ; rnorm(5)
sample(1:45, 6)
sample(1:5, 10, replace=T)

log(10) # 다른 밑 x를 갖는 경우 : log(10, base=x)
log10(10) ; log(exp(1))
exp(1) ; exp(2)
sin(30) ; sin(pi/2)

x <- c(1,3,2,5,10) ; max(x) ;  min(x)
x <- c(-5, 10, 2, 5, 8, 9) ; range(x)

x = rnorm(10, 1, 2)
mean(x) ; prod(x) ; sum(x) ; var(x)
sum((x-mean(x))^2) / length(x)

# 정렬 함수
x <- c(1,5,3,2,4)
sort(x) # x의 원소들을 오름차순 or 내림차순으로 정렬
sort(x, decreasing = T)
order(x) # 정렬 후의 값에 대한 원래의 위치
y <- c("D", "F", "G", "B", "A")
y[order(x)]
y[order(x, decreasing=T)]

# 복소수
complex(real=-17, imaginary=0)
complex(3,1) # length=3, real=1, imaginary=0
complex(3,10,-2) # length=3, real=10, imaginary=-2

sqrt(-17) # NAN
sqrt(-17+0i) # 축약 표현
z <- 1+2i ; z ; Re(z) ; Im(z) ; Mod(z)

sqrt(1^2 + 2^2)
Conj(z) ; z*Conj(z)
Arg(x) ; Mod(z)*sin(Arg(z)) ; Mod(z)*cos(Arg(z))
asin(2/sqrt(5)) ; acos(1/sqrt(5))
as.complex(paste0(3, "+", 2, "i")) # 복소수를 할땐 숫자와 i 사이에 공백이 있으면 안됨

# Sequence 연산자(:)
x = 1:10
is.integer(x)
10:1
3.3:8
3.3:8-1
3.3:(8-1) # 원하는 연산은 괄호를 치자

# Repeat() : 같은 수를 반복하여 생성성
rep(c(1,2), times=3) 
rep(c(1,2),3)
rep(c(1,2), each=3)

# Sequence() : 등차 수열을 생성
seq(from=1, to=10)
seq(length=10, from=-5, by=3)
seq(length=6, to=10, by=2)

x = seq(-3,3,by=0.01) ; x
y = dnorm(x) ; y
x11()
plot(x,y,type='l') # 영어 l

z = seq_len(5) ; z # 인덱스 벡터 만들 때 사용
t = seq_along(x) ; t

# Practice 2
# 1번
x = c('0', '21', '12', '16') ; x

# 2번
x = as.numeric(x, ascending=T) ; x

# 3번
x = as.logical(x) ; x

# 4번
y <- seq(0,30,10) ; y

# 5번
(x < y) & (x <= y)

# 6번
z <- rep(c(TRUE, FALSE), time=5) ; z