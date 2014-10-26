CodeBook for tidy dataset
=============

Data Source
============
Downloaded from the "UCI HAR Dataset" – Human Activity Recognition Using Smartphones.
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Variables 
===========

Variable Name: Subject
Data type: integer
Values: from 1 to 30 volunteers within an age bracket of 19-48 years

Variable Name: Activity
Data type: character
Values: From 1 to 6 activity performed by the subject
 0 .WALKING
 1 .WALKING_UPSTAIRS
 2 .WALKING_DOWNSTAIRS
 3 .East North Central (Midwest region)
 4 .SITTING
 5 .STANDING
 6 .LAYING
 
66 Variables reamaining belongs to set of variables that were estimated from the accelerometer 
and gyroscope sensors on the smartphone signals, which only the mean() and std() variables were chosen: 
mean(): Mean value
std(): Standard deviation
More information: features.txt
