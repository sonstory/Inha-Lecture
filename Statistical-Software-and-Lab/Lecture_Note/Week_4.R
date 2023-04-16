# paste() : ?¸?ˆ˜?“¤?„ ?•˜?‚˜?˜ ë¬¸ì?—´ë¡? ë§Œë“œ?Š” ?•¨?ˆ˜
myname <- "Jason Bourne"
paste("My name is", myname, sep=" ")
file_id = 1533
paste("Dataset_", file_id, ".txt", sep="") # paste0??€ ?™?¼

paste("A","B", collapse='/')
paste(c("A","B"), collapse='/')
paste(c("A","B"), 1:2, collapse='/')
paste(c("A","B"), 1:2, sep='?', collapse='/')
paste(c("A","B"), 1:2, sep="", collapse='/')
paste(c("A","B"), c("C","D"), sep='?', collapse='/')

paste0(c("A","B"), 1:2, collapse='/')
paste0(LETTERS[1:5], letters[1:5])

# ë¬¸ì?—´?„ ?‹¤ë£¨ëŠ” ?•¨?ˆ˜?“¤(nchar, substr, strtrim)
test <- c("abcdefg", "AFFY1245820"); test
nchar(test)

f_name <- c("AFFY123", "AFFY1245820"); f_name
substr(f_name, 5, nchar(f_name))

strtrim("ABCDEF", 3)
strtrim(rep("abcdef", 3), c(1,4,10))

# Extended regular expression(?™•?¥ ? •ê·? ?‘œ?˜„?‹) ?´ê±? ?‹œ?—˜ ?‚˜?˜´(1ë²ˆì— ì¶œì œ - ì½”ë“œ ë³´ê³  ê²°ê³¼ ?‘?„±, 2ë¬¸ì œ ì¶œì œ)
## ??€ê´„í˜¸ []ê°€ ?‚˜?˜¤ë©? ë¬´ì¡°ê±? ?•˜?‚˜?˜ ë¬¸ìë¥? ?‚˜??€?ƒ„(??€ê´„í˜¸ ?•ˆ?—?Š” ì¶œë ¥?  ?ˆ˜ ?ˆ?Š” ?›„ë³´ë“¤)
x <- c(as="asfef", qu="qwerty", "yuiop[", "bebc", "stuff.blah.yech"); x
strsplit(x, "e");x
strsplit(x,"[a-f]"); x
strsplit(x, "[aleu][ab]") # lb µî ¾ÕµÚ ¼ø¼­´ë·Î ÀÖ´Â ±âÁØ ºĞÇÒ
strsplit("a.b.c", ".")
strsplit("a.b.c", "[.]")
strsplit("a.b.c", ".", fixed=TRUE)

y = c("ab/cd/ef~z!yk?c", "a/x!b,y,z.t/s"); y
strsplit(y, "[/~!?]")
unlist(strsplit(y, "[[:punct:]]"))

# ?‘?—… ?´?” ê´€? ¨ ?•¨?ˆ˜
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
grep("0[2-9][0-9]?-[1-9][0-9]{2,3}-[0-9]{4}", x, value=T) # ?°?´?„°ë¥? ì£¼ê³  regular expression ? ?š© ê²°ê³¼ ?“°ê¸?

setwd('C:/Users/sjy54/OneDrive - ?¸?•˜??€?•™êµ?/Son/05. INHA/4-1/?†µê³„ì†Œ?”„?Š¸?›¨?–´ ë°? ?‹¤?Šµ/ê°•ì˜ ê¸°ë¡')
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
gsub("[ed]", "", x); x # blue?˜ e?„ ì§€?›Œì§€?Š”ê±? ?™•?¸
test = dir('C:/Users/sjy54/OneDrive - ?¸?•˜??€?•™êµ?/Son/05. INHA/4-1/?†µê³„ì†Œ?”„?Š¸?›¨?–´ ë°? ?‹¤?Šµ/ê°•ì˜ ê¸°ë¡')
gsub("[.]", "/", test)
gsub("[.]exe",".pdf",test)
txt = c("std id", "class id")
gsub(" ","_",txt)