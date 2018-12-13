createList <- function() {
        #We assume the pre-processed polygons1to30.txt
        #file is in the pwd. We also include the 
        #required packages.
        library(gdata)
        t <- scan("./Polygons1to30.txt", what="character", fill=T, sep="\n")
        
        #Every line corresponding to a valid polygon
        # begins with "{ {", we search for these.
        polyt <- grepl("{ {", t, fixed=TRUE)
        
        #Create new list containing only Newton 
        #Polygons
        t2 <- t[polyt]
        
        t2 <- gsub("[", "{", t2, fixed=T)
        t2 <- gsub("]", "}", t2, fixed=T)
        
        #We also need to eliminate commas from the end
        #of any line, lest Macaulay2 believes it to be
        #a sequence.
        for(i in seq_along(t2)) {
                if(grepl("} },", t2[i])==TRUE) {
                       t2[i] <- substr(t2[i], 1, nchar(t2[i])-1)
                }
        }
        
        #Convert this list into a matrix for write.fwf
        t3 <- matrix(t2)
        
        #Now, we write this to a fwf file for ease of
        #use with Macaulay2's readIn function.
        write.fwf(t3, file="PolygonData.txt", width="128")
        
}