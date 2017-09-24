## xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
## Programming Assignment 1 - Instructions air pollution
## xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

print(R.version.string)

## Set Dir

setwd("C:/Users/LuGoncalves/Documents/GitHub/datasciencecoursera/2 - R Programming/Week 2")
getwd()

## Download 

dataset_url <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(dataset_url, "specdata.zip")

## Extraction

unzip("specdata.zip", exdir = "specdata")
list.files("specdata")

## Part 1: Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) 
## across a specified list of monitors. 

pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        
        allFiles <- list.files(path = directory, full.names = TRUE)
        selectedData <- data.frame()
        for (i in id) {
                selectedData <- rbind(selectedData, read.csv(allFiles[i]))
        }
        if (pollutant == 'sulfate') {
                mean(selectedData$sulfate, na.rm = TRUE)
        } else if (pollutant == 'nitrate') {
                mean(selectedData$nitrate, na.rm = TRUE)
        }
        
}