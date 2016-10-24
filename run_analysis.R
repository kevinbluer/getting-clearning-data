
# set the path and name (update to your own local path when testing)
filePath <- "/Users/bluer/Developer/ds-getting-clearning-data/dataset/"
fileName <- "dataset.zip"
filePathAndName <- paste(filePath, fileName, sep="")

# download the dataset
if (!file.exists(filePathAndName)){
  dir.create(file.path("/Users/bluer/Developer/ds-getting-clearning-data/", "dataset"), showWarnings = FALSE)
  dataSource <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(dataSource, filePathAndName)
}

# set working directory
setwd(filePath)

# unzip the directory
unzip(fileName)

# read the activity labels and features and set the names
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")
names(activity_labels) <- c("activityId", "activityDesc")

# read the X training data and set the column name
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
names(X_train) <- features[,2]

# read the Y training dataand set the column name
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
names(y_train) <- c("activityId")

# read the subject data and set the column name
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(subject_train) <- "subjectId"

# read the X test data and set the column name
X_test<-read.table("UCI HAR Dataset/test/X_test.txt")
names(X_test) <- features[,2]

# read the Y test data and set the column name
y_test<-read.table("UCI HAR Dataset/test/y_test.txt")
names(y_test) <- c("activityId")

# read the subject test data and set the column name
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
names(subject_test) <- "subjectId"

# combine the training and test data 
training <- cbind(y_train, subject_train, X_train)
test <- cbind(y_test, subject_test, X_test)
mergedData <- rbind(training, test)

# remove anything non 'mean' or 'sd/std' related 
cols <- grepl(".*subjectId.*|.*activityId*|.*[Mm]ean.*|.*[Ss]td.*", names(mergedData))
mergedData <- mergedData[,cols]

# merge for the descriptive activity names
mergedData <- merge(activity_labels, mergedData, by.x="activityId", by.y="activityId")

# tidy the data and save the output
output <- aggregate(.~ subjectId + activityDesc, data=mergedData, mean)
write.table(output, file="tidyataset.csv", sep=",", row.names=FALSE)

