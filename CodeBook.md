CodeBook for tidy dataset
=============

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

Check the `README.txt` file for further details about main dataset

Data Source
============
Downloaded from the "UCI HAR Dataset" – Human Activity Recognition Using Smartphones.
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Variables 
===========
 - **Variable Name 1:** Subject
 - **Data type:** integer
 - **Values:** from 1 to 30 volunteers within an age bracket of 19-48 years

 - **Variable Name 2:** Activity
 - **Data type:** character
 - **Values:** From 1 to 6 activity performed by the subject
 - **Examples:** - WALKING - WALKING_UPSTAIRS 2 - WALKING_DOWNSTAIRS 3 - SITTING 4 - STANDING 5 - LAYING 6
 
 - **66 Variables reamaining** belongs to set of variables that were estimated from the accelerometer 
and gyroscope sensors on the smartphone signals, which only the mean() and std() variables were chosen: 
mean(): Mean value
std(): Standard deviation
More information: `features.txt`

Transformation
==============
After extracting train and test dataset from files, they were combined for create a unified dataset.

Only Measurements were extracted for mean, standard deviation for each measurement.

Activity and features vairiables were set with descriptive names.

The tidy dataset generated is located in your current working directory called `tidydata.txt`
