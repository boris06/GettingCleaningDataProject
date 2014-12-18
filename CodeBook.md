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

