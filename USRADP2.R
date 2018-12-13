createList2 <- function() {
        #Read in the list which contains true/false
        #values for polygons to minimize.
        
        filterIndex <- scan("./minimize2.txt", what="character")
        t <- scan("./Polygons1to30.txt", what="character", fill=T, sep="\n")
        
        #Every line corresponding to a valid polygon
        # begins with "{ {", we search for these.
        polyt <- grepl("{ {", t, fixed=TRUE)
        
        #Create new list containing only Newton 
        #Polygons
        t2 <- t[polyt]
        
        #We also need to eliminate commas from the end
        #of any line, lest Macaulay2 believes it to be
        #a sequence.
        for(i in seq_along(t2)) {
                if(grepl("} },", t2[i])==TRUE) {
                        t2[i] <- substr(t2[i], 1, nchar(t2[i])-1)
                }
        }
        
        #Set remaining values of filterIndex false by
        #default. Convert filterIndex to logical variable.
        filterIndex[(length(filterIndex)+1):length(t2)] <- "false"
        filterIndex <- as.logical(filterIndex)
        
        #Select those polygons from t2 for minimization.
        t3 <- t2[filterIndex]
        
        write(t3, file="toMinimize.txt")
        
        
        
}