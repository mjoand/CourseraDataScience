
pollutantmean <- function(directory, pollutant, id = 1:332){
  
##directory is a character vector of length 1 indicating where the files are stored
##pollutant is a character vector of length 1 indicatin which is the pollutant for which we
###will be calculating the mean, either "nitrate" or "sulphate"
###id is an integer vector indicating the monitor ID numbers to be used
  
###Setting a path to a subdirectory inside a directory
setwd(file.path(getwd(),directory))

###constructing auxiliary filenames vector
filenames1to9<-paste("0","0", as.character(1:9), ".csv", sep="") 
filenames10to99<-paste("0", as.character(10:99), ".csv", sep="") 
filenames100to332<-paste(as.character(100:332),".csv",sep="")

filenames<-c(filenames1to9,filenames10to99,filenames100to332)

###concatenating the ata vectors corresponding to the pre-selected pollutant
aux<-numeric()

for (i in id){
  aux<-c(aux,read.csv(filenames[i],header=T)[,pollutant])
}

##setting the directory to the initial directory
setwd("..")  

###returning the mean (NAs removed from the mean calculation)
return(mean(aux,na.rm=T))

}