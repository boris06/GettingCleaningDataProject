## Getting and Cleaning Data Project

### Input data:
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data for the project can be found here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Output dataset:

File name: tidy_data_mean.txt

Columns (variables):

* activityID ... activity id, values: 1, 2, 3, 4, 5, 6
* activityDesc ... the description of activities, values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS,	SITTING,	STANDING,  LAYING
* subject ... person id, values: 1, 2, ..., 30


Below are the means and standard deviations of 33 measured variables, averaged by activity and subject (see the descriptions of the original variables below):

* timeBodyAccMeanX
* timeBodyAccMeanY
* timeBodyAccMeanZ
* timeBodyAccStDevX
* timeBodyAccStDevY
* timeBodyAccStDevZ
* timeGravityAccMeanX
* timeGravityAccMeanY
* timeGravityAccMeanZ
* timeGravityAccStDevX
* timeGravityAccStDevY
* timeGravityAccStDevZ
* timeBodyAccJerkMeanX
* timeBodyAccJerkMeanY
* timeBodyAccJerkMeanZ
* timeBodyAccJerkStDevX
* timeBodyAccJerkStDevY
* timeBodyAccJerkStDevZ
* timeBodyGyroMeanX
* timeBodyGyroMeanY
* timeBodyGyroMeanZ
* timeBodyGyroStDevX
* timeBodyGyroStDevY
* timeBodyGyroStDevZ
* timeBodyGyroJerkMeanX
* timeBodyGyroJerkMeanY
* timeBodyGyroJerkMeanZ
* timeBodyGyroJerkStDevX
* timeBodyGyroJerkStDevY
* timeBodyGyroJerkStDevZ
* timeBodyAccMagMean
* timeBodyAccMagStDev
* timeGravityAccMagMean
* timeGravityAccMagStDev
* timeBodyAccJerkMagMean
* timeBodyAccJerkMagStDev
* timeBodyGyroMagMean
* timeBodyGyroMagStDev
* timeBodyGyroJerkMagMean
* timeBodyGyroJerkMagStDev
* freqBodyAccMeanX
* freqBodyAccMeanY
* freqBodyAccMeanZ
* freqBodyAccStDevX
* freqBodyAccStDevY
* freqBodyAccStDevZ
* freqBodyAccJerkMeanX
* freqBodyAccJerkMeanY
* freqBodyAccJerkMeanZ
* freqBodyAccJerkStDevX
* freqBodyAccJerkStDevY
* freqBodyAccJerkStDevZ
* freqBodyGyroMeanX
* freqBodyGyroMeanY
* freqBodyGyroMeanZ
* freqBodyGyroStDevX
* freqBodyGyroStDevY
* freqBodyGyroStDevZ
* freqBodyAccMagMean
* freqBodyAccMagStDev
* freqBodyBodyAccJerkMagMean
* freqBodyBodyAccJerkMagStDev
* freqBodyBodyGyroMagMean
* freqBodyBodyGyroMagStDev
* freqBodyBodyGyroJerkMagMean
* freqBodyBodyGyroJerkMagStDev

### Description of the original variables:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.tBodyAcc-XYZ

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

### Data operations:

1. Downloads and unzips the data (this is required only at the first run of the script)
2. Reads the features (features.txt) and the descriptions of activities (activity_labels.txt)
3. Selects only those features which give the means and standard deviations of the quantities, that is, contain the substrings "mean()" and "std()". The variables like angle(X,gravityMean) do not take into account here.
4. Reads the training data:
    * training subjects (file subject_train.txt)
    * training activities (file y_train.txt)
    * training data (file X_train.txt)
5. Prepares the tidy training data set:
    * adds column names from features.txt and select only those columns that contain substrings "mean()" and "std()” in the column names
    * cbinds the training activities, subjects and train data into the data frame train_data
6. Reads the test data:
    * test subjects (file subject_test.txt)
    * test activities (file y_test.txt)
    * test data (file X_test.txt)
7. Prepares the tidy test data set:
    * adds column names from features.txt and select only those columns that contain substrings "mean()" and "std()” in the column names
    * cbinds the testing activities, subjects and test data into the data frame test_data
8. Concatenates train_data and test_data into tidy_data
9. Makes good column names in tidy_data - using gsub replaces removes "()" and "-",  replaces "-mean" with "Mean", "-std" with "StDev", replaces prefix "t" with "time" and prefix "f" with "freq" in variable names
10. Writes tidy_data to a text file tidy_data.txt
11. Averages the quantities in tidy_data by activity and subject to resulting data frame tidy_data_mean
12. Adds the description of activities in tidy_data_mean, reorders the columns so that the activities and their descriptions and subjects come first and finally sorts tidy_data_mean by activity and subject
12. Writes the averaged quantities in tidy_data_mean to a text file tidy_data_mean.txt

