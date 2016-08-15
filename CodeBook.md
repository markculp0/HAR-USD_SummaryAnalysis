==================================================================

##  CodeBook for the Summary Analysis of the Human Activity 
##  Recognition Using Smartphones Dataset (HAR-USD)

Mark Culp - Coursera Student 
markculp0@gmail.com

==================================================================
## Data Collection Description:
Summary Analysis of the Human Activity Recognition Using Smartphones Dataset (HAR-USD) study conducted by Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, and Davide Anguita in November 2012.  The purpose of this analysis was to provide summary data on the original HAR-USD study.  The summary includes averages of the 66 mean and standard deviation calculations prepared under the original study grouped by each of the 30 participants in the study and each activity measured.  There were 6 activities under which measurements were collected for each participant: walking, walking upstairs, walking downstairs, sitting, standing and laying.  Measurements in all of these activities were taken for every participant.    

Transformations of the original data set are detailed in the accompanying R script file named 'run_analysis.R' included with this data set.  10,299 measurements were taken of 561 different attributes collected in the original study.  This data set was partitioned in the original study but recombined for purposes of this analysis.  33 mean and 33 standard deviation measurements of the following variables were then extracted from the original data set:

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag 

As describe in the orignal 'features_info.txt' file accompanying the original study, the features selected for this database came from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  '-XYZ' was used to denote 3-axial signals in the X, Y and Z directions.  The mean(): Mean value and std(): Standard deviation suffixes are attached to each variable estimated from the signals.

These measurements were grouped by study participant and activity, and a standard mean calculations was then applied to each of the measurements for each participant and activity.  The R 'reshape2' package was used to group the data and calculate the average of the means and standard deviations.  The analysis was performed using a 64-bit version of R Version 3.2.1, RStudio Version 0.99.447, the 'reshape2' package Version 1.4.1, and a computer running the Microsoft Windows 10 Operating system.

## Current Summary DataSet:

* Data Set Characteristics:  Multivariate, Time-Series
* Number of Instances:  35
* Number of Attributes:  68
* Missing Values?  n/a
* Date Prepared:  2016-08-14

## Original DataSet: 

* Data Set Characteristics:  Multivariate, Time-Series
* Number of Instances:  10299
* Number of Attributes:  561
* Missing Values?  n/a
* Date Donated: 2012-12-10

### Source:

Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws

### Original Data Set Information:

The original experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the study's authors captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video-recorded to label the data manually. The obtained dataset was then randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity.  The gravitational force was assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain

