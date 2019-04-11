
Data Dictionary
=======

Description of data, variables, and transformation made to get this dataset.

## I. Data
### 1. Objectives:
This dataset (step.txt) was to complete the Coursera Course Getting and Cleaning Data Assignment.

### 2. Raw data source:

 [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### 3. Raw data description

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

### 4. Components of raw data used as input for run_analysis.R to get step5.txt

- **subject_test.txt**       An identifier of the subject who carried out the experiment. (30 subjects in total)
- **activity_labels.txt**    Links the class labels with their activity name.(6 activities)
- **x_train.txt**                 A 561-feature vector with time and frequency domain variables. (21 sujects in the training set)
- **y_test.txt**                  A 561-feature vector with time and frequency domain variables. (9 subjects in the test set)
- **features.txt**              All 561 features names

## II. Variables 
### Variables in step5.txt
|Number     |Variable Name   	        |Type   	|Levels   	|Value   	        |Description|
|---        |---	                    |---	    |---    	|---	            |---
|1          |SubjectId      	        |Integer   	|   	    |1 to 30   	        |The subject ID of 30 people|
|2          |Activity          	        |Factor   	|1   	    |WALKING   	        |The type of activity
|           |               	        |   	    |2   	    |WALKING_UPSTAIRS   |
|           |   	                    |          	|3   	    |WALKING_DOWNSTAIRS |
|           |               	        |   	    |4   	    |SITTING   	        |
|           |   	                    |       	|5  	    |STANDING           |
|           |               	        |   	    |6  	    |LAYING             |
|3          |tBodyAcc.mean.X            |Number     |NA         |[-1, 1]            |The average of the feature tBodyAcc.mean.X by person-activity|
|4          |tBodyAcc.mean.Y            |Number     |NA         |[-1, 1]            |The average of the feature tBodyAcc.mean.Y by person-activity|
|5 to 179   |...                    	|Number     |NA   	    |[-1, 1]   	        |...|
|180        |fBodyBodyGyroJerkMag.mean  |Number     |NA   	    |[-1, 1]   	        |The average of the featurefBodyBodyGyroJerkMag.mean by person-activity|
|181        |fBodyBodyGyroJerkMag.std   |Number     |NA   	    |[-1, 1]   	        |The average of the feature fBodyBodyGyroJerkMag.std by person-activity|


## III. Transformation
Data trasformation made to create the output data included:

 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement.
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names.
 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.