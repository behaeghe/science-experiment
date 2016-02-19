## Week 1 Assignment
pollutantmean <- function (directory, pollutant,id=1:332) {
        
        ## Todo: fix the math on the means (append all values and then calculate
        ## ) mean, think rbind...
        ##        add slashes for dir buildup
        ##       Clean-up and coment code
        ##      Unit test more
        ## 'directory' is a characted vector of length 1 indicating the location
        ## of the csv files
        
        ## 'pollutant' is a character vector of length 1 indicating the name
        ## of the pollutant either 'nitrate' or 'sulfate'
        
        ## 'id'is an integer vector indicating the monitor ID numbers to be used
        
        ## pollutantmean will return the mean of the specified pollutant
        ## ('nitrate', 'sulfate') across all fonitors specified in the 'id'
        ## vector, NA values will be ignored
        

        ## initializing an empty data frame, subsequent loaded observations will be appended to this data frame
        pollutantdata = data.frame("Date"=character(0),"sulfate"=character(0),"nitrate"=character(0), "ID"=integer(0)) 
        ## get the list of files (as a vector) to read from 
        fileList <- dir(path=directory)
        ## looping through sequence of files
        for (i in 1:length(id)){
                fileIndex <- id[i] #define the value of the file to retrieve data for current loop iteration
                fileToload <- file.path(directory,fileList[[fileIndex]]) #create a path to the file
                thisMon <- read.csv(fileToload) #load csv file content in dataframe
                 pollutantdata = rbind(pollutantdata,thisMon) #append observation to pollutantdata data frame
         }

        mean(pollutantdata[[pollutant]],na.rm=TRUE) # compute mean across all loaded observations ignoring NA
}