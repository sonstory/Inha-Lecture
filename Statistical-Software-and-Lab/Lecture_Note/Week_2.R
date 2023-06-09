# 2주차 R objects & Basic operations
# 기말고사 cheating sheet 가?��

# ?��?��?��(integer)
real <- 3.5
as.integer(real) # ?��?���? 변�?. ?��?�� 변?��?�� 변?�� x
intg <- 3
is.integer(1:2)
is.integer(intg)
intg2 <- as.integer(3)
is.integer(intg2) 

# ?��?��?��(double)
real <- 3
is.double(real)

# 문자?��(character)
ch <- c("red", "blue","yellow")
ch[1]
ch[3]
ch[-2] # ?�� 번째�? 빼고
ch[7] # NA(Not Available)

ch2 <- c("a","b","c"); ch2
ch2 = c("ab\"",'a\'') # \ : escape 문자(\" : " 문자 그�?��?)
ch2
cat(ch2) # ?��?�� 출력?���?

# ?��리형(logical) -> TRUE : 1 / FALSE : 0 
test <- c(TRUE, FALSE, TRUE)
is.logical(test)
test2 <- c(T,F,T)
as.numeric(test2)
as.character(test2)
as.logical(c(-1,2,0,3)) # 0�? FALSE?���? ?��머진 1

# ?��?�� ?��?�� �? 변?�� ?��?��
x <- "char"
mode(x) # mode : ?��반적?�� ?��?�� ?��?��

## is : ?��료의 ?��?��(변?���? or �?)
x <- 5 
is.character(x) 
is.numeric(x)
is.double(x)

## as : ?��?�� 변?�� ?��?��. ?��?�� -> 문자, ?��?�� �? 문자 -> ?��?�� 가?�� / ?���? 경우?�� NA
x <- "abc"
as.double(x) # 변?�� ?��?��

x <- 1
as.character(x)
as.character(123)
as.character("123.3")
as.integer("123.3")

# 벡터??� 객체?�� ?���? 규칙
## 벡터(vector) : R?��?�� 가?�� 기본?�� ?��?�� 객체�? ?��?��?��?�� ?��?��?��?�� 벡터??� ?��?�� -> 값과 ?��치�?? 갖는?��.
vec <- c(1,3,4,2,5) ; vec
vec[1]
vec[3:5]
vec[7]
vec2 = c(); vec2
vec2[7] = 3
vec2

## 객체?�� ?���? 규칙
if <- c(1,2,3) # ?��?�� ?��?��?��?�� 객체 ?���? 불�?�
vec[-2:4] # ?���? 발생

# 벡터?�� ?��?��?�� ?��?�� ?��?��
num <- c(1,2,3) # numeric
ch <- c("red","blue","yellow") ; ch # character
lo <- c(T,F,F,T) ; lo # logical
num2 <- c(1,2,"red","blue") ; num2 # character
lo2 <- c(T,F,T,1,3) ; lo2 # numeric
lo3 <- c(T,F,"abc") ; lo3 # character

# 변?��?�� 객체�? ?��?��?��?�� ?��?�� �? ?��?��?��
assign("x", 1:10) ; x
x1 <- 1:10 ; x1 # local assign
x2 = 5:1 ; x2

paste0(c("X","Y"), 1:5) # paste : 벡터??� 벡터�? ?��?��별로 붙여�?(길이가 ?��르면 짧�?��? 반복)
for(i in 1:100)
  assign(paste0("Z",i), seq(i,i+5,by=1))

# 벡터?�� ?��?��
x <- c( 1,2,3) ; y <- c(1,2,3,4)
v <- 2*x + y + 1 ; v
z = c(4,5)
w = 2*z + y ; w

x <- c(1,2,3)
y <- c(1,2,3,4,5) 
x-y

## ?��?�� ?��?��?��(<- or =, <<-) -> ?��?��?�� ?��?��?��?�� ?���? ?��?�� x. ?��?�� ?��?�� 문제 출제(?���? 복잡?�� 문제?�� X)
3 ** 2
3 * 3 %% 2 # ?��머�?�
4 + 3^3 %/% 4 # �?

a = 3 ; b <- 2 ; c <- 3+3
a - b - c
a / b - c
a ^ b * c
a ^ (b + c)
a ** (b+c)
a ^ b + c

# And ?��?��?��
A <- T ; B <- F ; C <- c(T,T,F,T) ; D <- c(F,T,F,F)
A & B
A && B
C & D
C && D

# Or ?��?��?�� : |, || -> ?�� 값을 비교?��?�� ?�� �? ?��?��가 참일 ?�� 참을 반환
A | B
A || B
C | D
C || D

# 비교 ?��?��?�� : <, >, <=, >=, ==, != -> 문자?�� 경우 ?��규표?��?��?���? 비교
a <- c(1,2) ; b <- c(2,2) ; d <- c(3,4)
a < b ; a <= b
a < d ; a <= d

1 < "a"
"1" < "a"
"a" < "A"
TRUE < "A"
"a" < "b"
"aaaaaaaa" < "b"
"?��?��?��?��?��?��" < "?��?��?��?��?��?��" # 문자 비교?�� ?��?���? ?��지 말자

A <- c(T,T) ; B <- c(F,T) ; C <- c(T,T) ; D <- c(T,F)
A == B ; C == D
all(A == B) ; any(A == C) # all(?��리값) : ?��체�?� 모두 ?��른�?� ?��?��
A != B ; B != D
all(A != B) ; any(B != D) # any(?��리값) : ?���? �? ?��?��?��?�� 참이�? �?

T == 1
T > "1"
"T" > "1"

# ?��?�� 관?�� ?��?��?��
a = 1 ; a = a + 2 ; a
set.seed(123) ; rnorm(5)
sample(1:45, 6)
sample(1:5, 10, replace=T)

log(10) # ?���? �? x�? 갖는 경우 : log(10, base=x)
log10(10) ; log(exp(1))
exp(1) ; exp(2)
sin(30) ; sin(pi/2)

x <- c(1,3,2,5,10) ; max(x) ;  min(x)
x <- c(-5, 10, 2, 5, 8, 9) ; range(x)

x = rnorm(10, 1, 2)
mean(x) ; prod(x) ; sum(x) ; var(x)
sum((x-mean(x))^2) / length(x)

# ?��?�� ?��?��
x <- c(1,5,3,2,4)
sort(x) # x?�� ?��?��?��?�� ?��름차?�� or ?��림차?��?���? ?��?��
sort(x, decreasing = T)
order(-x) # ?��?�� ?��?�� 값에 ??�?�� ?��?��?�� ?���?
y <- c("D", "F", "G", "B", "A")
y[order(x)]
y[order(x, decreasing=T)]

# 복소?��
complex(real=-17, imaginary=0)
complex(3,1) # length=3, real=1, imaginary=0
complex(3,10,-2) # length=3, real=10, imaginary=-2

sqrt(-17) # NAN
sqrt(-17+0i) # 축약 ?��?��
z <- 1+2i ; z ; Re(z) ; Im(z) ; Mod(z)

sqrt(1^2 + 2^2)
Conj(z) ; z*Conj(z)
Arg(x) ; Mod(z)*sin(Arg(z)) ; Mod(z)*cos(Arg(z))
asin(2/sqrt(5)) ; acos(1/sqrt(5))
as.complex(paste0(3, "+", 2, "i")) # 복소?���? ?��?�� ?��?��??� i ?��?��?�� 공백?�� ?��?���? ?��?��

# Sequence ?��?��?��(:)
x = 1:10
is.integer(x)
10:1
3.3:8
3.3:8-1
3.3:(8-1) # ?��?��?�� ?��?��??� 괄호�? 치자

# Repeat() : 같�?� ?���? 반복?��?�� ?��?��?��
rep(c(1,2), times=3) 
rep(c(1,2),3)
rep(c(1,2), each=3)

# Sequence() : ?���? ?��?��?�� ?��?��
seq(from=1, to=10)
seq(from=-5, by=3, length=10)
seq(length=6, to=10, by=2)

x = seq(-3,3,by=0.01) ; x
y = dnorm(x) ; y
x11()
plot(x,y,type='l') # ?��?�� l

z = seq_len(5) ; z # ?��?��?�� 벡터 만들 ?�� ?��?��
t = seq_along(x) ; t