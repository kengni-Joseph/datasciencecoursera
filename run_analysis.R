# Getting and Cleaning Data Project John Hopkins Coursera
# Author: Joseph KENGNI

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Step 1: Load necessary libraries
library(dplyr)

# Step 2: Download and unzip the dataset
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(url, destfile = "dataset.zip")
#unzip("dataset.zip")

# Step 3: Read in the data
# Load feature names and activity labels
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "feature"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

# Load training and test datasets
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity_code")

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity_code")

# Step 4: Merge the training and test datasets
subject <- rbind(subject_train, subject_test)
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)

merged_data <- cbind(subject, y, x)

# Step 5: Extract only the measurements on the mean and standard deviation
mean_std_features <- grep("mean\\(\\)|std\\(\\)", features$feature)
selected_data <- cbind(subject, y, x[, mean_std_features])

# Step 6: Use descriptive activity names
selected_data$activity_code <- activities[selected_data$activity_code, 2]

# Step 7: Appropriately label the dataset with descriptive variable names
names(selected_data)[-c(1, 2)] <- features$feature[mean_std_features]
names(selected_data) <- gsub("^t", "Time", names(selected_data))
names(selected_data) <- gsub("^f", "Frequency", names(selected_data))
names(selected_data) <- gsub("Acc", "Accelerometer", names(selected_data))
names(selected_data) <- gsub("Gyro", "Gyroscope", names(selected_data))
names(selected_data) <- gsub("Mag", "Magnitude", names(selected_data))
names(selected_data) <- gsub("BodyBody", "Body", names(selected_data))

# Step 8: Create a second tidy dataset with the average of each variable for each activity and each subject
tidy_data <- selected_data %>%
  group_by(subject, activity_code) %>%
  summarise_all(mean)

# Step 9: Write the tidy dataset to a file
write.table(tidy_data, "tidy_data.txt", row.name = FALSE)
