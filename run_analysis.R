##Getting and Cleaning Data Course Project
# Create Tables
ActivityTest  <- read.table(file.path( "y_test.txt" ),header = FALSE)
ActivityTrain <- read.table(file.path( "y_train.txt"),header = FALSE)
SubjectTest  <- read.table(file.path( "Subject_test.txt" ),header = FALSE)
SubjectTrain <- read.table(file.path( "Subject_train.txt"),header = FALSE)
FeatureTest  <- read.table(file.path( "X_test.txt" ),header = FALSE)
FeatureTrain <- read.table(file.path( "X_train.txt"),header = FALSE)
FeatureNames <- read.table(file.path( "features.txt"),header = FALSE)
## 1. Merges the training and the test sets to create one data set.
AllActivities <- rbind(ActivityTrain, ActivityTest)
AllSubjects <- rbind(SubjectTrain, SubjectTest)
AllFeatures <- rbind(FeatureTrain, FeatureTest)
# Add the variable names to the merged tables
names(AllSubjects)<-c("subject")
names(AllActivities)<- c("activity")
names(AllFeatures)<- FeatureNames$V2
# Merge all into AllData
AllCombined <- cbind(AllSubjects, AllActivities)
AllData <- cbind(AllFeatures, AllCombined)
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
RequiredFeaturesNames<-FeatureNames$V2[grep("mean\\(\\)|std\\(\\)", FeatureNames$V2)]
selectedNames<-c(as.character(RequiredFeaturesNames), "subject", "activity" )
AllData<-subset(AllData,select=selectedNames)
## 3. Uses descriptive activity names to name the activities in the data set
ActivityLabels <- read.table(file.path( "activity_labels.txt"),header = FALSE)
for (i in 1:length(ActivityLabels$V2)){
  AllData$activity <- replace(as.character(AllData$activity), AllData$activity == i,paste(ActivityLabels$V2[i] ))
}
## 4. Appropriately labels the data set with descriptive variable names.
names(AllData)<-gsub("^t", "time", names(AllData))
names(AllData)<-gsub("^f", "frequency", names(AllData))
names(AllData)<-gsub("Acc", "Accelerometer", names(AllData))
names(AllData)<-gsub("Gyro", "Gyroscope", names(AllData))
names(AllData)<-gsub("Mag", "Magnitude", names(AllData))
names(AllData)<-gsub("BodyBody", "Body", names(AllData))
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(plyr)
TidyData<-aggregate(. ~activity + subject, AllData, mean)
TidyData<-TidyData[order(TidyData$activity,TidyData$subject),]
## Write tidy data to file
write.table(TidyData, file = "tidy_data.txt",row.name=FALSE)
