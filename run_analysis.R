f<-read.table("features.txt",col.names=c("id","name"), stringsAsFactors=FALSE)
l<-read.table("activity_labels.txt",col.names=c("id","label"), stringsAsFactors=FALSE)

d_test<-read.table("test/X_test.txt",col.names=paste(f$name), stringsAsFactors=FALSE)
d_test2<-select(d_test,matches(".mean|std.",ignore.case = TRUE))
s_test<-read.table("test/subject_test.txt",col.name=c("subject"), stringsAsFactors=FALSE)
y_test<-read.table("test/y_test.txt",col.name=c("activity_id"), stringsAsFactors=FALSE)
y_test2<-merge(y_test,l,by.x="activity_id",by.y="id")
test<-cbind(s_test, y_test2$label, d_test2, stringsAsFactors=FALSE)
names(test)[2]<-"activity"

d_train<-read.table("train/X_train.txt",col.names=paste(f$name), stringsAsFactors=FALSE)
d_train2<-select(d_train,matches(".mean|std.",ignore.case = TRUE))
s_train<-read.table("train/subject_train.txt",col.name=c("subject"), stringsAsFactors=FALSE)
y_train<-read.table("train/y_train.txt",,col.name=c("activity_id"), stringsAsFactors=FALSE)
y_train2<-merge(y_train,l,by.x="activity_id",by.y="id")
train<-cbind(s_train, y_train2$label, d_train2, stringsAsFactors=FALSE)
names(train)[2]<-"activity"

combined<-rbind(test,train)
summary_data<-combined %>% group_by(subject,activity) %>% summarise_each(funs(mean),matches(".mean|std.",ignore.case = TRUE))
summary_data