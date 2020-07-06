##run_analysis

##unzip the data file in the direction of this .R file| descomprimir la carpeta en el mismo folder 
setwd(dirname(rstudioapi::getSourceEditorContext()$path))
library(dplyr) #load library

#1. read de data sets and merge it
data_test<-  read.table("./UCI HAR Dataset/test/X_test.txt")
data_train<- read.table("./UCI HAR Dataset/train/X_train.txt")
dataset<- rbind(data_test,data_train); rm(data_test,data_train)

##2. extract mean and standard deviation
nombres<- read.table("./UCI HAR Dataset/features.txt")
index<- grep("mean|std",nombres$V2)
extract<- dataset[,index]

#3. to assign name activities 
activities<-read.table("./UCI HAR Dataset/activity_labels.txt")
activities$names<-as.character(activities$V2)
act_test<- read.table("./UCI HAR Dataset/test/y_test.txt")
act_train<- read.table("./UCI HAR Dataset/train/y_train.txt")
act_test_train<- rbind(act_test,act_train); rm(act_test, act_train)

extract$activitie<- as.character("")
for (i in 1:6) { # for que va dandole nombre a cada registro
     indice<- grep(activities$V1[i], act_test_train$V1)
     extract$activitie[indice]<- activities$names[i]
}
#extract$activitie[80] # prueba
#extract<-select(extract,-activitie) #para eliminar activitie

#4. asignarle los nombres ## to assign variable names
names(dataset)<- nombres$V2

##generate the tidy data file
write.table(extract, file = "tidyData", row.names = FALSE)

#5. Average of variables for each subject and for each activitie
subject_test<- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train<- read.table("./UCI HAR Dataset/train/subject_train.txt")
subjects<- rbind(subject_test,subject_train); rm(subject_test,subject_train)
extract$subject<- subjects$V1

Data2<-aggregate(. ~subject + activitie, extract, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
write.table(Data2, file = "tidydata2.txt",row.name=FALSE)

