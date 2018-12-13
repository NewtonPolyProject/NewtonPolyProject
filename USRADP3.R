retArea <- function(x) {
        
        abs((x[1]*(x[4]-x[6]) + x[3]*(x[6]-x[2]) + x[5]*(x[2]-x[4]))/2)
}


triArea <- function() {
        #Read list of triangle coordinates.
        #Read as R code.
        
        tris <- scan("./minTris2.txt", what="character", sep="\n")
        
        for(i in seq_along(tris)) {
                tris[i] <- retArea(eval(parse(text=tris[i])))
        }
        tris
}