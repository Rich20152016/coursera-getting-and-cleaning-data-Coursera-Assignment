==================================================================
Coursera Data Science Specialization
Getting and Cleaning Data - Course project
==================================================================

Project summary
=========================================
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis.

Requirements
=========================================
1) Provide a tidy data set in txt format 
2) Provide a link to a Github repository with your script for performing the analysis
3) Provide a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
4) Include a README.md in the repo with your scripts. 

Step 1. Getting the data
=========================================
1) http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
2) https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Step 2. Setup the repository
=========================================
1. Create the repository in your Github account
2. Pull repository to your local machine
3. Set your working directory to your /UCI HAR Data folder with the setwd() command and local path

Step 3. Execution
=========================================
1. Create the run_analysis.R script 
2. Run the script and create the tidy.txt file
3. Create the CodeBook.MD file
4. Save the tidy.txt, CodeBook.MD, README.txt and run_nalysis.R files to your local github repository folder.
5. Push the files to your github account

