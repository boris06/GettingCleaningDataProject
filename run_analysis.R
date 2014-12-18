#------------------------------------------------------------------------------------------------
#
# Script: run_analysis.R
# Project: Coursera Getting and Cleaning Data Course Project
# Author: boris06
# Date: 17.12.2014
#
# Description: 
# 1.Merges the training and the test sets to create one data set.
# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3.Uses descriptive activity names to name the activities in the data set
# 4.Appropriately labels the data set with descriptive variable names. 
# 5.From the data set in step 4, creates a second, independent tidy data set with the average 
#   of each variable for each activity and each subject.
#
#------------------------------------------------------------------------------------------------
 
# set working directory 
setwd("C:/Users/petelin/Documents/Coursera/Data Science Specialization/Getting and Cleaning Data")

# download and unzip the UCI HAR Dataset - the four rows below are used only the first time 
#
# fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(fileUrl, destfile = "./getdata_projectfiles_UCI HAR Dataset.zip")
# dateDownloaded <- date()
# unzip("./getdata_projectfiles_UCI HAR Dataset.zip")

# read the features and activities
path <- "./UCI HAR Dataset/"
file <- paste(path,"features.txt",sep="")
features <- read.table(file, header = FALSE, sep=" ", 
                       col.names = c("id", "feature"), 
                       stringsAsFactors=FALSE)
file <- paste(path,"activity_labels.txt",sep="")
activities <- read.table(file, header = FALSE, sep=" ", 
                         col.names = c("activityID", "activityDesc"), 
                         stringsAsFactors=FALSE)

# select only features with the names that contain "mean()" and "std()"
colMean <- grep("mean()", features$feature, fixed = TRUE)
colStd <- grep("std()", features$feature, fixed = TRUE)
colMeanStd <- sort(c(colMean,colStd))
        
# read the training data
path <- "./UCI HAR Dataset/train/"
file <- paste(path,"subject_train.txt",sep="")
subject_train <- read.table(file, header = FALSE, col.names = c("subject"), 
                            stringsAsFactors=FALSE)
file <- paste(path,"y_train.txt",sep="")
y_train <- read.table(file, header = FALSE, col.names = c("activityID"), 
                      stringsAsFactors=FALSE)
file <- paste(path,"X_train.txt",sep="")
X_train <- read.table(file, header = FALSE, stringsAsFactors=FALSE)

# prepare tidy training data - add column names from features.txt and 
# select only those columns that contain "mean()" and "std()" and 
# finally binding the activities, subjects and train data into
# data frame train_data
colnames(X_train) <- features$feature
X_train <- X_train[,colMeanStd]
train_data <- cbind(y_train,subject_train,X_train)

# read the test data
path <- "./UCI HAR Dataset/test/"
file <- paste(path,"subject_test.txt",sep="")
subject_test <- read.table(file, header = FALSE, col.names = c("subject"), 
                           stringsAsFactors=FALSE)
file <- paste(path,"y_test.txt",sep="")
y_test <- read.table(file, header = FALSE, col.names = c("activityID"), 
                     stringsAsFactors=FALSE)
file <- paste(path,"X_test.txt",sep="")
X_test <- read.table(file, header = FALSE, stringsAsFactors=FALSE)

# prepare tidy test data - add column names from features.txt and 
# select only those columns that contain "mean()" and "std()" and 
# finally binding the activities, subjects and test data into
# data frame test_data
colnames(X_test) <- features$feature
X_test <- X_test[,colMeanStd]
test_data <- cbind(y_test,subject_test,X_test)

# concatenate train_data and test_data to tidy_data
tidy_data <- rbind(train_data, test_data)

# make good column names in tidy_data
colnames(tidy_data) <- gsub("()", "", colnames(tidy_data), fixed = TRUE)
colnames(tidy_data) <- gsub("-std", "StDev", colnames(tidy_data), fixed = TRUE)
colnames(tidy_data) <- gsub("-mean", "Mean", colnames(tidy_data), fixed = TRUE)
colnames(tidy_data) <- gsub("^(t)", "time", colnames(tidy_data))
colnames(tidy_data) <- gsub("^(f)", "freq", colnames(tidy_data))
colnames(tidy_data) <- gsub("-", "", colnames(tidy_data), fixed = TRUE)

# write tidy_data
write.table(tidy_data, file = "./tidy_data.txt", row.name=FALSE)

# average tidy_data by activity and subject 
tidy_data_mean <- aggregate(tidy_data[,3:ncol(tidy_data)], 
                            by=list(activityID = tidy_data$activityID, 
                                    subject = tidy_data$subject), 
                            FUN=mean)

# add the description of activities
tidy_data_mean <- merge(tidy_data_mean,activities,by = "activityID", all=TRUE)
# reorder the columns so that activityID and activityDesc become the first two columns
tidy_data_mean <- tidy_data_mean[c(1,69,2:68)]
# order the data frame by activityID and subject
tidy_data_mean <- tidy_data_mean[order(tidy_data_mean$activityID,tidy_data_mean$subject),]

# write averaged data
write.table(tidy_data_mean, file = "./tidy_data_mean.txt", row.name=FALSE)
