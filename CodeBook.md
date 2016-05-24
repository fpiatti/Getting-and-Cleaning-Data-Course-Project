# Getting and Cleaning Data Project Codebook

Introduction: This codebook describes the variables, the data, and any transformations or work performed to clean up the data
of the test on "Human Activity Recognition Using Smartphones" (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
The data was obtained from participants performing different physical activities while wearing a smartphone attached to their waist.
The actvities performed are:
  - Sitting.
  - Standing.
  - Laying.
  - Walking.
  - Walking Upstairs.
  - Walking Downstairs.

### Variables

The data captured was composed of 3-axial linear acceleration and 3-axial angular velocity. The raw data was post-processed to 
remove noise and obtain frequency domain representations of the data. Furthermore the complete set of data was divided into 
testing and training sets.
For the purpose of this project the following actions were performed in the original data sets:
  - Merges the training and the test sets to create one data set.
  - Extracts only the measurements on the mean and standard deviation for each measurement.
  - Uses descriptive activity names to name the activities in the data set
  - Appropriately labels the data set with descriptive variable names.
  - From the data set in the previous step, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Description of "run_analysis.R" file

This file performs the following actions:
  1. Loads test and training data into the R Studio environment.
  2. Recovers activity labels and variables names from "activity_labels.txt" and "features.txt" files respectively.
  3. Reads subject, measurements, and activity files for the training set from the "subject_train.txt", "X_train.txt", and 
  "y_train.txt" files respectively.
  4. Builds a dataframe with the information from the previous step.
  5. Repeats steps 3-4 for test files.
  6. Merges both dataframes.
  7. Renames columns of the new dataframe.
  8. Identifies those columns containing mean and standard deviation data. Keep these columns while removing all others.
  9. Changes the description of the activities in the dataframe from integers in the range [1-6] to the labels shown in "activity_labels.txt".
  10. For each subject and each activity calculates the mean value of each variable and stored in a tidy dataframe.
  11. Renames the variables in the new tidy dataframe to reflect the meaning of the data.
  12. Writes the tidy dataframe to comma-separated (csv) and text (TXT) files.
  
  
  
