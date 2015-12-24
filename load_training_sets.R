#"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

library(dplyr)
library(data.table)

########################################################
##
## FIRST LOAD THE TRAINING DATA
##
########################################################
#Read the training labels file
TrainLabelFile <- "./UCI HAR Dataset/train/y_train.txt"
# Load the training labels into a data frame 
TrainLabelDF <- read.table(TrainLabelFile,col.names=c("ActivityID"))

#Add an ID to the rows to keep the order
TrainLabelDF <- mutate(TrainLabelDF,ID=1:nrow(TrainLabelDF))

#Read the training set
TrainSetFile <- "./UCI HAR Dataset/train/X_train.txt"

# Load the training labels into a data frame 
TrainSetDF <- read.table(TrainSetFile,col.names=SetFileDF$MeasureDesc)
TrainSetDF <- select(TrainSetDF, matches("mean|std"))

#Add an ID to the rows to keep the order
TrainSetDF <- mutate(TrainSetDF,ID=1:nrow(TrainSetDF))

#Add an column for type of data
TrainSetDF <- mutate(TrainSetDF,SetType="train")

#Read the training Subject file
TrainSubjectFile <- "./UCI HAR Dataset/train/subject_train.txt"
# Load the training Subject into a data frame 
TrainSubjectDF <- read.table(TrainSubjectFile,col.names=c("SubjectID"))

#Add an ID to the rows to keep the order
TrainSubjectDF <- mutate(TrainSubjectDF,ID=1:nrow(TrainSubjectDF))

#Merge the Activity And the Subjects
MergedDF <- merge(TrainLabelDF,TrainSubjectDF,by.x="ID",by.y="ID",all=TRUE)

#Merge the Activity,Subjects and data
MergedDF <- merge(MergedDF,TrainSetDF,by.x="ID",by.y="ID",all=TRUE)

##Clean up
rm(TrainSubjectDF)
rm(TrainSubjectFile)
rm(TrainSetDF)
rm(TrainSetFile)
rm(TrainLabelDF)
rm(TrainLabelFile)

TrainDT <- data.table(MergedDF)

rm(MergedDF)
