### README
========================================================

#### This is explanation how the script works. 

You must have the [.zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) in your working directory.

* Unzip the .zip file in working directory and read required .txt file:

```{r}
unzip("UCI HAR Dataset.zip")
xtest<-read.table("./UCI HAR Dataset/test/X_test.txt")
xtrain<-read.table("./UCI HAR Dataset/train/X_train.txt")
ytest<-read.table("./UCI HAR Dataset/test/y_test.txt")
ytrain<-read.table("./UCI HAR Dataset/train/y_train.txt")
features<-read.table("./UCI HAR Dataset/features.txt")
activities<-read.table("./UCI HAR Dataset/activity_labels.txt")
subjectTrain<-read.table("./UCI HAR Dataset/train/subject_train.txt")
subjectTest<-read.table("./UCI HAR Dataset/test/subject_test.txt")
```

* Merge the _xtrain_ and _xtest_ sets to create one data set. Label the variables in dataset with the _features_ dataset. Merge the _ytrain_ and _ytest_ sets to create one data set. Label the variable in dataset with the _activity_ name. Merge the _subjectTest_ and _subjectTrain_ sets to create one data set. Label the variable in dataset with the _subject_ name.

```{r}
x<-rbind(xtest,xtrain)
y<-rbind(ytest,ytrain)
z<-rbind(subjectTest,subjectTrain)
colnames(x)<-features[,2]
colnames(y)<-"activity"
colnames(z)<-"subject"
```

* Merge the _x_, _y_ and _z_ to create one data frame.

```{r}
data<-cbind(y, x)
data<-cbind(z, data)
```

* Lower the capital letters in _activities_ set.

```{r}
for (i in activities$V1) {data$activity[data$activity==i]<-tolower(activities$V2[activities$V1==i])} 
```

* Extract only the measurements on the mean and standard deviation for each measurement. These variable have labels _"mean"_ and _"std"_. The variable with label "_meanFreq_" are not really measurements of the mean, so these variables were not included in final tidy dataset.


```{r}
meanData<-subset(data, select = c(grep("mean()", names(data), value=T, fixed=T)))
stdData<-subset(data, select = c(grep("std()", names(data), value=T, fixed=T))) 
```

* Merge the _meanData_ and _stdData_ to create one dataframe. Add _subject_ and _activity_ colums.

```{r}
subdata<-cbind(meanData,stdData)
subdata<-cbind(activity=data$activity,subdata)
subdata<-cbind(subject=data$subject,subdata)
```

* Change variables names for ease analysis. Lower all _capital_ letters, delete the brackets _"()"_, change all _overscore_ in the _dots_. 
 
```{r}
splitNames<-strsplit(names(subdata), "\\()")
fE<-function(x){x[1]}
sE<-function(x){x[2]}

colnames(subdata)<-gsub("NA","",
                        gsub("-",".",
                             paste0(tolower(sapply(splitNames,fE)),
                                    tolower(sapply(splitNames,sE)))))
``` 

* Creates tidy data set with the average of each variable for each activity and each subject. 

```{r}
dataMelt<-melt(subdata, id=c("subject", "activity"))
subjectData<-dcast(dataMelt, subject + activity ~ variable, fun.aggregate=mean, value.var="value")
write.table(subjectData, "./tidy.txt", quote = F, row.names = F)
``` 
