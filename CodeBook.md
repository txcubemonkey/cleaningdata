---
title: "CodeBook.md"
author: "TXCubeMonkey"
date: "Wednesday, December 23, 2015"
output: html_document
---

This is the code book for the Course Project in Getting and Cleaning Data.

The data files were downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


## Libraries used
library(dplyr)  
library(data.table)  

## Data Loading
The data sets were spit into two sets, the training set and the test set.

Once the data is downloaded, the files are expected to be be in the subdirectories:  
HCI HAR Dataset  
HCI HAR Dataset/test  
HCI HAR Dataset/train  


### Data Transformations
The activity descriptions were loaded from the HCI HAR Dataset/activities_labels.txt and the number was matched to the data in the HCI HAR Dataset/test/y_test.txt and the HCI HAR Dataset/train/y_train.txt files.

The data was loded into training and testing activity datasets.  A sequence was added to the dataframe to preserve the original order of each data entry.

The column names were pulled from the HCI HAR Dataset/features.txt file.

The actual results data was then loaded from HCI HAR Dataset/test/X_test.txt and HCI HAR Dataset/train/X_train.txt files.  The column names were used for the data from were based in the features file.

A sequence was added to both the traing and test data to preserver the original order.  A column was added to the training set to denote that this is from traing, and a column was added to the test set to do the same.  This column was never used for the calculations.

Only columns containing the description of "mean" and "std" were selected based on the reqirement to use only mean and standard deviation measurements.

The data was then merged to combine the activity, the subject and the measurements. Both the training set and the test set were then combined into a data table.

The mean was then calculated on each column grouped by the test subject and the activity.

### Final Results

The final results were then written to tidy5.txt

