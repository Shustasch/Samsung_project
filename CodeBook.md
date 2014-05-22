## CODEBOOK
========================================================
The codebook for the primary row data you can find in [this .zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The file name is _features_info.txt_.

This codebook is for the variables from the primary dataset, which were used for the final tidy data set and are measurements of the mean and standard deviation. The variable with label "_meanFreq_" are not really measurements of the mean, so these variables were not included in final tidy dataset. 

The names of the variables from the primary dataset were change insignificantly for easy analysis. All capital letters were _lowered_, the brackets _"()"_ were _deleted_, all overscore were change in the _dots_. 

### Data dictionary

This dataset contain 68 variables: **_subject_**, **_activity_** and 66 **_features_**.

* The variable **_subject_** is id of the subjects, it takes the value from 1 to 30.

* The variable **_activity_** is the activity of the subjects, it is factor variable an takes the folowing values:
  * walking
  * walking_upstairs
  * walking_downstairs
  * sitting
  * standing
  * laying

All the next variables are the **_features_** and have label either _mean_ or _std_, which mean the measurements of the mean value and standard deviation. Also some variable have prefix _t_, which means time domain signals, and some - _f_, which indicates frequency domain signals. See README.txt from [primary .zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) for more details.  

* tbodyacc.mean.x
* tbodyacc.mean.y
* tbodyacc.mean.z
* tgravityacc.mean.x
* tgravityacc.mean.y
* tgravityacc.mean.z
* tbodyaccjerk.mean.x
* tbodyaccjerk.mean.y
* tbodyaccjerk.mean.z
* tbodygyro.mean.x
* tbodygyro.mean.y
* tbodygyro.mean.z
* tbodygyrojerk.mean.x
* tbodygyrojerk.mean.y
* tbodygyrojerk.mean.z
* tbodyaccmag.mean
* tgravityaccmag.mean
* tbodyaccjerkmag.mean
* tbodygyromag.mean
* tbodygyrojerkmag.mean
* fbodyacc.mean.x
* fbodyacc.mean.y
* fbodyacc.mean.z
* fbodyaccjerk.mean.x
* fbodyaccjerk.mean.y
* fbodyaccjerk.mean.z
* fbodygyro.mean.x
* fbodygyro.mean.y
* fbodygyro.mean.z
* fbodyaccmag.mean
* fbodybodyaccjerkmag.mean
* fbodybodygyromag.mean
* fbodybodygyrojerkmag.mean
* tbodyacc.std.x
* tbodyacc.std.y
* tbodyacc.std.z
* tgravityacc.std.x
* tgravityacc.std.y
* tgravityacc.std.z
* tbodyaccjerk.std.x
* tbodyaccjerk.std.y
* tbodyaccjerk.std.z
* tbodygyro.std.x
* tbodygyro.std.y
* tbodygyro.std.z
* tbodygyrojerk.std.x
* tbodygyrojerk.std.y
* tbodygyrojerk.std.z
* tbodyaccmag.std
* tgravityaccmag.std
* tbodyaccjerkmag.std
* tbodygyromag.std
* tbodygyrojerkmag.std
* fbodyacc.std.x
* fbodyacc.std.y
* fbodyacc.std.z
* fbodyaccjerk.std.x
* fbodyaccjerk.std.y
* fbodyaccjerk.std.z
* fbodygyro.std.x
* fbodygyro.std.y
* fbodygyro.std.z
* fbodyaccmag.std
* fbodybodyaccjerkmag.std
* fbodybodygyromag.std
* fbodybodygyrojerkmag.std
  

