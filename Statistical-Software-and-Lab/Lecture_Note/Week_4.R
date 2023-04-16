# paste() : ?��?��?��?�� ?��?��?�� 문자?���? 만드?�� ?��?��
myname <- "Jason Bourne"
paste("My name is", myname, sep=" ")
file_id = 1533
paste("Dataset_", file_id, ".txt", sep="") # paste0??� ?��?��

paste("A","B", collapse='/')
paste(c("A","B"), collapse='/')
paste(c("A","B"), 1:2, collapse='/')
paste(c("A","B"), 1:2, sep='?', collapse='/')
paste(c("A","B"), 1:2, sep="", collapse='/')
paste(c("A","B"), c("C","D"), sep='?', collapse='/')

paste0(c("A","B"), 1:2, collapse='/')
paste0(LETTERS[1:5], letters[1:5])

# 문자?��?�� ?��루는 ?��?��?��(nchar, substr, strtrim)
test <- c("abcdefg", "AFFY1245820"); test
nchar(test)

f_name <- c("AFFY123", "AFFY1245820"); f_name
substr(f_name, 5, nchar(f_name))

strtrim("ABCDEF", 3)
strtrim(rep("abcdef", 3), c(1,4,10))

# Extended regular expression(?��?�� ?���? ?��?��?��) ?���? ?��?�� ?��?��(1번에 출제 - 코드 보고 결과 ?��?��, 2문제 출제)
## ??�괄호 []가 ?��?���? 무조�? ?��?��?�� 문자�? ?��??�?��(??�괄호 ?��?��?�� 출력?�� ?�� ?��?�� ?��보들)
x <- c(as="asfef", qu="qwerty", "yuiop[", "bebc", "stuff.blah.yech"); x
strsplit(x, "e");x
strsplit(x,"[a-f]"); x
strsplit(x, "[aleu][ab]") # lb �� �յ� ������� �ִ� ���� ����
strsplit("a.b.c", ".")
strsplit("a.b.c", "[.]")
strsplit("a.b.c", ".", fixed=TRUE)

y = c("ab/cd/ef~z!yk?c", "a/x!b,y,z.t/s"); y
strsplit(y, "[/~!?]")
unlist(strsplit(y, "[[:punct:]]"))

# ?��?�� ?��?�� 관?�� ?��?��
getwd()
setwd('d:/')
dir()
"C:/Users/sjy54/Documents"
dir("C:/Users/sjy54/Documents")

dir.create('example3')
setwd("example3"); setwd("example3"); getwd()
dir('../')
dir.create('./test')
unlink("test", recursive=T);
dir();


test = dir("C:/Windows"); test
t1 = grep("^[A-Ca-c][a-z]", test); t1
t2 = grep("[.]exe$", test, value=T); t2
t3 = grep("^[BbCc].+exe$", test, value=T); t3

length(colors()); colors()[1:5]
cn = grep("sky", colors(), value=T); cn
x11(); barplot(rep(3, length(cn)), col=cn); cn

x = c("010-3123-2134", "032-860-7642", "02-111-1234", "010-123-5656"); x
grep("010-[0-9]{3,4}-[0-9]{4}", x, value=T)
grep("0[2-9][0-9]?-[1-9][0-9]{2,3}-[0-9]{4}", x, value=T) # ?��?��?���? 주고 regular expression ?��?�� 결과 ?���?

setwd('C:/Users/sjy54/OneDrive - ?��?��??�?���?/Son/05. INHA/4-1/?��계소?��?��?��?�� �? ?��?��/강의 기록')
for(i in 1:20){
  write.table(1:10, file=paste0('data_',i,'.txt'))
}
fname = dir(); fname
fname2 = grep('data_[0-9][.]txt', fname, value=T); fname2
fname3 = paste0(substr(fname2,1,5),"0",
                substr(fname2,6,nchar(fname2))); fname3
file.rename(fname2, fname3)
cbind(fname2, fname3)
?file.rename
dir()

# gsub
x = c("red", "red2", 'blue'); x
gsub("[ed]", "", x); x # blue?�� e?�� 지?��지?���? ?��?��
test = dir('C:/Users/sjy54/OneDrive - ?��?��??�?���?/Son/05. INHA/4-1/?��계소?��?��?��?�� �? ?��?��/강의 기록')
gsub("[.]", "/", test)
gsub("[.]exe",".pdf",test)
txt = c("std id", "class id")
gsub(" ","_",txt)