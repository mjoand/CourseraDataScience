



corr<-function(directory,threshold=0){

setwd(file.path(getwd(),directory))

###Creating a vector of file names
files1to9<-paste("0","0",as.character(1:9),".csv",sep="")
files10to99<-paste("0",as.character(10:99),".csv",sep="")
files100to332<-paste(as.character(100:332),".csv",sep="")
files<-c(files1to9,files10to99,files100to332)

aux<-data.frame(id=1:332)

##defining an auxliliary function that returns the number of complete cases in 
### a data frame in the repository

compcases<-function(i){
  sum(complete.cases(read.csv(files[i],header=T)))
}

aux$nobs<-apply(aux,1, compcases)
aux<-aux[aux$nobs>threshold,1]
i1<-length(aux)

aux2<-numeric()

if(length(aux)>0){

for (i in 1:i1){
  aux3<-na.omit(read.csv(files[aux[i]],header=T))
  aux2<-c(aux2,cor(aux3[,2],aux3[,3]))
}

}

setwd("..")

return(aux2)

}