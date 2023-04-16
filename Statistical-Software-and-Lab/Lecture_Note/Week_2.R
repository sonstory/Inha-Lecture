# 2ì£¼ì°¨ R objects & Basic operations
# ê¸°ë§ê³ ì‚¬ cheating sheet ê°€?Š¥

# ? •?ˆ˜?˜•(integer)
real <- 3.5
as.integer(real) # ? •?ˆ˜ë¡? ë³€ê²?. ?‹¤? œ ë³€?ˆ˜?Š” ë³€?™” x
intg <- 3
is.integer(1:2)
is.integer(intg)
intg2 <- as.integer(3)
is.integer(intg2) 

# ?‹¤?ˆ˜?˜•(double)
real <- 3
is.double(real)

# ë¬¸ìž?˜•(character)
ch <- c("red", "blue","yellow")
ch[1]
ch[3]
ch[-2] # ?‘ ë²ˆì§¸êº? ë¹¼ê³ 
ch[7] # NA(Not Available)

ch2 <- c("a","b","c"); ch2
ch2 = c("ab\"",'a\'') # \ : escape ë¬¸ìž(\" : " ë¬¸ìž ê·¸ë?€ë¡?)
ch2
cat(ch2) # ?‹¤? œ ì¶œë ¥?•´ë´?

# ?…¼ë¦¬í˜•(logical) -> TRUE : 1 / FALSE : 0 
test <- c(TRUE, FALSE, TRUE)
is.logical(test)
test2 <- c(T,F,T)
as.numeric(test2)
as.character(test2)
as.logical(c(-1,2,0,3)) # 0ë§? FALSE?´ê³? ?‚˜ë¨¸ì§„ 1

# ?œ ?˜• ?™•?¸ ë°? ë³€?™˜ ?•¨?ˆ˜
x <- "char"
mode(x) # mode : ?¼ë°˜ì ?¸ ?œ ?˜• ?™•?¸

## is : ?žë£Œì˜ ?œ ?˜•(ë³€?ˆ˜ëª? or ê°?)
x <- 5 
is.character(x) 
is.numeric(x)
is.double(x)

## as : ?œ ?˜• ë³€?™˜ ?•¨?ˆ˜. ?ˆ«?ž -> ë¬¸ìž, ?ˆ«?ž ë°? ë¬¸ìž -> ?ˆ«?ž ê°€?Š¥ / ?‹¤ë¥? ê²½ìš°?Š” NA
x <- "abc"
as.double(x) # ë³€?™˜ ?•ˆ?¨

x <- 1
as.character(x)
as.character(123)
as.character("123.3")
as.integer("123.3")

# ë²¡í„°??€ ê°ì²´?˜ ?´ë¦? ê·œì¹™
## ë²¡í„°(vector) : R?—?„œ ê°€?ž¥ ê¸°ë³¸?´ ?˜?Š” ê°ì²´ë¡? ?ˆ˜?•™?—?„œ ? •?˜?•˜?Š” ë²¡í„°??€ ?™?¼ -> ê°’ê³¼ ?œ„ì¹˜ë?? ê°–ëŠ”?‹¤.
vec <- c(1,3,4,2,5) ; vec
vec[1]
vec[3:5]
vec[7]
vec2 = c(); vec2
vec2[7] = 3
vec2

## ê°ì²´?˜ ?´ë¦? ê·œì¹™
if <- c(1,2,3) # ?Š¹? • ?‚¤?›Œ?“œ?Š” ê°ì²´ ?´ë¦? ë¶ˆê?€
vec[-2:4] # ?˜¤ë¥? ë°œìƒ

# ë²¡í„°?˜ ?ƒ?„±?„ ?œ„?•œ ?•¨?ˆ˜
num <- c(1,2,3) # numeric
ch <- c("red","blue","yellow") ; ch # character
lo <- c(T,F,F,T) ; lo # logical
num2 <- c(1,2,"red","blue") ; num2 # character
lo2 <- c(T,F,T,1,3) ; lo2 # numeric
lo3 <- c(T,F,"abc") ; lo3 # character

# ë³€?ˆ˜?— ê°ì²´ë¥? ?• ?‹¹?•˜?Š” ?•¨?ˆ˜ ë°? ?—°?‚°?ž
assign("x", 1:10) ; x
x1 <- 1:10 ; x1 # local assign
x2 = 5:1 ; x2

paste0(c("X","Y"), 1:5) # paste : ë²¡í„°??€ ë²¡í„°ë¥? ?›?†Œë³„ë¡œ ë¶™ì—¬ì¤?(ê¸¸ì´ê°€ ?‹¤ë¥´ë©´ ì§§ì?€ê±? ë°˜ë³µ)
for(i in 1:100)
  assign(paste0("Z",i), seq(i,i+5,by=1))

# ë²¡í„°?˜ ?—°?‚°
x <- c( 1,2,3) ; y <- c(1,2,3,4)
v <- 2*x + y + 1 ; v
z = c(4,5)
w = 2*z + y ; w

x <- c(1,2,3)
y <- c(1,2,3,4,5) 
x-y

## ?• ?‹¹ ?—°?‚°?ž(<- or =, <<-) -> ?—°?‚°?ž ?š°?„ ?ˆœ?œ„ ?•”ê¸? ?‹œ?—˜ x. ?‹¨?ˆœ ?—°?‚° ë¬¸ì œ ì¶œì œ(?„ˆë¬? ë³µìž¡?•œ ë¬¸ì œ?Š” X)
3 ** 2
3 * 3 %% 2 # ?‚˜ë¨¸ì?€
4 + 3^3 %/% 4 # ëª?

a = 3 ; b <- 2 ; c <- 3+3
a - b - c
a / b - c
a ^ b * c
a ^ (b + c)
a ** (b+c)
a ^ b + c

# And ?—°?‚°?ž
A <- T ; B <- F ; C <- c(T,T,F,T) ; D <- c(F,T,F,F)
A & B
A && B
C & D
C && D

# Or ?—°?‚°?ž : |, || -> ?‘ ê°’ì„ ë¹„êµ?•˜?—¬ ?‘˜ ì¤? ?•˜?‚˜ê°€ ì°¸ì¼ ?•Œ ì°¸ì„ ë°˜í™˜
A | B
A || B
C | D
C || D

# ë¹„êµ ?—°?‚°?ž : <, >, <=, >=, ==, != -> ë¬¸ìž?˜ ê²½ìš° ? •ê·œí‘œ?˜„?‹?œ¼ë¡? ë¹„êµ
a <- c(1,2) ; b <- c(2,2) ; d <- c(3,4)
a < b ; a <= b
a < d ; a <= d

1 < "a"
"1" < "a"
"a" < "A"
TRUE < "A"
"a" < "b"
"aaaaaaaa" < "b"
"?„±?„±?„±?„±?„±?„±" < "?„´?„´?„´?„´?„´?„´" # ë¬¸ìž ë¹„êµ?Š” ?˜?„ë¡? ?•˜ì§€ ë§ìž

A <- c(T,T) ; B <- c(F,T) ; C <- c(T,T) ; D <- c(T,F)
A == B ; C == D
all(A == B) ; any(A == C) # all(?…¼ë¦¬ê°’) : ? „ì²´ê?€ ëª¨ë‘ ?‹¤ë¥¸ì?€ ?™•?¸
A != B ; B != D
all(A != B) ; any(B != D) # any(?…¼ë¦¬ê°’) : ? „ì²? ì¤? ?•˜?‚˜?¼?„ ì°¸ì´ë©? ì°?

T == 1
T > "1"
"T" > "1"

# ?ˆ˜?•™ ê´€? ¨ ?•¨?ˆ˜?“¤
a = 1 ; a = a + 2 ; a
set.seed(123) ; rnorm(5)
sample(1:45, 6)
sample(1:5, 10, replace=T)

log(10) # ?‹¤ë¥? ë°? xë¥? ê°–ëŠ” ê²½ìš° : log(10, base=x)
log10(10) ; log(exp(1))
exp(1) ; exp(2)
sin(30) ; sin(pi/2)

x <- c(1,3,2,5,10) ; max(x) ;  min(x)
x <- c(-5, 10, 2, 5, 8, 9) ; range(x)

x = rnorm(10, 1, 2)
mean(x) ; prod(x) ; sum(x) ; var(x)
sum((x-mean(x))^2) / length(x)

# ? •? ¬ ?•¨?ˆ˜
x <- c(1,5,3,2,4)
sort(x) # x?˜ ?›?†Œ?“¤?„ ?˜¤ë¦„ì°¨?ˆœ or ?‚´ë¦¼ì°¨?ˆœ?œ¼ë¡? ? •? ¬
sort(x, decreasing = T)
order(-x) # ? •? ¬ ?›„?˜ ê°’ì— ??€?•œ ?›?ž˜?˜ ?œ„ì¹?
y <- c("D", "F", "G", "B", "A")
y[order(x)]
y[order(x, decreasing=T)]

# ë³µì†Œ?ˆ˜
complex(real=-17, imaginary=0)
complex(3,1) # length=3, real=1, imaginary=0
complex(3,10,-2) # length=3, real=10, imaginary=-2

sqrt(-17) # NAN
sqrt(-17+0i) # ì¶•ì•½ ?‘œ?˜„
z <- 1+2i ; z ; Re(z) ; Im(z) ; Mod(z)

sqrt(1^2 + 2^2)
Conj(z) ; z*Conj(z)
Arg(x) ; Mod(z)*sin(Arg(z)) ; Mod(z)*cos(Arg(z))
asin(2/sqrt(5)) ; acos(1/sqrt(5))
as.complex(paste0(3, "+", 2, "i")) # ë³µì†Œ?ˆ˜ë¥? ?• ?• ?ˆ«?ž??€ i ?‚¬?´?— ê³µë°±?´ ?žˆ?œ¼ë©? ?•ˆ?¨

# Sequence ?—°?‚°?ž(:)
x = 1:10
is.integer(x)
10:1
3.3:8
3.3:8-1
3.3:(8-1) # ?›?•˜?Š” ?—°?‚°??€ ê´„í˜¸ë¥? ì¹˜ìž

# Repeat() : ê°™ì?€ ?ˆ˜ë¥? ë°˜ë³µ?•˜?—¬ ?ƒ?„±?„±
rep(c(1,2), times=3) 
rep(c(1,2),3)
rep(c(1,2), each=3)

# Sequence() : ?“±ì°? ?ˆ˜?—´?„ ?ƒ?„±
seq(from=1, to=10)
seq(from=-5, by=3, length=10)
seq(length=6, to=10, by=2)

x = seq(-3,3,by=0.01) ; x
y = dnorm(x) ; y
x11()
plot(x,y,type='l') # ?˜?–´ l

z = seq_len(5) ; z # ?¸?±?Š¤ ë²¡í„° ë§Œë“¤ ?•Œ ?‚¬?š©
t = seq_along(x) ; t