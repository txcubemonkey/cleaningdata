#"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

library(dplyr)
library(data.table)

########################################################
##
## FIRST LOAD THE TESTING DATA
##
########################################################
#Read the Testing labels file
TestLabelFile <- "./UCI HAR Dataset/Test/y_Test.txt"
# Load the Testing labels into a data frame 
TestLabelDF <- read.table(TestLabelFile,col.names=c("ActivityID"))

#Add an ID to the rows to keep the order
TestLabelDF <- mutate(TestLabelDF,ID=1:nrow(TestLabelDF))

#Read the Testing set
TestSetFile <- "./UCI HAR Dataset/Test/X_Test.txt"

# Load the Testing labels into a data frame 
TestSetDF <- read.table(TestSetFile,col.names=SetFileDF$MeasureDesc)
TestSetDF <- select(TestSetDF, matches("mean|std"))

#Add an ID to the rows to keep the order
TestSetDF <- mutate(TestSetDF,ID=1:nrow(TestSetDF))

#Add an column for type of data
TestSetDF <- mutate(TestSetDF,SetType="Test")

#Read the Testing Subject file
TestSubjectFile <- "./UCI HAR Dataset/Test/subject_Test.txt"
# Load the Testing Subject into a data frame 
TestSubjectDF <- read.table(TestSubjectFile,col.names=c("SubjectID"))

#Add an ID to the rows to keep the order
TestSubjectDF <- mutate(TestSubjectDF,ID=1:nrow(TestSubjectDF))

#Merge the Activity And the Subjects
MergedDF <- merge(TestLabelDF,TestSubjectDF,by.x="ID",by.y="ID",all=TRUE)

#Merge the Activity,Subjects and data
MergedDF <- merge(MergedDF,TestSetDF,by.x="ID",by.y="ID",all=TRUE)

##Clean up
rm(TestSubjectDF)
rm(TestSubjectFile)
rm(TestSetDF)
rm(TestSetFile)
rm(TestLabelDF)
rm(TestLabelFile)

TestDT <- data.table(MergedDF)

rm(MergedDF)
