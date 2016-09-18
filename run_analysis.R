# 1. Merges the training and the test sets to create one data set

# create an empty dataframe based on the features (features.txt)

# loading the headers
m <- matrix(0, ncol = 561, nrow = 0)
df <- data.frame(m, check.names = TRUE, stringsAsFactors=FALSE)

# don't include (or remove) if it doesn't have mean or standard deviation in the name

features="/Users/bluer/Developer/ds-getting-clearning-data/uci-har-dataset/features.txt"
data = scan(features, sep="\n", what="string")

colnames(df) = data

# loading the headers
m <- matrix(0, ncol = 561, nrow = 0)
df <- data.frame(m, check.names = TRUE, stringsAsFactors=FALSE)

# don't include (or remove) if it doesn't have mean or standard deviation in the name

features="/Users/bluer/Developer/ds-getting-clearning-data/uci-har-dataset/features.txt"
data = scan(features, sep="\n", what="string")

colnames(df) = data

# load the training and test data sets (note that the n = 5 was used to speed up loading during development)

xTestFile="/Users/bluer/Developer/ds-getting-clearning-data/uci-har-dataset/test/X_test.txt"
xTest <- readLines(xTestFile)

xTrainFile="/Users/bluer/Developer/ds-getting-clearning-data/uci-har-dataset/train/X_train.txt"
xTrain <- readLines(xTrainFile)

# 'merges' (or more specifically appends) the corresponding files
signals <- c(xTest, xTrain)

# loops through the character vector
for (i in signals) {
  
  # splits out each row (explicitly taking into account occasions where there is more than one space)
  z <- strsplit(trimws(i), "\\s+")
  
  # unlist and convert to numerics
  v <- as.numeric(unlist(z))
  
  # add a new row to the dataframe
  df[nrow(df)+1,] <- v
  
}

# read line-by-line (given the data is not csv, tsv, etc)
yTestFile="/Users/bluer/Developer/ds-getting-clearning-data/uci-har-dataset/test/y_test.txt"
yTest <- readLines(yTestFile)

yTrainFile="/Users/bluer/Developer/ds-getting-clearning-data/uci-har-dataset/train/y_train.txt"
yTrain <- readLines(yTrainFile)

# 'merges' (or more specifically appends) the corresponding files
y <- c(yTest, yTrain)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

drops <- vector(mode="character")

# drop everything that doesn't contain a reference to mean ("mean") or standard deviation ("std") 
for (i in names(df)) {
  if (!length(x <- grep("mean", i)) && !length(y <- grep("std", i)))
    drops <- c(drops, i) 
}

df <- df[ , !(names(df) %in% drops)]

# TODO - consider spliting out the activities into separate files

# 3. Uses descriptive activity names to name the activities in the data set

# NOTE - Activities not included

# 4. Appropriately labels the data set with descriptive variable names.

# NOTE - The data frame has descriptive labels (as used in the features.txt). See saved version for examples

# Saving out the data frame to CSV

write.table(df, file = "/Users/bluer/Developer/ds-getting-clearning-data/features.csv", sep = ",", col.names=NA)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Note - Ran out of time for this task :)