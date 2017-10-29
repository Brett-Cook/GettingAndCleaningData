# Code Book - Getting and Cleaning Data Course Project

## Original Data Description
The data for this project was collected from an embedded accelerometer and gyroscope in Samsung Galaxy S smartphones and is available from this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Detailed information about the experiment and the data is available in the README.txt file included in the zip package. In summary, the zip package includes a number of files which relate to data that was collected from 30 persons performing 6 activities:
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

Each record contains a vector of 561-features with time and frequency domain variables generated from:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope


## Data Cleaning and Output Data Generation
The following steps are performed by the script **run_analysis.R** to clean the data and produce the output data:
1. Merge the training and the test sets to create one data set. This data set is named **CompleteData** 
2. Extract measurements on the mean and standard deviation for each measurement. Measurements for mean were extracted by selecting variable names containing "mean()" and measurements for standard deviation were extracted by selecting variable names containing "std()".
3. Name the activities in the data set with descriptive activity names
4. Label the data set with descriptive variable names.
5. Create a tidy data set with the average of each variable for each activity and each subject. This data set is named **TidyData** and which is written to a file named "TidyData.txt".

## Ouput Data Description
The output data **TidyData.txt** contains the average for each variable for each activity and each subject. The following describes the variables in the output data:
1. Activity: name of activity
2. Subject: identification number of subject
3. Other variables contain the average of the measurements for each activity and each subject. The following information is provided to assist in understanding the variable names and the abbreviations used:
* Time: Time domain variable
* Freq: Frequency domain variable
* Acc: Accelerometer. All variables containing "Acc" are obtained from the accelerometer sensor and give the acceleration along the specified axis (X, Y, or Z) in the variable name. Units: metres/second^2
* Gyro: Gyroscope. All variables containing "Gyro" are obtained from the gyroscope sensor which give angular velocity: Units: radians/second.
* X, Y or Z: acceleration axis
* Mag: magnitute