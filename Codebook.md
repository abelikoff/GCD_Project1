# Codebook for the output dataset.

## Principal identification fields

* *Activity* - an activity label as per `activity_labels.txt` file
   in the _original_ dataset.

* *Subject.ID* - an ID of a subject contributing the data.


## Features

All features relate to the ones in the original dataset. Moreover, all
values are per-activity per-user averages.

### Time domain features

These features are for signals captured in time domain.


* *tBodyAcc-mean-X/Y/Z* - Mean of the body acceleration signal (3 axes).

* *tBodyAcc-std-X/Y/Z* - Standard deviation of the body acceleration
   signal (3 axes).

* *tBodyAccJerk-mean-X/Y/Z* - Mean of the body acceleration jerk (3 axes).

* *tBodyAccJerk-std-X/Y/Z* - Standard deviation of the body acceleration
   jerk (3 axes).

* *tBodyAccJerkMag-mean* - Mean of the body acceleration jerk
   magnitude (Euclidean norm).

* *tBodyAccJerkMag-std* - Standard deviation of the body acceleration
   jerk magnitude (Euclidean norm).

* *tBodyAccMag-mean* - Mean of the body acceleration signal magnitude
   (Euclidean norm).

* *tBodyAccMag-std* - Standard deviation of the body acceleration
   signal magnitude (Euclidean norm).

* *tBodyGyro-mean-X/Y/Z* - Mean of the body gyro speed signal (3 axes).

* *tBodyGyro-std-X/Y/Z* - Standard deviation of the body gyro speed
   signal (3 axes).

* *tBodyGyroJerk-mean-X/Y/Z* - Mean of the body gyro speed jerk (3 axes).

* *tBodyGyroJerk-std-X/Y/Z* - Standard deviation of the body gyro
   speed jerk (3 axes).

* *tBodyGyroJerkMag-mean* - Mean of the body gyro speed jerk magnitude
   (Euclidean norm).

* *tBodyGyroJerkMag-std* - Standard deviation of the body gyro speed
   jerk magnitude (Euclidean norm).

* *tBodyGyroMag-mean* - Mean of the body gyro speed signal magnitude
   (Euclidean norm).

* *tBodyGyroMag-std* - Standard deviation of the body gyro speed
   signal magnitude (Euclidean norm).

* *tGravityAcc-mean-X/Y/Z* - Mean of the gravity acceleration signal
   (3 axes).

* *tGravityAcc-std-X/Y/Z* - Standard deviation of the gravity
   acceleration signal (3 axes).

* *tGravityAccMag-mean* - Mean of the gravity acceleration signal
   magnitude (Euclidean norm).

* *tGravityAccMag-std* - Standard deviation of the gravity
   acceleration signal magnitude (Euclidean norm).


### Frequency domain features

These features are for signals passed through FFT.


* *fBodyAcc-mean-X/Y/Z* - Mean of the body acceleration signal (3 axes).

* *fBodyAcc-std-X/Y/Z* - Standard deviation of the body acceleration
   signal (3 axes).

* *fBodyAccJerk-mean-X/Y/Z* - Mean of the body acceleration jerk (3 axes).

* *fBodyAccJerk-std-X/Y/Z* - Standard deviation of the body acceleration
   jerk (3 axes).

* *fBodyAccJerkMag-mean* - Mean of the body acceleration jerk
   magnitude (Euclidean norm).

* *fBodyAccJerkMag-std* - Standard deviation of the body acceleration
   jerk magnitude (Euclidean norm).

* *fBodyAccMag-mean* - Mean of the body acceleration signal magnitude
   (Euclidean norm).

* *fBodyAccMag-std* - Standard deviation of the body acceleration
   signal magnitude (Euclidean norm).

* *fBodyBodyGyroJerkMag-mean* - Mean of the body gyro speed jerk magnitude
   (Euclidean norm).

* *fBodyBodyGyroJerkMag-std* - Standard deviation of the body gyro speed
   jerk magnitude (Euclidean norm).

* *fBodyBodyGyroMag-mean* - Mean of the body gyro speed signal magnitude
   (Euclidean norm).

* *fBodyBodyGyroMag-std* - Standard deviation of the body gyro speed
   signal magnitude (Euclidean norm).

* *fBodyGyro-mean-X/Y/Z* - Mean of the body gyro speed signal (3
   axes).

* *fBodyGyro-std-X/Y/Z* - Standard deviation of the body gyro speed
   signal (3 axes).
