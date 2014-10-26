CodeBook for tidy dataset
=============

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
 
1. **66 Variables reamaining** belongs to set of variables that were estimated from the accelerometer 
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
