#------------------------------------------------------------------
# Script to merge the training and test data sets from Version 1.0
# of the Human Activity Recognition Using Smartphones Dataset from:
# Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
# Smartlab - Non Linear Complex Systems Laboratory
# DITEN - Università degli Studi di Genova.
#------------------------------------------------------------------
# Extracts measurements on the mean and standard deviation
# for each measurement, then creates a second, independent 
# data set with the average of each variable for each
# activity and subject.
#------------------------------------------------------------------

# Create an empty directory named "data"
if (!file.exists("./data")){dir.create("./data")}

# Download the UCI HAR Dataset
fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile = "./data/dataset.zip")

# Extract UCI HAR Dataset to the data subdirectory
unzip("./data/dataset.zip",exdir = "./data")

# Set current working directory
setwd("./data/UCI HAR Dataset")

# Create dataframe for merging the test and training
# data sets
HAR <- data.frame()

# Merge the subject data.  This will create 1 column with
# 10,299 rows.
subject_test <- read.table("./test/subject_test.txt", header = F)
subject_train <- read.table("./train/subject_train.txt", header = F)
HAR <- rbind(HAR,subject_test)
HAR <- rbind(HAR[1],subject_train)

# Set the colname for subject data
colnames(HAR) <- "subject"

# Remove temporary variables
rm(subject_test,subject_train)

# Merge the X test and training data.  This will
# add the 561 columns containing X test measurements
# to the data set for a total of 10,299 rows and
# 562 columns in the resulting data set.
x_test <- read.table("./test/X_test.txt", header = F)
x_train <- read.table("./train/X_train.txt", header = F)
x <- rbind(x_test,x_train)

# Obtain column names for X test data from 
# features.txt file
features <- read.table("features.txt")

# Set the correct column names for X test data
colnames(x) <- c(levels(features$V2)[features$V2])

# Bind the X test variables to the data set
HAR <- cbind(HAR,x)

# Remove temporary variables
rm(features, x, x_test, x_train)

# Merge the Y test and training data.  This will
# add one additional row to the data set containing
# descriptive activity names.  This will result 
# in 10,299 rows and 563 columns in the resulting
# data set.
y_test <- read.table("./test/y_test.txt")
y_train <- read.table("./train/y_train.txt")
y <- rbind(y_test,y_train)

# Import the activity descriptions for the
# Y test data.
activity <- read.table("activity_labels.txt")

# Join the Y test data with descriptive names
# from activity labels.
library(plyr)
y <- join(y,activity)

# Set column names for the merged Y test data.
colnames(y) <- c("activity_code","activity")

# Bind the descriptive Y test data names to
# the data set.
HAR <- cbind(HAR,"activity" = y$activity)

# Remove temporary variables
remove(activity, y, y_test, y_train)

# Collect names for the HAR table columns and 
# extract indices for the column names containing
# mean and standard deviation calculations for
# each measurment.  There are 33 mean calculations and
# 33 standard deviation calculations for a total 
# of 66 measurement columns to be extracted from the 
# data set.
meas_name <- names(HAR)
mean_col <- grep("mean()",meas_name, fixed = T)
sd_col <- grep("std()", meas_name, fixed = T)

# Combine the indices of the columns containing
# mean and standard deviation calculations and 
# sort them.
mean_sd_col <- c(mean_col,sd_col)
mean_sd_col <- sort(mean_sd_col)

# Remove temporary variables
rm(meas_name, mean_col, sd_col)

# Add the 2 category columns, column 1 (subject)
# and column 563 (activity), to the mean 
# and standard deviation columns (66), then 
# subset the original data set by these
# columns. This reduces the total columns
# in the data set to 68. There are still
# 10,299 rows in the data set.
cat_mean_sd <- c(1,563,mean_sd_col)
HAR <- HAR[,cat_mean_sd]

# Remove temporary variables
rm(mean_sd_col, cat_mean_sd)

# Create second, independent data set named HAR_AVG with 
# the average of each variable for each activity and each 
# subject.  Use the reshape2 package to group the rows by 
# subject and activity.  

library(reshape2)

# Obtain a vector of the measurement variables' names 
measName <- colnames(HAR[,3:68])

# Melt the data set, separating the ID variables from 
# the measure variables.
hamelt <- melt(HAR,id.vars = c(1:2), measure.vars = 3:68)

# Use the dcast function to group the data set by subject
# and activity.  Take the average/mean of all the measurement
# variables.  This reduces the data set to 180 rows and 68
# columns.
HAR_AVG <- dcast(hamelt, subject + activity ~ c(measName), mean)

# Remove temporary variables
rm(measName, hamelt)

# Write second data set to a text file. 
write.table(HAR_AVG, file = "HAR_AVG", row.names = F)



