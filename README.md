# ReadMe - Getting and Cleaning Data Course Project

This repository contains the files created for the Getting and Cleaning Data course project.The following sections describe each file.

## CodeBook.md
Provides the following information:
* Original data description
* Data cleaning and output data generation
* Output data description

## run_analysis.R
R script to clean the original data and produce the required output. The script assumes the original data has been downloaded and unzipped and the working directory is set to directory to which the data was downloaded to. This script performs the following steps:
1. Merge the training and the test sets to create one data set.
2. Extract measurements on the mean and standard deviation for each measurement.
3. Name the activities in the data set with descriptive activity names.
4. Label the data set with descriptive variable names.
5. Create a tidy data set with the average of each variable for each activity and each subject.

## TidyData.txt
File containing the output data consisting of the average of each variable for each activity and each subject.