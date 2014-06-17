## Assignment 1 - pollution mean

## Description

## function name: complete

## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return a data frame of the form:
## id nobs
## 1  117
## 2  1041
## ...
## where 'id' is the monitor ID number and 'nobs' is the
## number of complete cases


complete <- function( directory, id = 1:332 ) {
    
    # Create data frame to store complete cases
    cases <- data.frame()
    
    # Iterate over the files
    for( file in id ) {
        
        # get filename by concatenating directory, file and .csv
        filename = file.path( directory,paste( sprintf( "%03d", file ), ".csv", sep="" ) )
        
        # get CSV data
        data <- read.csv(filename, header = TRUE)
        
        # bind a row with complete cases of current file
        cases <- rbind( cases, cbind( file, nrow( data[complete.cases(data),] ) ) )
    }
    
    # write names for data frame columns   
    colnames(cases) <- c("id", "nobs")
    
    # return complete cases
    cases
    
}