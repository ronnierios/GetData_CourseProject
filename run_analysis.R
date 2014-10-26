#Trying to load dplyr package
if(require("dplyr")){
    message("dplyr is loaded correctly")
} else {
    message("dplyr package is required, trying to install it")
    install.packages("dplyr")
    if(require("dplyr")){
        message("dplyr package was installed and loaded succesfully")
    } else {
        stop("Could not install dplyr package. Please install it manually and then run this script again") }
    }
}

#temp file name for unzipping working files"
tempzip <- "getdata-projectfiles-UCI HAR Dataset.zip"

#working files needed for create main data set
tempfiles <- c("UCI HAR Dataset/activity_labels.txt",
               "UCI HAR Dataset/features.txt",
               "UCI HAR Dataset/train/X_train.txt",
               "UCI HAR Dataset/train/y_train.txt",
               "UCI HAR Dataset/train/subject_train.txt",
               "UCI HAR Dataset/test/X_test.txt",
               "UCI HAR Dataset/test/y_test.txt",
               "UCI HAR Dataset/test/subject_test.txt")

#Set descriptive names for retrieve easily
names(tempfiles) <- c("Activity Labels","Features","x train","y train","Subject train","x test","y test","Subject test")

#validate whether temp zip file is available in working directory
if (file.exists(tempzip) == FALSE)
{
  message("Zip File no found in working directory. Downloading...")
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",tempzip) 
  
  for ( file in tempfiles) unzip(tempzip,file,overwrite=TRUE)   
}
if (file.exists(tempzip))
{
  message("Unzipping files...")
  for ( file in tempfiles) unzip(tempzip,file,overwrite=TRUE)
}
labels <- read.table(tempfiles["Activity Labels"],col.names= c("Codigo","Activity"))
features <- read.table(tempfiles["Features"],col.names= c("Codigo","Feature"),stringsAsFactors=FALSE)
features <- features %>% filter(grepl("mean\\(\\)|std\\(\\)",Feature,ignore.case=TRUE))
cols <- c(rep("NULL",561)); cols[features$Codigo] <- "numeric"
#Mergin 'train' data
datay <- read.table(tempfiles["y train"],col.names= "Codigo")
datay <- labels %>% inner_join(datay,labels,by="Codigo") %>% select(Activity)
datax <- read.table(tempfiles["x train"], colClasses= cols); names(datax) <- features$Feature
subjects <- read.table(tempfiles["Subject train"],col.names= "Subject")
dataxy <- cbind(subjects,datay); dataxy <- cbind(dataxy,datax)

#Merging 'test' data
datay <- read.table(tempfiles["y test"],col.names= "Codigo")
datay <- labels %>% inner_join(datay,labels,by="Codigo") %>% select(Activity)
datax <- read.table(tempfiles["x test"],  colClasses= cols); names(datax) <- features$Feature
subjects <- read.table(tempfiles["Subject test"],col.names= "Subject")
data <- dataxy
dataxy <- cbind(subjects,datay); dataxy <- cbind(dataxy,datax)

#Joining train an test dataframes
data <- rbind(data,dataxy)

#Freeing memory
rm(datax,datay,dataxy)

#Summarizing data and creating second data frame
data_avg <- data %>% group_by(Subject,Activity) %>% summarise_each(funs(mean))
write.table(data_avg,file="Data_avg_act_subject.txt",row.names=FALSE)
