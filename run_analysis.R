#Trying to load dplyr package
if(require("dplyr")){
    message("dplyr is loaded correctly")
} else {
    message("dplyr package is required, trying to install it")
    install.packages("dplyr")
    if(require("dplyr")){
        message("dplyr package was installed and loaded succesfully")
    } else {
        stop("Could not install dplyr package. Please install it manually, then run this script again") }
    }
}

#zip file contains Samsung data UCI HAR"
tempzip <- "getdata-projectfiles-UCI HAR Dataset.zip"

#This vector contains files need for create tidy data
tempfiles <- c("UCI HAR Dataset/activity_labels.txt",
               "UCI HAR Dataset/features.txt",
               "UCI HAR Dataset/train/X_train.txt",
               "UCI HAR Dataset/train/y_train.txt",
               "UCI HAR Dataset/train/subject_train.txt",
               "UCI HAR Dataset/test/X_test.txt",
               "UCI HAR Dataset/test/y_test.txt",
               "UCI HAR Dataset/test/subject_test.txt")

#Set descriptive names to vector for retrieve easily
names(tempfiles) <- c("Activity Labels","Features","x train","y train","Subject train","x test","y test","Subject test")

#Validate whether temp zip file is available in working directory
if (file.exists(tempzip) == FALSE)
{
  message("Zip File no found in working directory. Downloading...")
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",tempzip) 
  if (file.exists(tempzip) == FALSE) {
   stop("Could not download the data UCI HAR Dataset. Please check your internet connection, then run this script again") }
  for ( file in tempfiles) unzip(tempzip,file,overwrite=TRUE)   
}
if (file.exists(tempzip))
{
  message("Unzipping files...")
  for ( file in tempfiles) unzip(tempzip,file,overwrite=TRUE)
}
###################################################################

#Loading data which contains descriptive activity names
labels <- read.table(tempfiles["Activity Labels"],col.names= c("Code","Activity"))
features <- read.table(tempfiles["Features"],col.names= c("Code","Feature"),stringsAsFactors=FALSE)
#NOTE: Filtering only features that include the measurements mean or standard deviation but
#not for any feature with the word 'mean' or 'std' in it. Just mean() and std() precisely, 
#because two types of measurement required.
features <- features %>% filter(grepl("mean\\(\\)|std\\(\\)",Feature,ignore.case=TRUE))
#Preparing columns names which will be skipped due to filtering features.
cols <- c(rep("NULL",561)); cols[features$Code] <- "numeric"
#Loading 'train' data with (70%)
datay <- read.table(tempfiles["y train"],col.names= "Code")
datay <- labels %>% inner_join(datay,labels,by="Code") %>% select(Activity)
datax <- read.table(tempfiles["x train"], colClasses= cols); names(datax) <- features$Feature
subjects <- read.table(tempfiles["Subject train"],col.names= "Subject")
dataxy <- cbind(subjects,datay); dataxy <- cbind(dataxy,datax)

#Creating the first part of tidy data
data <- dataxy

#Merging 'test' data (30%), we use the same variables to reduce memory use.
datay <- read.table(tempfiles["y test"],col.names= "Code")
datay <- labels %>% inner_join(datay,labels,by="Code") %>% select(Activity)
datax <- read.table(tempfiles["x test"],  colClasses= cols); names(datax) <- features$Feature
subjects <- read.table(tempfiles["Subject test"],col.names= "Subject")
dataxy <- cbind(subjects,datay); dataxy <- cbind(dataxy,datax)

#Joining test and train tidy data to finally get one in 100%
data <- rbind(data,dataxy)

#Freeing memory
rm(datax,datay,dataxy)

#Creating tidy data file in working directory
write.table(data,file="tidydata.txt",row.names=FALSE))

#Summarizing tidy data and averaging features by activity each subject,
#and finally create file in working directory
data_avg <- data %>% group_by(Subject,Activity) %>% summarise_each(funs(mean))
write.table(data_avg,file="data_avg_act_subject.txt",row.names=FALSE)
