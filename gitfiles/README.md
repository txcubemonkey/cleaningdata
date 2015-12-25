---
title: "README"
author: "TXCubeMonkey"
date: "Wednesday, December 23, 2015"
output: html_document
---

# Directory Structure
Expected Directory Structure:

***HCI HAR Dataset***   
***HCI HAR Dataset/test***   
***HCI HAR Dataset/train***   

# The dataset includes the following files:
* 'README.md'
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


# Script Files
* run_analysis.R
* load_training_sets.R
* load_test_sets.R

# Notes
1. The run_analysis.R is the main script.  It will load the activities from the activity_labels.txt and the column names features.txt.
2. The run_analysis calls load_training_sets and load_test_sets to get the respective data.
3. The tidy5.txt will be written to the base directory.

