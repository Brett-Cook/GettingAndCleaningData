# Getting and Cleaning Data Course Project

library(dplyr)

# This R script performs the following:
# 1. Merge the training and the test sets to create one data set.
# 2. Extract measurements on the mean and standard deviation for each measurement.
# 3. Name the activities in the data set with descriptive activity names
# 4. Label the data set with descriptive variable names.
# 5. Create a tidy data set with the average of each variable for each activity and each subject.

# Note: it is assumed the data has been downloaded and unzipped and that the working directory is set to directory to which the data was downloaded to
setwd("C:/Users/brcook/Coursera/Getting & Cleaning Data")


# 1. Merge the training and the test sets to create one data set.
# Read in test files
  X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
  y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
  subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
# Read in train files
  X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
  y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
  subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
  
# Combine test tables to form TestData dataset
  TestData <- cbind(subject_test, y_test, X_test)
  
# Combine train tables to form TrainData dataset
  TrainData <- cbind(subject_train, y_train, X_train)
  
# Combine TestData & TrainData to form one complete dataset
  CompleteData <- rbind(TestData,TrainData)

# 2. Extract the measurements on the mean and standard deviation for each measurement.
  # Read in names of data columns
  Features <- read.table("./UCI HAR Dataset/features.txt")
  ColNames <- c("Subject", "Activity", as.character(Features[,2]))  
  SelectedColumnIndex = grepl("Subject|Activity|*mean\\(\\)|*std\\(\\)", ColNames)
  SelectedData <- CompleteData[,SelectedColumnIndex]

# 3. Name the activities in the data set with descriptive activity names
  ActivityLabels = read.table("./UCI HAR Dataset/activity_labels.txt")
  names(ActivityLabels) <- c("ID","Name")
  SelectedData[,2] <- factor(SelectedData[,2], levels = ActivityLabels$ID, labels = ActivityLabels$Name)
  
# 4. Label the data set with descriptive variable names.
  # Modify variable names to make them more descriptive  
  ColNames <- gsub("^t", "Time-", ColNames)
  ColNames <- gsub("^F", "Freq-", ColNames)
  ColNames <- gsub("mean\\(\\)","Mean", ColNames)
  ColNames <- gsub("std\\(\\)","Std", ColNames)
  
  # Apply the new variable names
  names(SelectedData) <- ColNames[SelectedColumnIndex]

  
  
# 5. Create a tidy data set with the average of each variable for each activity and each subject.
  TidyData <- SelectedData %>% group_by(Activity,Subject) %>% summarize_all(funs(mean))
  write.table(TidyData,"TidyData.txt", row.names = FALSE)