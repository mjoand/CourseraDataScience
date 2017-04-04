best<-function(state,outcome){
setwd(file.path(getwd(),"Assignment3Data" ))
outc<-read.csv("outcome-of-care-measures.csv",header=T,stringsAsFactors = F)[c(2,7,11,17,23)]
setwd("..")
names(outc)<-c("Hosp","State","OUT","OUT","OUT")

st<-length(intersect(unique(outc$State),state))
ocm<-length(intersect(c("heart failure","heart attack","pneumonia"),outcome))
hospital<-character()

if (st*ocm==0){
  if (st==0){
    stop("invalid state")
  }else{
      stop("invalid outcome")
    }
} else {
  ocm<-3
  if(outcome=="heart failure"){ocm<-4}
  if(outcome=="pneumonia"){ocm<-5}
  outc<-outc[outc$State==state,c(1,ocm)]
  outc<-outc[outc$OUT!="Not Available",]
  outc[,"OUT"]<-as.numeric(outc[,"OUT"])
  minimo<-min(outc$OUT,na.rm=T)
  outc<-outc[outc$OUT==minimo,]
  index<-order(outc$Hosp)
  outc<-outc[index,]
  hospital<-outc[1,1]
}
return(hospital)
}