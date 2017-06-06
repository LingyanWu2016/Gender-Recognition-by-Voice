# Loading the packages
#install.packages("e1071",	dependencies=T)
#install.packages("randomForest",	dependencies=T)
library(randomForest)
library(e1071)

# Reading the data
data <- read.csv(file="voice_data.csv",header=TRUE,sep=",")
summary(data)
index	<- 1:nrow(data)
testindex	<- sample(index,	trunc(length(index)/4))
testset	<- data[testindex,]
trainset	<- data[-testindex,]

# Finding significance of the features on Label

significance <- glm(label ~ ., data=trainset, family='binomial')
significance

# Naive Bayes Classifier
cat("Naive Bayes Classifier:")
nb.model <- naiveBayes(label ~	., data = trainset)
nb.train_pred <- predict(nb.model, trainset)
nb.pred <- predict(nb.model, testset)
# Testing Accuracy - confusion matrix
cat("Confusion Matrix over the testing data:")
table(pred=nb.pred,true=testset[,21])
# Training Accuracy - confusion matrix
cat("Confusion Matrix over the training data:")
table(pred=nb.train_pred,true=trainset[,21])

# SVM Classifier
cat("SVM Classifier:")
svm.model	<- svm(label ~	., data = trainset, cost=100, gamma=1)
svm.train_pred <- predict(svm.model,	trainset)
svm.pred <- predict(svm.model,	testset)
# Testing Accuracy - confusion matrix
cat("Confusion Matrix over the testing data:")
table(pred=svm.pred,true=testset[,21])
# Training Accuracy - confusion matrix
cat("Confusion Matrix over the training data:")
table(pred=svm.train_pred,true=trainset[,21])


# Random Forest
cat("Random Forest Classifier:")
rf.model <- randomForest(label ~ ., data=trainset)
# Training Accuracy - confusion matrix
cat("Confusion Matrix over the training data:")
rf.train_pred <- predict(rf.model, trainset)
table(pred=rf.train_pred,true=trainset[,21])
# Testing Accuracy - confusion matrix
cat("Confusion Matrix over the testing data:")
rf.pred <- predict(rf.model, testset)
table(pred=rf.pred,true=testset[,21])

# Stacking models in the ensemble
cat("Stacking models in the ensemble:")
ensemble_test_data <- data.frame(nb.pred, svm.pred, rf.pred, y=testset[,21])
ensemble.model <- randomForest(y ~ ., data=ensemble_test_data)
ensemble.pred <- predict(ensemble.model, data=ensemble_test_data)
table(ensemble.pred, testset[,21])

ensemble_train_data <- data.frame(nb.train_pred, svm.train_pred, rf.train_pred, y=trainset[,21])
train_ensemble.model <- randomForest(y ~ ., data=ensemble_train_data)
train_ensemble.pred <- predict(train_ensemble.model, data=ensemble_train_data)
table(train_ensemble.pred, trainset[,21])
