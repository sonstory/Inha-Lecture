path = "C:/Users/sjy54/OneDrive - 인하대학교/Son/12. Github/Inha-Lecture/Statistical-Software-and-Lab/Practice/"
setwd(path)

## 1. Ex_data.csv로부터 자료를 읽어서 raw_dat으로 저장하시오.
raw_dat = read.csv(file='./Ex_data.csv', header=T)

## 2. head 함수를 사용하여 입력된 raw_dat를 확인하시오.
head(raw_dat)

## 3. raw_dat의 차원을 구하시오.
dim(raw_dat)

## 4. raw_dat의 첫번째 열에서 유전자의 이름을 추출하고 gene_name.txt로 저장하시오.
write.table(raw_dat[, 1],file="gene_name.txt", quote=F, sep=",")

## 5. raw_dat의 3,9,10열의 성분을 선택하여 새로운 변수에 저장하고 sub_data.txt로 저장하시.오(구분은 tab)
sub_data = raw_dat[,c(3,9,10)]; sub_data
write.table(sub_data, file="sub_data.txt", sep='\t')

## 6. raw_dat의 31~100번째 행과 21~40 사이의 짝수 열을 선택하여 새로운 변수에 저장하고 sub_data2.csv로 저장하시오.(구분 comma)
sub_data2 = raw_dat[31:100, seq(from=22, to=40, by=2)]
write.table(sub_data2, file="sub_data2.csv", row.names=F, col.names=F, sep=',')

## 7. raw_dat에서 결측값의 개수를 세시오.
sum(is.na(raw_dat))

## 8. raw_dat에서 결측값의 위치를 1차원 인덱스로 찾으시오.
which(is.na(raw_dat))

## 9. raw_dat에서 결측값의 위치를 2차원 인덱스로 찾으시오.
which(is.na(raw_dat), T)

## 10. 9번에서 찾은 raw_dat에서 결측값의 위치를 index 변수에 저장하고 이를 활용하여 결측값이 발생한 열의 결측값 제외 평균을
## 계산하여 각 결측값을 대체하시오.(결측값 제외 평균 계산 : mean(x, na.rm=T) 사용)
index = which(is.na(raw_dat), T)
for (i in 1:nrow(index))
  raw_dat[index[i,1], index[i,2]] = mean(raw_dat[, index[i,2]], na.rm=T)
sum(is.na(raw_dat))