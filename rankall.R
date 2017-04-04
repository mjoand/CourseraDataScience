rankall<-function(outcome,rank="best"){

source('C:/Users/andrm/Desktop/BitsAndBobs/Temp/rankhospital.R')
setwd(file.path(getwd(),"Assignment3Data" ))
rnkall<-unique(read.csv("outcome-of-care-measures.csv",header=T,stringsAsFactors = F)["State"])
setwd("..")

ocm<-length(intersect(c("heart failure","heart attack","pneumonia"),outcome))

if(ocm==0){
  stop("invalid outcome")
} else{

rnkall$hospital<-apply(rnkall,1, function(c) rankhospital(c,outcome,rank))

index<-order(rnkall$State)
rnkall<-rnkall[index,2:1]
}
return(rnkall)
}