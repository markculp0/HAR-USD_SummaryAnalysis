==================================================================

## Summary Analysis of the Human Activity Recognition 
## Using Smartphones Dataset (HAR-USD)

Mark Culp - Coursera Student 
markculp0@gmail.com

==================================================================
The original experiment summarized in this analysis file was carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.  Using the smartphone's embedded accelerometer and gyroscope, the study captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.  The original dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.  Those two sets of measurements were combined in this current analysis and used to prepare the summary data.

The original experiment was conducted in November 2012 by Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita.  More information on this study can be found at the following website: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

==================================================================
### This dataset includes the following files:
=============================================

* 'README.txt'

* 'HAR_AVG.txt' :  Summary analysis containing averages of each of the 66 mean and standard deviation measurements taken under the original study.

* 'run_analysis.R' :  The R script used to execute the transformations necessary to produce the summary annalysis.

* 'CodeBook.md' :  Update to the code books used in the original study describing how all the variables and summaries were calculated.  

==================================================================
### Notes: 
==========
- All features were normalized and bounded within [-1,1].
- Each feature vector is summarized by subject and activity with a single row in the 'HAR_AVG.txt' text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Any use of the original dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

