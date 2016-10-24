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

- Firstly, I detect if the data exists and if not it's downloaded from the provided url and unzipped 
- I then began by reading reading all the training and test data (via `read.table`) and naming the columns as appropriate
- The training and test data is then merged via `rbind`
- I then subsequently removed everything that wasn't referencing the mean ("mean") or standard deviation ("sd/std")
- This is then tidied and written out via `write.table`