######### Read in data #########

# set your working directory
#setwd("G:/Coursera/Getting\ and\ Cleaning\ Data/CourseProject/UCI_HAR_Dataset")

testy <- read.table("test/y_test.txt")
tests <- read.table("test/subject_test.txt")
trainy <- read.table("train/y_train.txt")
trains <- read.table("train/subject_train.txt")
train <- read.table("train/X_train.txt")
test <- read.table("test/X_test.txt")


features <- read.table("features.txt")
names(train) <- features[,2]
names(test) <- features[,2]


####### Choosing column of mean and std data only ######
index <- grep("mean|std", features[,2])
train <- train[,index]
test <- test[,index]

###### Merging train and test data set #######
data <- rbind(train,test)

# Column with name "meanFreq" is not the mean value needed in this project 
index <- grep("meanFreq", names(data))
data <- data[,-index]

###### Label the activity of each observation ##############
activity <- read.table("activity_labels.txt")
act <- as.matrix(rbind(trainy, testy))
act <- as.integer(act)
data$activity <- activity[act,2]

###### Label the subject of each observation #############
data$subject <- as.matrix(rbind(trains, tests))

###### Add descriptive names to the variables ###########
feature_name <- names(data)

feature_name <- sub("Acc", ".Acceleration.", feature_name)
feature_name <- sub("-mean\\(\\)", "Mean.Value.", feature_name)
feature_name <- sub("-std\\(\\)", "Standard.Deviation.", feature_name)
feature_name <- sub("Mag", ".Magnitude.", feature_name)
feature_name <- sub("Gyro", ".Gyroscope.", feature_name)
feature_name <- sub("Jerk", ".Jerk.", feature_name)
feature_name <- sub("-X", "in.X.Direction", feature_name)
feature_name <- sub("-Y", "in.Y.Direction", feature_name)
feature_name <- sub("-Z", "in.Z.Direction", feature_name)

# wrong name
feature_name <- sub("BodyBody", "Body", feature_name)

# adjusting "." between words
feature_name <- sub("\\.$", "", feature_name)
feature_name <- gsub("\\.\\.", "\\.", feature_name)

# Translate some information from description file
feature_name <- sub("^t", "Time.Signal.", feature_name)
feature_name <- sub("^f", "Frequency.Signal.", feature_name)
feature_name <- sub("Body.Acceleration.Jerk", "Linear.Acceleration", feature_name )
feature_name <- sub("Body.Acceleration", "Accelerometer.Raw.Data", feature_name )
feature_name <- sub("Body.Gyroscope.Jerk","Angular.Velocity", feature_name)
feature_name <- sub("Body.Gyroscope", "Gyroscope.Raw.Data", feature_name)

#the following line is only used for debugging
#feature_name
names(data) <- feature_name


##### write the tidy data set into a file #######
write.table(data, file = "tidy_data.txt", sep = " \t", row.names = FALSE)