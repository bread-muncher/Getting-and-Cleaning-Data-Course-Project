# Variables/Data
- X_train = data from X_train.txt
- y_train = data from y_train.txt
- subject_train = data from subject_train.txt
- X_test = data from X_test.txt
- y_test = data from y_test.txt
- subject_test = data from subject_test.txt
- features = data from features.txt
- activity_labels = data from activity_labels.txt
- subject = combined subject_train and subject_test
- X = combined X_train and X_test
- y = combined y_train and y_test
- merge_data = combined X, y, subject
- mean_or_std = column indices with mean/standard deviation
- cols = columns with mean/standard deviation
- data = merge_data with columns from cols
- tidy_data = data set with average of each activity and subject
# Transformations/Work 
1. Read data from X_train.txt, y_train.txt, subject_train.txt, X_test.txt, y_test.txt, subject_test.txt, features.txt, activity_labels.txt
2. Combined train and test data for X/y/subject and assigned appropriate column names (Subject, Activity, Feature)
3. Merged X, y, subject
4. Extracted column indices, then columns with mean/standard deviation measurements from combined data set
5. Use activity_labels to label activities in mean/standard deviation only dataset
6. Replace variable names in dataset with more descriptive variables
7. Make tidy data set containing average of each variable for each activity and each subject
