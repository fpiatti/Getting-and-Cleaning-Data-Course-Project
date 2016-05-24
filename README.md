# Getting-and-Cleaning-Data-Course-Project

This repo contains data collected from the accelerometers of a Samsung Galaxy S smartphone. The data was collected when the 
participants of the study performed actions such as standing, sitting, laying, walking, walking upstairs, and walking downstairs while
carrying the phone attached to their waist. The raw data was subsequently subjected to different operations including filtering 
and frequency domain transformations. 
The main folder on this repo, "UCI HAR Dataset" contains the following files/folders:
  1. "README.txt": File containing general information on the study, variables measured, and output files.
  2. "activity_labels.txt: This file correlates the actvity labels with the integer numbers in the range [1-6] .
  3. "features.txt": This file contains a complete list of all the variables measured and calculated.
  4. "features_info.txt": This file contains further details on the setup of the test and the processing of the resulting 
  measurements.
  5. "test" folder: Folder containing the portion of the data used for testing.
  6. "train" folder: Folder containing the portion of the data used for training.
  7. "run_analysis.R": Script written in R that performs the following tasks:
      - Merges the training and the test sets to create one data set.
      - Extracts only the measurements on the mean and standard deviation for each measurement.
      - Uses descriptive activity names to name the activities in the data set
      - Appropriately labels the data set with descriptive variable names.
      - From the data set in the previous step, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  8. "tidy_data.csv": Comma-separated file with the contents of the "tidy_data" dataframe.
  9. "tidy_data.txt": Text file with the contents of the "tidy_data" dataframe.

## Instructions to Run "run_analysis.R"

- Download the entire "UCI HARD Dataset" folder to your desktop.
- Navigate to the UCI HARD Dataset folder.
- Launch R Studio and and set your working directory to UCI HAR Dataset folder.
- Type source("run_analysis.R") in the command line. 
