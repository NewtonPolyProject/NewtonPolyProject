createFinalTable <- function() {
        source("USRADP3.R")
        source("USRADP5.R")
        
        #Read in list of polygons and their genuses
        polygons <- scan("PolyList2.txt", what="character", sep="\n")
        g <- scan("Genuses.txt", what="character", sep="\n")
        triAreas <- triArea()
        
        goodMults <- createList3()
        
        #Create an indicator to tell when polys do not satisfy criterion
        indicator <- goodMults == 0
        
        g <- g[!indicator]
        polygons <- polygons[!indicator]
        triAreas <- triAreas[!indicator]
        goodMults <- goodMults[!indicator]
        
        equality <- sqrt(2*as.numeric(triAreas)) == goodMults
        
        #create a matrix containing the polygons, their genus, and multiplicities at which 
        #criterion is satisfied, and write to a table.
        finalPolys <- cbind(polygons, g, goodMults, triAreas, equality)
        
        write.table(finalPolys, file="FinalPolygons.txt", row.names=FALSE, col.names=c("Polygon", "Genus", "Max Multiplicity", "Triangle Area", "Equality"))
}