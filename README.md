==================================================================
# Getting-and-cleaning-data - using Dataset of Human Activity Recognition Using Smartphones [1]
==================================================================
Sebastian Medina ns.medina10@uniandes.edu.co
==================================================================
this project try to get tidy data of one experiment made by the Smartlab - Non Linear Complex Systems Laboratory of Università degli Studi di Genova. this is a short explanation of the experiment: "The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data" 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
==================================================================
how the script works

the run_analysis scritp takes the original data of the experiment (available here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) you have to unzip the file in the same path that the Script. 

the script are divided in 5 parts

#1 load the test dataset and the train data set, then this datasets are combined. 
#2 load the deatures names, create an index with the variables who beggin with mean or std. the mean standard deviation variables are extracted of the tydi data outpout in #1
#3 load the activities an his respective id. convert the activities to character. load the activities id of train and test dataset, then this are combined in a vector called act_test_train. finally, a For function, find for each activity their id on the vector act_test_train creating a index vector, then according to that index put the names of each varible in a new column of the dataset called activities.
#4 Assign the variables names to each one of the columns in the sata set. the file tidydata.txt is generated.
#5 create a new dataset with the average of each variable for each subject and each activity. the file tidydata2.txt is generated.


==================================================================
License:
========
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
