List<-read.csv("./data/titanic_full.csv")
List$name<-NULL
List<-na.omit(List)
List$survived<-ifelse(List$survived,List$survived<-"yes",List$survived<-"no")
List$survived<-factor(List$survived)
List$pclass<-factor(List$pclass)
List$sibsp<-factor(List$sibsp)
List$parch<-factor(List$parch)
List$embarked<-factor(List$embarked)
List$sex<-factor(List$sex)
install.packages("caret")

install.packages("rpart")
install.packages("rpart.plot")
install.packages("tree")
install.packages('C50')
library(C50)
library(caret)
library(rpart)
library(rpart.plot)
library(tree)

set.seed(1000)
intrain<-createDataPartition(y=List$survived, p=0.7, list=FALSE) 
train<-List[intrain, ]
test<-List[-intrain, ]
treemod<-tree(survived~. , data=train)
plot(treemod)
text(treemod)
cv.trees<-cv.tree(treemod, FUN=prune.misclass ) 
plot(cv.trees)

prune.trees <- prune.misclass(treemod, best=5,6)
plot(prune.trees)
text(prune.trees, pretty=0)



