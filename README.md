# Getting-and-Cleaning-Data-Course-Project
Getting and Cleaning Data Course Project

This document describes the code inside run_analysis.R I have remarked the code breaking it into sections that correspond to the assignment tasks outlined in the assignment instructions for “Getting and Cleaning Data Course Project”

#Raw Data
The raw data was downloaded as a zip file from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
A detailed description of the data can be found at
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The data files extracted from the downloaded file (UCI HAR Dataset.zip) were saved into the following folder structure. This folder structure was decided on after reading the accompanied README.txt file.

 GCD_Assignment/activity_labels.txt   
 GCD_Assignment/features_info.txt                           
 GCD_Assignment/features.txt                                
 GCD_Assignment/README.txt                                  
 GCD_Assignment/test/Inertial Signals/body_acc_x_test.txt   
 GCD_Assignment/test/Inertial Signals/body_acc_y_test.txt   
 GCD_Assignment/test/Inertial Signals/body_acc_z_test.txt   
 GCD_Assignment/test/Inertial Signals/body_gyro_x_test.txt  
 GCD_Assignment/test/Inertial Signals/body_gyro_y_test.txt  
 GCD_Assignment/test/Inertial Signals/body_gyro_z_test.txt  
 GCD_Assignment/test/Inertial Signals/total_acc_x_test.txt  
 GCD_Assignment/test/Inertial Signals/total_acc_y_test.txt  
 GCD_Assignment/test/Inertial Signals/total_acc_z_test.txt  
 GCD_Assignment/test/subject_test.txt                       
 GCD_Assignment/test/X_test.txt                             
 GCD_Assignment/test/y_test.txt                             
 GCD_Assignment/train/Inertial Signals/body_acc_x_train.txt 
 GCD_Assignment/train/Inertial Signals/body_acc_y_train.txt 
 GCD_Assignment/train/Inertial Signals/body_acc_z_train.txt 
 GCD_Assignment/train/Inertial Signals/body_gyro_x_train.txt
 GCD_Assignment/train/Inertial Signals/body_gyro_y_train.txt
 GCD_Assignment/train/Inertial Signals/body_gyro_z_train.txt
 GCD_Assignment/train/Inertial Signals/total_acc_x_train.txt
 GCD_Assignment/train/Inertial Signals/total_acc_y_train.txt
 GCD_Assignment/train/Inertial Signals/total_acc_z_train.txt
 GCD_Assignment/train/subject_train.txt                     
 GCD_Assignment/train/X_train.txt                           
 GCD_Assignment/train/y_train.txt

#File definitions
*	The following data has been provided for each record.
*	Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
*	Triaxial Angular velocity from the gyroscope. 
*	A 561-feature vector with time and frequency domain variables. 
*	Its activity label. 
*	An identifier of the subject who carried out the experiment.

Filename 	                                      Description
README.txt	 
features_info.txt	                              Shows information about the variables used on the feature vector.
features.txt	                                  List of all features.
activity_labels.txt	                            Links the class labels with their activity name.
train/X_train.txt	                              Training set.
train/y_train.txt	                              Training labels.
test/X_test.txt	                                Test set.
test/y_test.txt	                                Test labels.
train/subject_train.txt	                        Each row identifies the subject who performed the activity for each window sample. 
                                                Its range is from 1 to 30. 
train/Inertial Signals/total_acc_x_train.txt	  The acceleration signal from the smartphone accelerometer X axis in standard gravity                                                  units 'g'. Every row shows a 128 element vector. The same description applies for the                                                 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
train/Inertial Signals/body_acc_x_train.txt	    The body acceleration signal obtained by subtracting the gravity from the total                                                       acceleration. 
train/Inertial Signals/body_gyro_x_train.txt	  The angular velocity vector measured by the gyroscope for each window sample. The                                                     units are radians/second.

#Transforming the data
*	Create tables from raw data files.
      o	Reads in each file one at a time using read.table to create a data.table that represents each file.
*	Merges the training and the test sets to create one data set.
      o	Uses rbind to combine the test and trainining files for each of activity, subject and features. 
      o	Add the variable names to the merged tables to prepare them for merging into one full data.table
      o	Merge all data frames into AllData
*	Extracts only the measurements on the mean and standard deviation for each measurement.
      o	Takes a subset of measurements defined by RequiredFeatureNames
*	Uses descriptive activity names to name the activities in the data set.
      o	Loops through each value in ActivityLabels$V1 and replaces the corresponding value in AllData$Activities with the value in            ActivityLabels$V2
*	Appropriately labels the data set with descriptive variable names.
      o	Substitutes a more descriptive labels for each of the abbreviated labels in AllData 
*	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and      each subject.
      o	Using aggregate it averages the data over each grouping
*	Write tidy data to file.

#TidyData





Writing the TidyData data.table to CSV
Write.Table was utilized to write the TidyData data.table to a csv file in the working directory.
