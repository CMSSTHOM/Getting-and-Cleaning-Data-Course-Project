Code Book  
Getting and Cleaning Data Course Project 
This Code Book describes the variables, the data, and all the transformations and work that has been performed to clean up original data sets into a tidy datasets.

Original Data 
This final produced dataset (tidydata.txt) is derived from the "Human Activity Recognition Using Smartphones Data Set" made available from here:
Original data – https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Description of the original dataset – http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Downloading and loading data using the program R
Firstly the original dataset was downloaded unzipped and read into R to allow for data manipulation and transformation.
•	Downloads UCI HAR Dataset.zip file
•	Reads the activity labels to activityLabels
•	Reads the column names of data (a.k.a. features) to features
•	Reads the test data.frame to testData
•	Reads the trainning data.frame to trainningData

Script 
The next step was to design a script in R, called run_analysis.R which is to perform the desired requirements set out below.  
•	Merges the training and the test sets to create one data set.
•	Extracts only the measurements on the mean and standard deviation for each measurement.
•	Uses descriptive activity names to name the activities in the data set
•	Appropriately labels the data set with descriptive variable names.
•	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This section describes the code inside run_analysis.R script
•	Read X_train.txt, y_train.txt and subject_train.txt from the "./data/train" folder and store them in datFeaTrain, datActTrain, datSubTrain variables.
•	Read X_test.txt, y_test.txt and subject_test.txt from the "./data/test" folder and store them in datFeaTest, datActTest, datSubTest variables.
•	Concatenate datFeaTest to datActTest to generate a data frame
•	concatenate datActTest, datActTrain to generate a data frame 
•	concatenate datSubTest to datSubTrain to generate a data frame
•	Read the features.txt file from the "/data" folder and store the data in a variable called features. We only extract the measurements on the mean and standard deviation. 
•	Read the activity_labels.txt file from the "./data"" folder and store the data in a variable called activity.
•	Clean the activity names in the second column of activity.
•	Transform the values of datCombine according to the activity data frame.
•	Merges the training and the test sets to create one data set 
•	Write the cleaned Data out to "tidydata.txt" file with the average of each measurement for each activity and each subject. 







