createList3 <- function() {
        
        #We include USRADP3, a necessary file for this to work.
        source("USRADP3.R")
        
        #We read in the list of multiplicities returned by the second pass into M2.
        mData <- scan("Multiplicities2.txt", what="character", sep="\n")
        
        #We want this to be in a format R understands
        for(i in seq_along(mData)) {
                mData[i] <- gsub("{", "c(", mData[i], fixed=TRUE)
                mData[i] <- gsub("}", ")", mData[i], fixed=TRUE)
        }
        
        #Get the area of min triangle for each polygon
        triAreas <- triArea()
        
        #Initialize vector of acceptable multiplicities at which the polygon supports polynomial vanishing...
        goodMults <- NULL
        
        #We want to compare multipicity to area, to check if it meets the criterion
        for(i in seq_along(mData)) {
                satisfies <- NULL
                mults <- eval(parse(text=mData[i]))
                for(j in seq_along(mults)) {
                        if(sqrt(2*as.numeric(triAreas[i])) <= mults[j]) {
                                satisfies <- mults[j]
                        }
                }
                if(length(satisfies)==0) {satisfies <-FALSE}
                goodMults <- c(goodMults, satisfies)
        }
        
        return(goodMults)
}