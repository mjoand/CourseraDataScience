rankhospital<-function(state,outcome,rank){
setwd(file.path(getwd(),"Assignment3Data" ))
outc<-read.csv("outcome-of-care-measures.csv",header=T,stringsAsFactors = F)[c(2,7,11,17,23)]
setwd("..")
names(outc)<-c("Hosp","State","OUT","OUT","OUT")

hospital<-NA

sta<-length(intersect(unique(outc$State),state))
out<-length(intersect(c("heart failure","heart attack","pneumonia"),outcome))

if (sta*out==0){
  if (sta==0){
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
  
  if(rank=="best"){
    rnk<-1
  }else if (rank=="worst"){
      rnk<-nrow(outc)
  } else{
      rnk<-rank
    }
 if (rnk <= nrow(outc)){
   index<-order(outc[,2],outc[,1])
   outc<-outc[index,]
   hospital<-outc[rnk,1]
 }
  
}

return(hospital)

}