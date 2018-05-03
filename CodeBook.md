# CodeBook for Caurseras Getting and Cleaning Data Course Project

## Source Data

Source data for the project is the 
"Human Activity Recognition Using Smartphones Dataset - Version 1.0"

The dataset can be downloaded from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Inside the zipfile there is a Readme file and other text files that fully describe the dataset. 

### Summarizing the dataset info: 

The source data is the result of pre-processed sensor signals (accelerometer and gyroscope) gathered by 30 volunteers (subjects) wearing a smartphone (Samsung Galaxy S II) on the waist. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

### Source Dataset Variables (features)

* The features selectedcome from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
* These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
* The acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ)
* The body linear acceleration and angular velocity were derived in time to obtain Jerk signals
* Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag...)
* A Fast Fourier Transform (FFT) was applied to some of these signals (fBodyAcc-XYZ, fBodyAccJerk-XYZ...  'f' to indicate frequency domain signals)
* '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.


## Data Transformations 

1. Merge the training and the test sets to create one data set.

   Read and then rbind the following two datasets: 
* 'train/X_train.txt': Training set
* 'test/X_test.txt': Test set

2. Extract only the measurements on the mean and standard deviation for each measurement.

   Read the features (variables) from source file (features.txt) and use grep to get features containing "mean()" or "std()"
   Subset the data and the features with the mean and std features. 
   Set column names to dataset based on features. 

3. Uses descriptive activity names to name the activities in the data set
 
   In this step the dataset from step 2 is extended with the activities and the subjects. 
   Activities (y_train.txt, y_test.txt) and subjects (subject_train.txt, subject_test.txt) are read from files and are rbinded into an activities and subjects table, 
   which is then cbinded to the dataset.
   
   Activity Labels are merged to the dataset (on activity_ids) in order to add the activity names in the dataset.
   
4. Appropriately labels the data set with descriptive variable names.

   The variable names are Transformed using gsub into a more self explicating form.
   The following list depicts the replications that take place in variable names: 
   "^t" -> "Time"
   "^f" -> "Frequency"
   "Acc" -> "Accelerometer"
   "Gyro" -> "Gyroscope"
   "Mag" -> "Magnitude"

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

   Using the Library dplyr the necessary columns are selected (all except activity_id)
   Then perform the group by on the variables activity_name, subject
   And Finaly Summarize All Columns (except group by) to the mean 

   Output dataset is writen to file tidy_dataset.txt
   
   
## Output Dataset   
   
Dataset contains the average of each mean and standard deviation (std) variable, for each activity and each subject.
It contains 180 rows and 68 columns.
First two columns are the group by variables:  Activity_name (datatype: char), subject  (datatype: int) 
The next 66 columns (datatype:number) are the averages calculated for each source variable.

Activity_name column has 6 distinct values :
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

subject has values from 1:30 

The rest of the variables are (all numeric) 
TimeBodyAccelerometer-mean-X
TimeBodyAccelerometer-mean-Y
TimeBodyAccelerometer-mean-Z
TimeBodyAccelerometer-std-X
TimeBodyAccelerometer-std-Y
TimeBodyAccelerometer-std-Z
TimeGravityAccelerometer-mean-X
TimeGravityAccelerometer-mean-Y
TimeGravityAccelerometer-mean-Z
TimeGravityAccelerometer-std-X
TimeGravityAccelerometer-std-Y
TimeGravityAccelerometer-std-Z
TimeBodyAccelerometerJerk-mean-X
TimeBodyAccelerometerJerk-mean-Y
TimeBodyAccelerometerJerk-mean-Z
TimeBodyAccelerometerJerk-std-X
TimeBodyAccelerometerJerk-std-Y
TimeBodyAccelerometerJerk-std-Z
TimeBodyGyroscope-mean-X
TimeBodyGyroscope-mean-Y
TimeBodyGyroscope-mean-Z
TimeBodyGyroscope-std-X
TimeBodyGyroscope-std-Y
TimeBodyGyroscope-std-Z
TimeBodyGyroscopeJerk-mean-X
TimeBodyGyroscopeJerk-mean-Y
TimeBodyGyroscopeJerk-mean-Z
TimeBodyGyroscopeJerk-std-X
TimeBodyGyroscopeJerk-std-Y
TimeBodyGyroscopeJerk-std-Z
TimeBodyAccelerometerMagnitude-mean
TimeBodyAccelerometerMagnitude-std
TimeGravityAccelerometerMagnitude-mean
TimeGravityAccelerometerMagnitude-std
TimeBodyAccelerometerJerkMagnitude-mean
TimeBodyAccelerometerJerkMagnitude-std
TimeBodyGyroscopeMagnitude-mean
TimeBodyGyroscopeMagnitude-std
TimeBodyGyroscopeJerkMagnitude-mean
TimeBodyGyroscopeJerkMagnitude-std
FrequencyBodyAccelerometer-mean-X
FrequencyBodyAccelerometer-mean-Y
FrequencyBodyAccelerometer-mean-Z
FrequencyBodyAccelerometer-std-X
FrequencyBodyAccelerometer-std-Y
FrequencyBodyAccelerometer-std-Z
FrequencyBodyAccelerometerJerk-mean-X
FrequencyBodyAccelerometerJerk-mean-Y
FrequencyBodyAccelerometerJerk-mean-Z
FrequencyBodyAccelerometerJerk-std-X
FrequencyBodyAccelerometerJerk-std-Y
FrequencyBodyAccelerometerJerk-std-Z
FrequencyBodyGyroscope-mean-X
FrequencyBodyGyroscope-mean-Y
FrequencyBodyGyroscope-mean-Z
FrequencyBodyGyroscope-std-X
FrequencyBodyGyroscope-std-Y
FrequencyBodyGyroscope-std-Z
FrequencyBodyAccelerometerMagnitude-mean
FrequencyBodyAccelerometerMagnitude-std
FrequencyBodyBodyAccelerometerJerkMagnitude-mean
FrequencyBodyBodyAccelerometerJerkMagnitude-std
FrequencyBodyBodyGyroscopeMagnitude-mean
FrequencyBodyBodyGyroscopeMagnitude-std
FrequencyBodyBodyGyroscopeJerkMagnitude-mean
FrequencyBodyBodyGyroscopeJerkMagnitude-std
