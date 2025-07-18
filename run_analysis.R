# Merge the training and the test sets to create one data set.
X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")
X_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")
features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")
subject <- rbind(subject_train, subject_test)
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
colnames(subject) <- "Subject"
colnames(X) <- t(features[2])
colnames(y) <- "Activity"
merge_data <- cbind(X,y,subject)
# Extract only the measurements on the mean and standard deviation for each measurement. 
mean_or_std <- grep(".*Mean.*|.*Std.*", names(merge_data), ignore.case=TRUE)
cols <- c(mean_or_std, 562, 563)
data <- merge_data[,cols]
# Use descriptive activity names to name the activities in the data set
data$Activity <- as.character(data$Activity)
for (i in 1:6){
  data$Activity[data$Activity == i] <- as.character(activity_labels[i,2])
}
data$Activity <- as.factor(data$Activity)
# Appropriately label the data set with descriptive variable names. 
names(data) <- gsub("Acc", "Accelerometer", names(data))
names(data) <- gsub("Gyro", "Gyroscope", names(data))
names(data) <- gsub("BodyBody", "Body", names(data))
names(data) <- gsub("Mag", "Magnitude", names(data))
names(data) <- gsub("^t", "Time", names(data))
names(data) <- gsub("^f", "Frequency", names(data))
names(data) <- gsub("tBody", "TimeBody", names(data))
names(data) <- gsub("-mean()", "Mean", names(data), ignore.case = TRUE)
names(data) <- gsub("-std()", "STD", names(data), ignore.case = TRUE)
names(data) <- gsub("-freq()", "Frequency", names(data), ignore.case = TRUE)
names(data) <- gsub("angle", "Angle", names(data))
names(data) <- gsub("gravity", "Gravity", names(data))
# From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
data$Subject <- as.factor(data$Subject)
tidy_data <- aggregate(. ~Subject + Activity, data, mean)
tidy_data <- tidy_data[order(tidy_data$Subject,tidy_data$Activity),]
write.table(tidy_data, "tidy.txt", row.name=FALSE)
