
#Code Book
This document describes the variables used in the run_analysis.R submitted for the “Getting and Cleaning Data Course Project”. I have included the file definitions here as well just to add clarity to the reading of the variables.

#File Definitions
*	The following data has been provided for each record.
*	Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
*	Triaxial Angular velocity from the gyroscope. 
*	A 561-feature vector with time and frequency domain variables. 
*	Its activity label. 
*	An identifier of the subject who carried out the experiment.

| Filename                                     | Description                                                                                                                                                                                                                                                |
|----------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| README.txt                                   |                                                                                                                                                                                                                                                            |
| features_info.txt                            | Shows information about the variables used on the feature vector.                                                                                                                                                                                          |
| features.txt                                 | List of all features.                                                                                                                                                                                                                                      |
| activity_labels.txt                          | Links the class labels with their activity name.                                                                                                                                                                                                           |
| train/X_train.txt                            | Training set.                                                                                                                                                                                                                                              |
| train/y_train.txt                            | Training labels.                                                                                                                                                                                                                                           |
| test/X_test.txt                              | Test set.                                                                                                                                                                                                                                                  |
| test/y_test.txt                              | Test labels.                                                                                                                                                                                                                                               |
| train/subject_train.txt                      | Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.                                                                                                                                              |
| train/Inertial Signals/total_acc_x_train.txt | The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. |
| train/Inertial Signals/body_acc_x_train.txt  | The body acceleration signal obtained by subtracting the gravity from the total acceleration.                                                                                                                                                              |
| train/Inertial Signals/body_gyro_x_train.txt | The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.                                                                                                                                                |
#Variables
| Variable              | Type       | Contains/Purpose                                                                                 |
|-----------------------|------------|--------------------------------------------------------------------------------------------------|
| ActivityLabels        | data.table | file "activity_labels.txt"                                                                       |
| ActivityTest          | data.table | file "y_test.txt"                                                                                |
| ActivityTrain         | data.table | file "y_train.txt"                                                                               |
| AllActivities         | data.table | combined DataTables ActivityTest and ActivityTrain                                               |
| AllCombined           | data.table | combined AllSubjects and AllActivities                                                           |
| AllData               | data.table | the total data required to create the final tidy data set. Combined AllCombined and AllFeatures. |
| AllFeatures           | data.table | combined DataTables FeatureTest and FeatureTrain                                                 |
| AllSubjects           | data.table | combined DataTables SubjectTest and SubjectTrain                                                 |
| FeatureNames          | data.table | file "features.txt"                                                                              |
| FeatureTest           | data.table | file "X_test.txt"                                                                                |
| FeatureTrain          | data.table | file "X_train.txt"                                                                               |
| i                     | integer    | counter to loop through each activity lable to replace values in AllData                         |
| RequiredFeaturesNames | factor     | only the required features of standard deviation and mean                                        |
| rootPath              | character  | root folder for assignment relative to the working directory                                     |
| selectedNames         | character  | RequiredFeatureNames plus Subject and Activity                                                   |
| SubjectTest           | data.table | file "Subject_test.txt"                                                                          |
| SubjectTrain          | data.table | file "Subject_train.txt"                                                                         |
| TidyData              | data.table | derived from AllData containing the average of each variable for each activity and each subject. |

