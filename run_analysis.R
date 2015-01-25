#!/usr/bin/Rscript

rm(list=ls())
library(reshape2)

saved.data.file <- "saved_data.Rd"         # savefile for entire dataset


## load and merge features, subject IDs and activity IDs for train or test data

loadDataset <- function(feature.name.file, features.file, subject.id.file,
                        label.id.file) {
    feature.names <- read.table(feature.name.file)
    data <- read.table(features.file)
    colnames(data) <- feature.names$V2

    ## leave only mean and std features
    data <- subset(data, select = grepl("-(mean|std)\\(\\)", names(data)))
    subjects <- read.table(subject.id.file)
    labels <- read.table(label.id.file)
    new.names <- c("Subject.ID", colnames(data), "Activity.ID")
    data <- data.frame(subjects, data, labels)
    colnames(data) <- new.names
    return(data)
}


## download data if needed

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
local.file <- "dataset.zip"
data.dir <- "UCI HAR Dataset"

if (!file.exists(data.dir)) {
    message("Downloading data")
    download.file(url, local.file, method="curl")
    unzip(local.file)
    file.remove(local.file)
}

if (!file.exists(saved.data.file)) {
    message("Loading test data")
    test.data <- loadDataset(paste(data.dir, "/features.txt", sep=""),
                             paste(data.dir, "/test/X_test.txt", sep=""),
                             paste(data.dir, "/test/subject_test.txt", sep=""),
                             paste(data.dir, "/test/y_test.txt", sep=""))

    message("Loading training data")
    train.data <- loadDataset(paste(data.dir, "/features.txt", sep=""),
                              paste(data.dir, "/train/X_train.txt", sep=""),
                              paste(data.dir, "/train/subject_train.txt", sep=""),
                              paste(data.dir, "/train/y_train.txt", sep=""))

    all.data <- rbind(train.data, test.data)
    rm(list=c("train.data", "test.data"))

    ## replace activity ID with activity label

    activity.labels <- read.table(paste(data.dir, "/activity_labels.txt", sep=""))
    colnames(activity.labels) <- c("Activity.ID", "Activity")
    all.data <- merge(all.data, activity.labels)
    all.data$Activity.ID <- NULL
    save(all.data, file=saved.data.file)
} else {
    load(saved.data.file)
}


## aggregate by calculating per-activity, per-subject means

data.melt = melt(all.data, id=c("Activity", "Subject.ID"))
data.means <- dcast(data.melt, Activity + Subject.ID ~ variable, mean)


## validate the calculation by comparing to manually calculated ones

test.activity <- "WALKING"
test.subject <- 7

x1 <- all.data[(all.data$Activity == test.activity &
                all.data$Subject.ID == test.subject),]
x1$Activity <- NULL
x1$Subject.ID <- NULL
x1 = colMeans(x1)

x2 <- data.means[(data.means$Activity == test.activity &
                  data.means$Subject.ID == test.subject),]
x2$Activity <- NULL
x2$Subject.ID <- NULL

discrep <- sqrt(sum((x2 - x1)^2))

if (discrep > 1e-8) {                   # somewhat arbitrary tolerance
    stop(sprintf("ERROR: calculation mismatch for subject %d, activity %s\n",
                 test.subject, test.activity))
}


## save tidy data set

colnames(data.means) <- sub("\\(\\)", "", colnames(data.means))
write.table(data.means, file="tidy.txt", row.names=FALSE)
