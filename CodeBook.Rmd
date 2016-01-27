#Install library's if not already installed
##install.packages("pylr")
##install.packages("reshape2")
##install.packages("rmarkdown")
##install.packages("knitr")

#1. Load required library's
library(plyr)
library(reshape2)
library(rmarkdown)
library(knitr)

#2. Obtain required data
if(!file.exists("C:/Users/Richard/Desktop")){dir.create("C:/Users/Richard/Desktop")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="C:/Users/Richard/Desktop/Dataset.zip",method="curl")

#3. Unpackage the files
unzip(zipfile="C:/Users/Richard/Desktop.zip",exdir="C:/Users/Richard/Desktop")

#4. Set the working directory
setwd("C:/Users/Richard/Desktop/UCI HAR Dataset")

#5. Load activity labels and features
activityLabels <- read.table("C:/Users/Richard/Desktop/UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])
features <- read.table("C:/Users/Richard/Desktop/UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

#6. Obtain mean and standard deviation
featuresWanted <- grep(".*mean.*|.*std.*", features[,2])
featuresWanted.names <- features[featuresWanted,2]
featuresWanted.names = gsub('-mean', 'Mean', featuresWanted.names)
featuresWanted.names = gsub('-std', 'Std', featuresWanted.names)
featuresWanted.names <- gsub('[-()]', '', featuresWanted.names)

#7. Load datasets
train <- read.table("C:/Users/Richard/Desktop/UCI HAR Dataset/train/X_train.txt")[featuresWanted]
trainActivities <- read.table("C:/Users/Richard/Desktop/UCI HAR Dataset/train/Y_train.txt")
trainSubjects <- read.table("C:/Users/Richard/Desktop/UCI HAR Dataset/train/subject_train.txt")
train <- cbind(trainSubjects, trainActivities, train)

test <- read.table("C:/Users/Richard/Desktop/UCI HAR Dataset/test/X_test.txt")[featuresWanted]
testActivities <- read.table("C:/Users/Richard/Desktop/UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("C:/Users/Richard/Desktop/UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testSubjects, testActivities, test)

#8. Merge datasets
allData <- rbind(train, test)
colnames(allData) <- c("subject", "activity", featuresWanted.names)

#9. Create factors for activities and subjects
allData$activity <- factor(allData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
allData$subject <- as.factor(allData$subject)

allData.melted <- melt(allData, id = c("subject", "activity"))
allData.mean <- dcast(allData.melted, subject + activity ~ variable, mean)

#10. Create the tidy data text file
write.table(allData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)

#11. Create the codebook.md
##Click File > New File > R Markdown