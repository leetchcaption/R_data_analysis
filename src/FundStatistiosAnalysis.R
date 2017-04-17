mystats <- function(x, na.omit=FALSE){
  if(na.omit)
    x <- x[!is.na(x)]
  m <- mean(x)
  n <- length(x)
  s <- sd(x)
  skew <- sum((x-m)^3/s^3)/n
  kurt <- sum((x-m)^4/s^4)/n - 3
  return (c(n=n,mean=m,stdev=s,skew=skew,kurtosi=kurt))
}

vars <- c("mpg","hp","wt")
#summary(mtcars[vars])
#head(mtcars[vars])
sapply(mtcars[vars],mystats)

# ���ܶ�ͼ
par(mtrow <- c(2,1))

d <- density(mtcars$mpg)
plot(d)
plot(d,main = "Kernel Density of Miles Per Gallon")
#����ͼ�����
polygon(d,col = "green",border="red")
# ruq(mtcars$mpg,col="black")

# �ɱȽϵĺ��ܶ�ͼ
par(lwd=3) # ˫����������
library(sm)

# ���ƿ��ԱȽϵ��ܶ�ͼ
sm.density.compare(mtcars$mpg,mtcars$cyl,xlab="Mills Par Gallon")
# ����ͼ�α���
title("MPG Distribution by Car Cylinder")
cyl.f <- factor(mtcars$cyl,levels = c(4,6,8),labels = c("4 cylinder","6 cylinder","8 cylinder"))
colfill <- c(2:(1+length(levels(cyl.f))))
#��ͼ�������һ��ͼ��
legend(locator(1),levels(cyl.f),fill = colfill)

# ����ͼ
boxplot.stats(mtcars$mpg)
boxplot(mpg ~ cyl,
        data = mtcars,
        main="Car Mileage Data",
        xlab="Number of cylinders",
        ylab="Miles Per Gallon")
# notchΪtrue,���Եõ�����
boxplot(mpg ~ cyl,
        data = mtcars,
        notch=TRUE,
        col="blue",
        varwitch=TRUE,
        main="Car Mileage Data",
        xlab="Number of cylinders",
        ylab="Miles Per Gallon")
# �����������ӵ�����ͼ
mtcars$cyl.f <- factor(mtcars$cyl,
                       levels = c(4,6,8),
                       labels = c("4_","6_","8_"))
mtcars$am.f <- factor(mtcars$am,
                      levels = c(0,1),
                      labels = c("auto","standand"))
boxplot(mpg ~ am.f * cyl.f,
        data = mtcars,
        varwidth=TRUE,
        col = c("gold","green"),
        main = "MPG Distribution by Auto Type",
        xlab = "Auto Type")
  
#С����ͼ
library(vioplot)
x1 <- mtcars$mpg[mtcars$cyl == 4]
x2 <- mtcars$mpg[mtcars$cyl == 6]
x3 <- mtcars$mpg[mtcars$cyl == 8]
vioplot(x1,x2,x3,
        names = c("4 cyl","6 cyl","8 cyl"),
        col = "green")
title("Violin Plots of Miles Per Gallon")
#��ͼ
dotchart(mtcars$mpg,labels = row.names(mtcars),cex = .7,
         main = "Gas Mileage for Car models",
         xlab = "Miles per Gallon")

#������ͳ�Ʒ���
vars <- c("mpg","hp","wt")
head(mtcars[vars])
#summary()ͳ�ƺ���
summary(mtcars[vars])
#ͨ��Hmisc�е�describe()��������������ͳ����
library(Hmisc)
describe(mtcars[vars])
#pastecs���е�stat.desc()����������ͳ����
library(pastecs)
stat.desc(mtcars[vars])

#Ƶ������������
library(vcd)
head(Arthritis)
# һά������:Ƶ��ͳ�Ʊ�
mytable <- with(Arthritis,table(Improved))
# ��prop.table()��Ƶ��תΪ����ֵ
density <- prop.table(mytable)*100


library(gmodels)
CrossTable(Arthritis$Treatment,Arthritis$Improved)
# ��ά������
mytable <- xtabs(~ Treatment + Sex + Improved,data = Arthritis)

#
ftable(addmargins(prop.table(mytable,c(2,3)),3))

library(vcd)
mytable <- xtabs(~ Treatment + Improved, data = Arthritis)
# ���������Լ���
chisq.test(mytable)
# Fisher ��ȷ����
fisher.test(mytable)
assocstats(mytable)


#����table2float
table2float <- function(mytable){
  df <- data.frame(mytable)
  rows <- dim(df)[1]
  cols <- dim(df)[2]
  x <- NULL
  for (i in 1:rows){
    for (j in 1:df$Freq[i]){
      row <- 
    }
  }
  
  
}



