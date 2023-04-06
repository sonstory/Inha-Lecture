# 벡터(Vector)
c(); logical(); numeric(); character()
vec <- vector(); vec # logical()
vec2 = numeric(); vec2
vec2[1:3] = letters[1:3] # 문자형 벡터

vec3 = logical(); vec3[1] = T; vec3
vec3[2] = 1; vec3 # 하나의 타입으로 자동 변환하여 numeric
is.logical(vec3); is.numeric(vec3); vec3

vec4 = character(); vec4[1] = 1; vec4
vec5 = c(); vec5[10] = "a"; vec5

x = c(); x = c(x,2); x
x = c(x, c(3,4)); x

vec2 = letters[1:3]; vec2
names(vec2)
names(vec2) <- c("first", "second", "third"); vec2
vec2[1]; vec2; vec2["first"]
names(vec2)[2] = '2nd'; vec2

vec3 = c(3,5,2); names(vec3) = c(2,4,1); vec3
vec3[2]
vec3["2"] # names로 지정한 이름은 항상 문자
is.null(NULL); is.null(1); letters; LETTERS

# matrix
x1 <- matrix(1:10, nrow=5, ncol=2, byrow = T); x1
x2 <- matrix(1:10, 5, 2, byrow = F); x2
cbind(x1, x2) # 행을 기준으로 열을 덧붙임

x2[1,2]; x2[2:4, 2]
x2[1,]; x2[,2]
x2[-1,]; x2[,-1]

cbind(x1, x2[1,]) # warning
cbind(x1, matrix(x2[1,], 1, 2)) # error

rbind(x1, x2) # 열을 기준으로 행을 덧붙임
as.numeric(x1)

# matrix의 행과 열의 이름 부여
A <- matrix(1:12, 4, 3); A
rownames(A) <- c("n1", "n2", "n3", "n4")
colnames(A) <- c("x1", "x2", "x3"); A
paste0("x", 1:3) # paste0는 공백 없이 붙임

rname <- c("n1", "n2", "n3", "n4")
cname <- c("x1", "x2", "x3")
B <- matrix(1:12,4,3, dimnames=list(rname, cname)); B

# 행렬의 원소 선택 및 연산
A <- matrix(1:12,4,3, byrow=T); B <- matrix(1,4,3)
A[7]; A[11]
A + B; A - B
t(A)

A <- matrix(1:6,2,3); B <- matrix(1,3,2)
A + B
A - B
B%*%A
A%*%t(B)

A <- matrix(c(1,1,1,4),2,2); A
solve(A) # 역행렬
solve(A)%*%A

A <- matrix(c(1,1,1,4),2,2)
sum(diag(A))
det(A)
diag(A)
diag(3); diag(c(1,3,5))

x <- c(1,2,3)
y <- c(1,2,3)
sum(x*y)
x %o% y # x%o%y <=> x y^T
diag(A) = c(1,2); A
diag(A) = 1; A

# 리스트(list)
a = c(1,3); a
b = letters[1:10]; b
c = matrix("A",3,4); c
x = list(a,b,c); x
x$y1; x$y2
names(x)
x[[1]]
x[1]

x = list(y1=a, y2=b, y3=c); x
x$y1; x$y2
names(x)
x[[1]]

list1 = list(a=1:10, b=matrix(1:4,2,2)); list1
list2 <- list(); list2
list2[[1]] <- matrix(1:10,5,2); list2
list2[[2]] <- list1; list2
list1[[2]][1,2] = 10; list1
unlist(list1)
list1$a
list1$b
list1['a']
list1[['a']]
list1[1]
list1[[1]]; list2[[1]]

# 데이터프레임(dataframe)
x1 = 1:4
x2 <- c("Kim", "Lee", "Jung", "Park")
dat = data.frame(x1,x2); dat
dat2 = data.frame(num=x1, name=x2); dat2
dat[, c("x1","x2")]
dat2$num
dat2$name
dat2[1,2]
dat2[,2]

x1 = 1:4; x2 <- c("Kim", "Lee", "Jung", "Park")
dat = data.frame(x1, x2, stringsAsFactors=T); dat
dat[,1]
dat[,2]
dat[1,]
dat[2,]
dat[1]
dat[2]
dat[[1]]
dat[[2]]

# 요인(factor)
grade = c("A", "A", "B", "C", "B", "B"); grade
f_grade = factor(grade); f_grade
as.numeric(grade)
as.numeric(f_grade)
f2_grade <- factor(grade, order=T); f2_grade
lev <- c("C", "B", "A")
f3_grade <- factor(grade, levels=lev, order=T); f3_grade
levels(f2_grade)
levels(f3_grade)

grade <- c(4.23, 2.5, 7.2, "A", 3.23, 2.2)
as.numeric(grade)
f_grade = factor(grade); f_grade
as.numeric(f_grade)

# array
x1 = array(1:24, dim=c(4,3,2)); x1
x2 = array(1:24, dim=c(2,2,4,2)); x2

# 객체 사이의 변환
x <- 1:100; sum1 <- sum(x[13:100]); sum1
x <- c(1:5, 10:20, 30:45, 2:5, 11:30); x
x>12
sum2 <- sum(x[x>12]); sum2
sum3 <- sum(x[x>10 & x<20]); sum3

y = rnorm(1e7); y # 1* 10^7
s1 = 0
for(i in 1:1e7)
  if(y[i]>0.2)
    s1 = s1+y[i]
s1
sum(y[y>0.2])

# apply
x_mat <- matrix(rnorm(100),20,5); x_mat
apply(x_mat,2,mean)
apply(x_mat,2,var)
apply(x_mat,1,var)
apply(x_mat,2,quantile,c(0.5,0.7))

x_q = quantile(x_mat[,1], c(0.5,0.7)); x_q
for(i in 2:ncol(x_mat)){
  x_q = cbind(x_q, quantile(x_mat[,i],c(0.5,0.7)))
}
x_q

x_mat[1,2] = NA; apply(x_mat,2,mean)
mean(c(1,2,NA,3))
mean(c(1,2,NA,3,na.rm=T))
apply(x_mat, 2,mean,na.rm=T)

# Practice 3
## 1.

## 2.
y <- 