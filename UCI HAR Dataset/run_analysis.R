# Load required packages
library(dplyr)

# Create path to training and test sets
train_set <- paste(getwd(), "train", sep = "/")
test_set <- paste(getwd(), "test", sep = "/")

# Get activity labels and variables names
activity_labels <- read.table("activity_labels.txt", header = FALSE, sep = "")
features <- read.table("features.txt", header = FALSE, sep = "")

# Read files containing information on subjects, activities and sensor readings from training sets
subject_train <- read.table(paste(train_set, "subject_train.txt", sep = "/"), header = FALSE, sep = "")
y_train <- read.table(paste(train_set, "y_train.txt", sep = "/"), header = FALSE, sep = "")
X_train <- read.table(paste(train_set, "X_train.txt", sep = "/"), header = FALSE, sep = "")

# Join subjects, activities and sensor readings together
my_data <- cbind(subject_train, y_train, X_train)

# Read files containing information on subjects, activities and sensor readings from test sets
subject_test <- read.table(paste(test_set, "subject_test.txt", sep = "/"), header = FALSE, sep = "")
y_test <- read.table(paste(test_set, "y_test.txt", sep = "/"), header = FALSE, sep = "")
X_test <- read.table(paste(test_set, "X_test.txt", sep = "/"), header = FALSE, sep = "")

# Merge both data sets
my_data <- rbind(my_data, cbind(subject_test, y_test, X_test))

# Rename columns
variables_names <- c("Subject", "Activity", lapply(features$V2, as.character))
names(my_data) <- variables_names

# Extracts only the measurements on the mean and standard deviation for each measurement
mean_data <- grep("mean", names(my_data))
std_data <- grep("std", names(my_data))

cols <- sort(c(mean_data, std_data))
my_data <- cbind(my_data[,1:2], my_data[, cols])

# Uses descriptive activity names to name the activities in the data set
my_data$Activity <- gsub("1", "WALKING", my_data$Activity)
my_data$Activity <- gsub("2", "WALKING_UPSTARIS", my_data$Activity)
my_data$Activity <- gsub("3", "WALKING_DOWNSTARIS", my_data$Activity)
my_data$Activity <- gsub("4", "SITTING", my_data$Activity)
my_data$Activity <- gsub("5", "STANDING", my_data$Activity)
my_data$Activity <- gsub("6", "LYING", my_data$Activity)

# Find number of different subjects
subjects <- sort(unique(my_data$Subject))

# Create list of actvities
activities <- unique(my_data$Activity)

# Rename variables to describe operation to perform on the variables
vars <- gsub("-.*?-", "-mean-", names(my_data[-(1:2)]))

# Initialize dataset
tidy_data <- data.frame(matrix(ncol = length(vars) + 2, nrow = 0), stringsAsFactors = FALSE)

# Create independent tidy data set with the average of each variable for each activity and each subject
for (subject in subjects){
  for (activity in activities){
    sub <- filter(my_data, Subject == subject, Activity == activity)
    row <- nrow(tidy_data)
    tidy_data[row + 1,] <- c(subject, activity, unname(sapply(sub[,-(1:2)], mean)))
  }
  rm(sub)
}

# Rename variables in tidy dataset to reflect that these are "mean" values
names(tidy_data) <- c("Subject", "Activity", vars)

# Write tidy dataset to CSV file
write.csv(tidy_data, paste(getwd(), "tidy_data.csv", sep = "/"))








