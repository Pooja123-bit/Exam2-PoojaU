install.packages(nutshell)
library(nutshell)
library(stringr)

##Section1 (1-5)
load(file="test2_data_rev.Rdata")
A=t2$date_chr

date=A
mm=str_sub(string=date, start=1, end=2)
mm
dd=str_sub(string=date, start=4, end=5)
dd
yy=str_sub(string=date, start=7, end=10)
yy

fulldate=str_c(yy,mm,dd, sep=" /")
fulldate=as.character(fulldate)
fulldate

t2$date<-as.POSIXct(strptime(x=t2$date, format="%m/%d/%y", tz="America/New_York"))
#East Coast-New York

##section 2
library(data.table)
library(tidyverse)
library(readxl)

6.
load(file="aurelia_15minCell_statareas.Rdata")

7.
read_excel("Aurelia_SEAMAP_2012-2018_30minCell.xlsx")

8.
##fread(data.table)
library(data.table)
F1= fread(input="aurelia_15minCell_statareas.txt", sep=",", header= T, stringsAsFactors=F)

##read.csv
F2=read.csv(file="aurelia_15minCell_statareas.txt", header=T, sep=",", stringsAsFactors=F)

##read.table
F3=read.table (file="aurelia_15minCell_statareas.txt", sep=",", header=T, stringsAsFactors = F)

##read_csv
F4=read_csv(file="aurelia_15minCell_statareas.txt") 

9.
A=F4[F4$year=="2012",]
A

subset1=subset(F4, year=="2012")
subset1
save(subset1, file="newaurelia_data.Rdata")


##Section 3
10.
load(file="test2_deep.Rdata")
load(file="test2_mid.Rdata")
load(file="test2_shallow.Rdata")
S.df=as.data.frame(shallow)
D.df=as.data.frame(deep)
M.df=as.data.frame(mid)

##put all three df's back together
Combined=rbind(S.df,D.df,M.df)
Combined

11.
load(file="t2-1.Rdata")
load(file="t2-2.Rdata")

T2.1.df=as.data.frame(t2)
T2.2.df=as.data.frame(t2.1)
##join
Join1=full_join(T2.1.df, T2.2.df, by = "parcel.id")
Join1

12.
##merge
Merge1=merge(T2.1.df, T2.2.df,by="parcel.id")
Merge1


##Section 4

13.
Test= data("batting.2008")

14.
Test=batting.2008
HR=tapply(X=Test$HR, INDEX= list(Test$teamID), FUN = sum)
HR

15.
stats.team=aggregate(x=Test [,c("AB", "H","BB","2B","HR")], by=list(Test$teamID),FUN=sum)
stats.team

16.
sum.team = Test %>%  group_by(teamID) %>% summarize (HRsum = sum(HR), HRmean=mean(HR),HRsd=sd(HR))
sum.team


##bonus
17.

fs<- fish[,c("transect.id","area_fac","depth_fac","parcel.id", "parcel.density.m3","parcel.length.m")]

library(reshape2)

fs.m<-melt(data=fs,id.vars=c("transect","pid","area","depth"), measure.vars=c("pl","pd"),value.name=c("numbers"))

fs.cast<-dcast(data=fs.melt,formula=transect~variable, value.var=c("numbers"),fun.aggregate=mean)
