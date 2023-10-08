List<-read.csv("./data/titanic_full.csv")
List$name<-NULL
List<-na.omit(List)
List$age<-ifelse(List$age>18,List$age<-"adult",List$age<-"child")
classfare<-List[c("pclass","fare")]
cor(classfare$pclass,classfare$fare)
lm(pclass~fare,data=classfare)
cld <-lm(pclass~fare,data=classfare)
plot(pclass~fare,data=List,pch=20,col='red')
abline(cld)  
anova(cld)   
   