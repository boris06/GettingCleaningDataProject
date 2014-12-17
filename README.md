## Getting and Cleaning Data Project

### Description of the project:
This repository contains the submission of the project of the Johns Hopkins course Getting and Cleaning Data. The goal of the course is to prepare tidy data that can be used for later analysis. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data for the project can be found here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The process of tidying the above data is summarized as follows:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

### Files in this repository:
1. README.md – this file
2. CodeBook.md – contains the description of variables, data and any transformations or work performed to clean up the data
3. run_analysis.R – the script for performing the analysis

### Description of the script:

The operation of the script takes place in the following steps:

1. Downloads and unzips the data (this is required only at the first run of the script)
2. Reads the features (features.txt) and the descriptions of activities (activity_labels.txt)
3. Selects only those features which give the means and standard deviations of the quantities, that is, contain the substrings "mean()" and "std()". The variables like angle(X,gravityMean) do not take into account here.
4. Reads the training data:
     a) training subjects (file subject_train.txt)
     b) training activities (file y_train.txt)
     c) training data (file X_train.txt)
5. Prepares the tidy training data set:
- adds the activity names
- adds column names from features.txt and select only those columns that contain substrings "mean()" and "std()” in the column names
- cbinds the training activities, subjects and train data into the data frame train_data
6. Reads the test data:
- testing subjects (file subject_test.txt)
- testing activities (file y_test.txt)
- testing data (file X_test.txt)
7. Prepares the tidy test data set:
- adds the activity names
- adds column names from features.txt and select only those columns that contain substrings "mean()" and "std()” in the column names
- cbinds the testing activities, subjects and test data into the data frame test_data
8. Concatenates train_data and test_data into tidy_data
9. Makes good column names in tidy_data
10. Writes tidy_data to a text file
11. Averages the quantities in tidy_data by activity and subject
12. Writes the averaged quantities in tidy_data_mean to a text file


