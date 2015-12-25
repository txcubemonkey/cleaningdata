#"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

library(dplyr)
library(data.table)
#Read the activity file
ActivityFile <- "c:/rdata/cleandata/clean_project/UCI HAR Dataset/activity_labels.txt"
# Load the activities into a data frame 
ActivityDF <- read.fwf(ActivityFile,c(2,19), header = FALSE, sep = "\t", col.names=c("ActivityID","ActivityDesc"))

#read the Set Lables
SetFile <- "c:/rdata/cleandata/clean_project/UCI HAR Dataset/features.txt"
# Load the training labels into a data frame 
SetFileDF <- read.table(SetFile,col.names=c("MearsureID","MeasureDesc"),stringsAsFactors=FALSE)

####################################################
##
##  Load up the training data:  TrainDT will return
##
####################################################
source('./load_training_sets.R')


####################################################
##
##  Load up the test data:  TrainDT will return
##
####################################################
source('./load_test_sets.R')


FullDT <- rbind(TestDT,TrainDT)

#Put the activity labels on the data set
FullDT <- merge(FullDT,ActivityDF,by.x="ActivityID",by.y="ActivityID",all=TRUE)

#Get the means of the columns
FullDT2 <- FullDT[,.(tBodyAcc.mean...X.Mean = mean(tBodyAcc.mean...X),
             tBodyAcc.mean...Y.Mean = mean(tBodyAcc.mean...Y),
             tBodyAcc.mean...Z.Mean = mean(tBodyAcc.mean...Z),
             tBodyAcc.std...X.Mean = mean(tBodyAcc.std...X),
             tBodyAcc.std...Y.Mean = mean(tBodyAcc.std...Y),
             tBodyAcc.std...Z.Mean = mean(tBodyAcc.std...Z),
             tGravityAcc.mean...X.Mean = mean(tGravityAcc.mean...X),
             tGravityAcc.mean...Y.Mean = mean(tGravityAcc.mean...Y),
             tGravityAcc.mean...Z.Mean = mean(tGravityAcc.mean...Z),
             tGravityAcc.std...X.Mean = mean(tGravityAcc.std...X),
             tGravityAcc.std...Y.Mean = mean(tGravityAcc.std...Y),
             tGravityAcc.std...Z.Mean = mean(tGravityAcc.std...Z),
             tBodyAccJerk.mean...X.Mean = mean(tBodyAccJerk.mean...X),
             tBodyAccJerk.mean...Y.Mean = mean(tBodyAccJerk.mean...Y),
             tBodyAccJerk.mean...Z.Mean = mean(tBodyAccJerk.mean...Z),
             tBodyAccJerk.std...X.Mean = mean(tBodyAccJerk.std...X),
             tBodyAccJerk.std...Y.Mean = mean(tBodyAccJerk.std...Y),
             tBodyAccJerk.std...Z.Mean = mean(tBodyAccJerk.std...Z),
             tBodyGyro.mean...X.Mean = mean(tBodyGyro.mean...X),
             tBodyGyro.mean...Y.Mean = mean(tBodyGyro.mean...Y),
             tBodyGyro.mean...Z.Mean = mean(tBodyGyro.mean...Z),
             tBodyGyro.std...X.Mean = mean(tBodyGyro.std...X),
             tBodyGyro.std...Y.Mean = mean(tBodyGyro.std...Y),
             tBodyGyro.std...Z.Mean = mean(tBodyGyro.std...Z),
             tBodyGyroJerk.mean...X.Mean = mean(tBodyGyroJerk.mean...X),
             tBodyGyroJerk.mean...Y.Mean = mean(tBodyGyroJerk.mean...Y),
             tBodyGyroJerk.mean...Z.Mean = mean(tBodyGyroJerk.mean...Z),
             tBodyGyroJerk.std...X.Mean = mean(tBodyGyroJerk.std...X),
             tBodyGyroJerk.std...Y.Mean = mean(tBodyGyroJerk.std...Y),
             tBodyGyroJerk.std...Z.Mean = mean(tBodyGyroJerk.std...Z),
             tBodyAccMag.mean.Mean = mean(tBodyAccMag.mean..),
             tBodyAccMag.std.Mean = mean(tBodyAccMag.std..),
             tGravityAccMag.mean.Mean = mean(tGravityAccMag.mean..),
             tGravityAccMag.std.Mean = mean(tGravityAccMag.std..),
             tBodyAccJerkMag.mean.Mean = mean(tBodyAccJerkMag.mean..),
             tBodyAccJerkMag.std.Mean = mean(tBodyAccJerkMag.std..),
             tBodyGyroMag.mean.Mean = mean(tBodyGyroMag.mean..),
             tBodyGyroMag.std.Mean = mean(tBodyGyroMag.std..),
             tBodyGyroJerkMag.mean.Mean = mean(tBodyGyroJerkMag.mean..),
             tBodyGyroJerkMag.std.Mean = mean(tBodyGyroJerkMag.std..),
             fBodyAcc.mean...X.Mean = mean(fBodyAcc.mean...X),
             fBodyAcc.mean...Y.Mean = mean(fBodyAcc.mean...Y),
             fBodyAcc.mean...Z.Mean = mean(fBodyAcc.mean...Z),
             fBodyAcc.std...X.Mean = mean(fBodyAcc.std...X),
             fBodyAcc.std...Y.Mean = mean(fBodyAcc.std...Y),
             fBodyAcc.std...Z.Mean = mean(fBodyAcc.std...Z),
             fBodyAcc.meanFreq...X.Mean = mean(fBodyAcc.meanFreq...X),
             fBodyAcc.meanFreq...Y.Mean = mean(fBodyAcc.meanFreq...Y),
             fBodyAcc.meanFreq...Z.Mean = mean(fBodyAcc.meanFreq...Z),
             fBodyAccJerk.mean...X.Mean = mean(fBodyAccJerk.mean...X),
             fBodyAccJerk.mean...Y.Mean = mean(fBodyAccJerk.mean...Y),
             fBodyAccJerk.mean...Z.Mean = mean(fBodyAccJerk.mean...Z),
             fBodyAccJerk.std...X.Mean = mean(fBodyAccJerk.std...X),
             fBodyAccJerk.std...Y.Mean = mean(fBodyAccJerk.std...Y),
             fBodyAccJerk.std...Z.Mean = mean(fBodyAccJerk.std...Z),
             fBodyAccJerk.meanFreq...X.Mean = mean(fBodyAccJerk.meanFreq...X),
             fBodyAccJerk.meanFreq...Y.Mean = mean(fBodyAccJerk.meanFreq...Y),
             fBodyAccJerk.meanFreq...Z.Mean = mean(fBodyAccJerk.meanFreq...Z),
             fBodyGyro.mean...X.Mean = mean(fBodyGyro.mean...X),
             fBodyGyro.mean...Y.Mean = mean(fBodyGyro.mean...Y),
             fBodyGyro.mean...Z.Mean = mean(fBodyGyro.mean...Z),
             fBodyGyro.std...X.Mean = mean(fBodyGyro.std...X),
             fBodyGyro.std...Y.Mean = mean(fBodyGyro.std...Y),
             fBodyGyro.std...Z.Mean = mean(fBodyGyro.std...Z),
             fBodyGyro.meanFreq...X.Mean = mean(fBodyGyro.meanFreq...X),
             fBodyGyro.meanFreq...Y.Mean = mean(fBodyGyro.meanFreq...Y),
             fBodyGyro.meanFreq...Z.Mean = mean(fBodyGyro.meanFreq...Z),
             fBodyAccMag.mean.Mean = mean(fBodyAccMag.mean..),
             fBodyAccMag.std.Mean = mean(fBodyAccMag.std..),
             fBodyAccMag.meanFreq.Mean = mean(fBodyAccMag.meanFreq..),
             fBodyBodyAccJerkMag.mean.Mean = mean(fBodyBodyAccJerkMag.mean..),
             fBodyBodyAccJerkMag.std.Mean = mean(fBodyBodyAccJerkMag.std..),
             fBodyBodyAccJerkMag.meanFreq.Mean = mean(fBodyBodyAccJerkMag.meanFreq..),
             fBodyBodyGyroMag.mean.Mean = mean(fBodyBodyGyroMag.mean..),
             fBodyBodyGyroMag.std.Mean = mean(fBodyBodyGyroMag.std..),
             fBodyBodyGyroMag.meanFreq.Mean = mean(fBodyBodyGyroMag.meanFreq..),
             fBodyBodyGyroJerkMag.mean.Mean = mean(fBodyBodyGyroJerkMag.mean..),
             fBodyBodyGyroJerkMag.std.Mean = mean(fBodyBodyGyroJerkMag.std..),
             fBodyBodyGyroJerkMag.meanFreq.Mean = mean(fBodyBodyGyroJerkMag.meanFreq..),
             angle.tBodyAccMean.gravity.Mean = mean(angle.tBodyAccMean.gravity.),
             angle.tBodyAccJerkMean..gravityMean.Mean = mean(angle.tBodyAccJerkMean..gravityMean.),
             angle.tBodyGyroMean.gravityMean.Mean = mean(angle.tBodyGyroMean.gravityMean.),
             angle.tBodyGyroJerkMean.gravityMean.Mean = mean(angle.tBodyGyroJerkMean.gravityMean.),
             angle.X.gravityMean.Mean = mean(angle.X.gravityMean.),
             angle.Y.gravityMean.Mean = mean(angle.Y.gravityMean.),
             angle.Z.gravityMean.Mean = mean(angle.Z.gravityMean.)
),by=.(SubjectID,ActivityDesc)]

#Write the file
write.table(FullDT2,file="tidy5.txt",row.name=FALSE )

# Clean up
rm(TrainDT)
rm(TestDT)
rm(ActivityDF)
rm(SetFileDF)
rm(ActivityFile)
rm(SetFile)
rm(FullDT)
rm(FullDT2)
