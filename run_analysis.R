#The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
#A full description is available at the site where the data was obtained:
#http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names.
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


#Merges the training and the test sets to create one data set
datSub<- rbind(datSubTrain, datSubTest)
datAct<- rbind(datActTrain, datActTest)
datFea<- rbind(datFeaTrain, datFeaTest)

#Names variables and Combines Sub and Act data
names(datSub)<-c("subject")
names(datAct)<- c("activity")
datFeaNames <- read.table(file.path(MyPath, "features.txt"),head=FALSE)
names(datFea)<- datFeaNames$V2
datCombine <- cbind(datSub, datAct)
Data <- cbind(datFea, datCombine)

#Extracts only the measurements on the mean and standard deviation for each measurement
#The data frame Data subsetted by seleted names of Features data
subdatFeaNames<-datFeaNames$V2[grep("mean\\(\\)|std\\(\\)", datFeaNames$V2)]
selNames<-c(as.character(subdatFeaNames), "subject", "activity" )
Data<-subset(Data,select=selNames)

#Appropriately labels the data set with descriptive variable names
names<-gsub("^t", "time", names(Data))
names<-gsub("^f", "frequency", names(Data))
names<-gsub("Acc", "Accelerometer", names(Data))
names<-gsub("Gyro", "Gyroscope", names(Data))
names<-gsub("Mag", "Magnitude", names(Data))
names<-gsub("BodyBody", "Body", names(Data))

#creates a second, independent tidy data set with the average of each variable 
#for each activity and each subject
Dat<-aggregate(. ~subject + activity, Data, mean)
Dat<-Dat[order(Dat$subject,Dat$activity),]
write.table(Dat, "tidydata.txt",row.name=FALSE)
head(str(Dat),6)




