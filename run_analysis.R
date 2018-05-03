library(dplyr)

# Download and Unzip data to Current Working Directory 

filename <- "dataset.zip"
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, filename)
unzip(filename) 

# 1. Merge the training and the test sets to create one data set.
train_data <- read.table("UCI HAR Dataset/train/X_train.txt")
test_data  <- read.table("UCI HAR Dataset/test/X_test.txt")
all_data <- rbind (train_data, test_data)

# 2. Extract only the measurements on the mean and standard deviation for each measurement.
#    Also set the column names of the dataset
features   <- read.table("UCI HAR Dataset/features.txt", as.is=TRUE)
i <- grep ("mean\\(\\)|std\\(\\)", features[,2])
mean_std_data <- all_data[,i]
mean_std_features <- features[i,2]
mean_std_features <- gsub ("[()]", "" , mean_std_features)
colnames (mean_std_data) <- mean_std_features


# 3. Use descriptive activity names to name the activities in the data set
#    In this step activity names and subject is added to the dataset

# Create activities table
train_activities <- read.table("UCI HAR Dataset/train/y_train.txt")
test_activities  <- read.table("UCI HAR Dataset/test/y_test.txt")
all_activities <- rbind(train_activities, test_activities)
colnames(all_activities) <- "activity_id"

# Create subjects table
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
test_subject  <- read.table("UCI HAR Dataset/test/subject_test.txt")
all_subject <- rbind(train_subject, test_subject)
colnames(all_subject) <- "subject"

# Column bind Activity_ids and Subjects to dataset
mean_std_data <- cbind(mean_std_data, all_activities)
mean_std_data <- cbind(mean_std_data, all_subject)

# Create Activity Labels 
activity_labels  <- read.table("UCI HAR Dataset/activity_labels.txt", as.is=TRUE)
colnames(activity_labels) <- c("activity_id", "activity_name")

# merge activity labels on data 
mean_std_data <- merge(mean_std_data, activity_labels, by.x="activity_id", by.y="activity_id", all.x=TRUE)

# 4. Appropriately label the data set with descriptive variable names
#   Replace shorthands with Full names 
names (mean_std_data) <- gsub("^t", "Time",  names (mean_std_data) )
names (mean_std_data) <- gsub("^f", "Frequency",  names (mean_std_data) )
names (mean_std_data) <- gsub("Acc", "Accelerometer",  names (mean_std_data) )
names (mean_std_data) <- gsub("Gyro", "Gyroscope",  names (mean_std_data) )  
names (mean_std_data) <- gsub("Mag", "Magnitude",  names (mean_std_data) ) 

# 5. Create a tidy data set with the average of each variable for each activity and each subject.
output_dataset <- select (mean_std_data, -(activity_id)) 
output_dataset <- group_by(output_dataset,  activity_name, subject )
output_dataset <- summarise_all(output_dataset, mean) 
# write final dataset to file 
write.table(output_dataset, file="tidy_dataset.txt", row.names = FALSE )
