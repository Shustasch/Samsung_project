unzip("UCI HAR Dataset.zip")
xtest<-read.table("./UCI HAR Dataset/test/X_test.txt")
xtrain<-read.table("./UCI HAR Dataset/train/X_train.txt")
ytest<-read.table("./UCI HAR Dataset/test/y_test.txt")
ytrain<-read.table("./UCI HAR Dataset/train/y_train.txt")
features<-read.table("./UCI HAR Dataset/features.txt")
activities<-read.table("./UCI HAR Dataset/activity_labels.txt")
subjectTrain<-read.table("./UCI HAR Dataset/train/subject_train.txt")
subjectTest<-read.table("./UCI HAR Dataset/test/subject_test.txt")

x<-rbind(xtest,xtrain)
y<-rbind(ytest,ytrain)
z<-rbind(subjectTest,subjectTrain)
colnames(x)<-features[,2]
colnames(y)<-"activity"
colnames(z)<-"subject"

data<-cbind(y, x)
data<-cbind(z, data)

for (i in activities$V1) {data$activity[data$activity==i]<-tolower(activities$V2[activities$V1==i])} 

meanData<-subset(data, select = c(grep("mean()", names(data), value=T, fixed=T)))
stdData<-subset(data, select = c(grep("std()", names(data), value=T, fixed=T)))

subdata<-cbind(meanData,stdData)
subdata<-cbind(activity=data$activity,subdata)
subdata<-cbind(subject=data$subject,subdata)

splitNames<-strsplit(names(subdata), "\\()")
fE<-function(x){x[1]}
sE<-function(x){x[2]}

colnames(subdata)<-gsub("NA","",
                        gsub("-",".",
                             paste0(tolower(sapply(splitNames,fE)),
                                    tolower(sapply(splitNames,sE)))))

library(reshape2)
dataMelt<-melt(subdata, id=c("subject", "activity"))
subjectData<-dcast(dataMelt, subject + activity ~ variable, fun.aggregate=mean, value.var="value")
write.table(subjectData, "./tidy.txt", quote = F, row.names = F)

