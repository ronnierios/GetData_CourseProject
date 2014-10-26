GetData_CourseProject
=====================

Course Project for Getting and Cleaning Data

The following files contains the solution for the getdata-008 course project:

* run_analysis.R script: Code to transform raw data to the tidy dataset specified in the project instructions.
* CodeBook.md: the code book for the resulting dataset, describing the variables, the data and the transformations performed to clean up the data.

Data Source
=====================
This project uses the "Human Activity Recognition Using Smartphones Dataset" downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Description 
=====================
This script is able to download the data necessary to build tidy data. After completed it will create two files in the working directory, one containing tidy dataset ready for further analysis and a second file with calculated means of all columns of each activity and subject. 

Step by step
=====================
* First require dplry package, it will try to install if does not exist
* Prepare the files needed to create tidy data
* Validate whether temp zip file is available in working directory, else download it automatically
* Load data which contains descriptive activity names like features and activities
* Filter only features that include the measurements mean or standard deviation but not for any feature
with the word 'mean' or 'std' in it. Just mean() and std() precisely, because two types of measurement required
* Prepare columns names which will be skipped due to filtering features
* Reads 'traing data (70): x,y and subject
* Set activity names and descriptive feature names to data set
* Merge and create the first part of tidy data
* Reads 'test' data (30%): x,y and subject.
* Joining test and train tidy data to create a unified data set
* Freeing memory
* Creating the first data set to file in working directory called "tidydata.txt"
* Summrize tidy data and average features by activity each subject
* Create a second data set to file in working directory called "data_avg_act_subject.txt"
* Tidy data ready for further analysis 
