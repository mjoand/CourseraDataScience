
complete<-function(directory,id=1:332){
  
  ##directory is a character vector of length 1 indicating where the files are stored
  ###id is an integer vector indicating the monitor ID numbers to be used
  ###returns a dataframe where id is the monitor ID number and nobs the number of
  ###complete observations

setwd(file.path(getwd(),directory))

###Creating a vector of file names
files1to9<-paste("0","0",as.character(1:9),".csv",sep="")
files10to99<-paste("0",as.character(10:99),".csv",sep="")
files100to332<-paste(as.character(100:332),".csv",sep="")

files<-c(files1to9,files10to99,files100to332)

###Starting the data frame to be returned
aux<-data.frame(id)

##defining an auxliliary function that returns the number of complete cases in 
### a data frame in the repository

 compcases<-function(i){
   sum(complete.cases(read.csv(files[i],header=T)))
 }

 ##counting the complete cases for id 1 
aux$nobs<-apply(aux,1, compcases)

###Setting the directory back to the intial directory
setwd("..")

return(aux)

}
