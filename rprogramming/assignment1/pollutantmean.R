## Assignment 1 - pollution mean

## Description

## function

## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'pollutant' is a character vector of length 1 indicating
## the name of the pollutant for which we will calculate the
## mean; either "sulfate" or "nitrate".

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return the mean of the pollutant across all monitors list
## in the 'id' vector (ignoring NA values)

pollutantmean <- function( directory, pollutant, id = 1:332 ) {
    
    # Create data frame to store CSV data
    data <- data.frame()
    
    # Iterate over the files
    for( file in id ) {
        
        # get filename by concatenating directory, file and .csv
        filename = file.path( directory,paste( sprintf( "%03d", file ), ".csv", sep="" ) )
        
        # bind CSV data to our data frame
        data <- rbind( data, read.csv(filename, header = TRUE) )
    }
    
    mean(data[[pollutant]], na.rm = TRUE)
    
}