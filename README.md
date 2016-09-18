# Getting and Cleaning Data Course Project

### Number of entries

For reference only...

- Training Data (train) - 7352 entries
- Test Data (test) - 2947 entries
- Total - 10299

### Interpretation

- In `X_test.txt` and `X_train.txt`, each line contains 561 entries which correspond to the features in `features.txt`.
- Similar, `y_test.txt` and `y_train.txt`, contain a reference to the corresponding activity type in `activity_labels.txt`.
- Finally, subject_test.txt and subject_train.txt represent the subject (individual) responsible for the data.

### Steps

- I began by using `features.txt` to create the column headings into an empty data frame
- Following this, I loaded the training and test data sets (note that the n = 5 was used to speed up loading during development)
- These were then combined into a single character vector
- I then looped through each item in the vector (not sure if this is the most efficient way to do it, in fact I'm sure it's not)
- Upon each iteration I split the individual record add added it to the data frame as an individual row
- I then subsequently removed everything that wasn't referencing the mean ("mean") or standard deviation ("std")
- Lastly, this was then written out as a CSV using `write.table`

```
Note that for reference the data table is written out as features.csv in the root of this project (and contains 79 variables and 10,299 observations respectively)
```