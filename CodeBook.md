CodeBook for tidy dataset
=============

Data Source
============
Downloaded from the "UCI HAR Dataset" – Human Activity Recognition Using Smartphones.
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Variables 
===========
1. **Variable Name:** Subject
2. **Data type:** integer
3. **Values:** from 1 to 30 volunteers within an age bracket of 19-48 years.
--------

1. **Variable Name:** Activity
2. **Data type:** character
3. **Values:** From 1 to 6 activity performed by the subject
4. **Examples:** - WALKING - WALKING_UPSTAIRS 2 - WALKING_DOWNSTAIRS 3 - SITTING 4 - STANDING 5 - LAYING 6
---------
 
1. **66 Variables reamaining** belongs to set of variables that were estimated from the accelerometer 
and gyroscope sensors on the smartphone signals, which only the mean() and std() variables were chosen: 
mean(): Mean value
std(): Standard deviation
More information: `features.txt`
-------------------

Transformation
===========
After extracting train and test dataset from files, they were combined for create a unified dataset.

Only Measurements were extracted for mean, standard deviation for each measurement.
