
# Objectives: "C3 Getting and Cleanig Data Assignment"
# Author: "Kat"
# Date created: "4/10/2019"
# Input: RawData.zip
# Output: step5.txt

####Set working directory where the downloaded data are stored
setwd("/Volumes/GoogleDrive/My Drive/13Knowledge/DataScience/JhuDS/03GettingAndCleaningData/Assignment")
c3a<-getwd()
####Load raw data
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, file.path(c3a, "RawData.zip"))
unzip(zipfile = "RawData.zip")
####Load R packages
library(data.table)

################## 1. Merges the training and the test sets to create one data set.
################## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
################## 4. Appropriately labels the data set with descriptive variable names.
onetwo<-function(a,b) {
        subject<-read.table(file = paste0("./UCI HAR Dataset/", a,"/subject_",a,".txt"), col.names="SubjectId")
        activity<-read.table(file = paste0("./UCI HAR Dataset/",a,"/y_",a,".txt"), col.names="Activity")
        featurenames1<-as.character(read.table(file = "./UCI HAR Dataset/features.txt")[,2])
        str(featurenames1) # 561 features
        indexnum<-grep("(mean|std)\\(\\)", featurenames1)
        featurenames2<-gsub("\\(\\)", "", featurenames1)
        features<-read.table(file = paste0("./UCI HAR Dataset/",a,"/x_",a,".txt"), col.names=featurenames2)[, indexnum]
        b<-cbind(subject, activity, features)
        return(b)
}
train<-onetwo ("train", train)
str(train)
test<-onetwo ("test", test)
str(test)
all<-rbind(train, test)
str(all)

################# 3. Uses descriptive activity names to name the activities in the data set
alabels<-read.table(file="./UCI HAR Dataset/activity_labels.txt")
all$Activity<-factor(all$Activity, levels = alabels[,1], labels = alabels[,2])
str(all$Activity)
str(all)
names(all)

################# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
mtcars$carname <- rownames(mtcars)
#### melt to a tall skinny dataset
varnames<-names(all)[3:68]
melted <- melt(all,id=c("SubjectId","Activity"),measure.vars=varnames)
head(melted,n=3)
tail(melted,n=3)
#### cast and give summary of variable when id columns equals to each of its values
casted <- dcast(melted, SubjectId + Activity ~ variable, mean) 
nrow(casted) #30*6=180
write.table(casted, file="/Users/kexinjin/c3assignment/step5.txt", row.names = FALSE)

    
    