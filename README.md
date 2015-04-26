This script should be run from the root folder for the UCI HAR Dataset

The dataset is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
and then extracted. The root extracted folder will contain several files and two subdirectories called "test" and "train."

The working directory in R should therefore be set to the the root extracted folder such that "test" and "train" appear as subdirectories of the working directory.

The script will extract only the 86 mean and standard deviation of measurements as they have been record in the files "test\x_test.txt" and "train\x_train.txt"
The script will group the data by subject and activity and calculate the mean for each of the 86 measurements per subject per activity.
The script will replace normal id codes for the activities with their more "friendly" names as defined in "activity_labels.txt"
The script will store its results in a table named "summary_data"
