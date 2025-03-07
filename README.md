Getting and Cleaning Data Project
This repository contains the R script and documentation for the Getting and Cleaning Data project. The goal of this project is to prepare a tidy dataset from the given raw data collected from smartphone accelerometers.

Dataset
The data for this project can be downloaded from the following link: UCI HAR Dataset

The dataset includes measurements of various activities performed by participants using a smartphone's built-in accelerometer and gyroscope. The raw data is split into training and test datasets.

Contents
This repository includes the following files:

run_analysis.R: An R script that processes the raw data to produce a tidy dataset.

tidy_data.txt: The output tidy dataset containing the average of each variable for each activity and each subject.

README.md: This file provides an overview of the project and instructions for replication.

CodeBook.md: Describes the variables, data, and transformations performed to create the tidy dataset.

Steps in the Analysis
The run_analysis.R script performs the following steps:

Merge the training and test datasets: Combines the training and test sets to create one unified dataset.

Extract only mean and standard deviation measurements: Selects only the columns with measurements related to the mean and standard deviation.

Use descriptive activity names: Assigns descriptive activity names to the activities in the dataset, using the activity_labels.txt file.

Label the dataset with descriptive variable names: Renames the variables to make them more descriptive and easier to understand.

Create a second, independent tidy dataset: Creates a new dataset with the average of each variable for each activity and each subject.

How to Run the Script
Download the dataset from the link above and extract it into your working directory.

Place the run_analysis.R script in your working directory.

Run the script in R using the following command:

R
source("run_analysis.R")
The script will produce a tidy dataset named tidy_data.txt in your working directory.

Output
The output tidy dataset, tidy_data.txt, contains:

Averages of the mean and standard deviation measurements.

Organized by each activity and each subject.

Dependencies
The run_analysis.R script requires the following R package:

dplyr: Used for data manipulation.

Install it by running:
R
install.packages("dplyr")


License
This project is based on data from the UCI Machine Learning Repository. The data is licensed for use in academic and research contexts.
