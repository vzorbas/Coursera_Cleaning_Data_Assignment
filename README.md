# Coursera: Getting and Cleaning Data Course Project

This repository contains the files related to the coursera "Getting and Cleaning Data" course project.

## Project Description 

The project has to do with collecting, working with, and cleaning a data set. 
The goal is to prepare tidy data that can be used for later analysis.

## Source Data

The source data are derived from  "Human Activity Recognition Using Smartphones Data Set" and can be obtained from the following link: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The dataset is fully explained in the source data zip file.  

The source data is the result of pre-processed sensor signals (accelerometer and gyroscope) gathered by 30 volunteers (subjects) wearing a smartphone (Samsung Galaxy S II) on the waist. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

More Information on the data can be found at 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## Data Processing

The goal is to create an R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Contents of this Repository

* tidy_dataset.txt:  The resulting tidy dataset from step 5 of data processing
* run_analysis.R: The R script that does the data processing described
* CodeBook.md: The code book that describes the variables, the data, and transformations performed on the data
* README.md: This readme file

## Built With

* R version 3.4.3
* RStudio Version 1.1.423

## Authors

Evangelos Zormpas

