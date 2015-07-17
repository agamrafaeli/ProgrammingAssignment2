## The following code has two functions.
##      makeCacheMatrix - Gets a matrix
##                        Returns a matrix object with the ability
##                          to cache the value of its inverse
##      cacheSolve - Gets a matrix that has been created by makeCacheMatrix
##                   Returns that matrix's inverse. If possible, gets the value out of the cache
                    

## makeCacheMatrix
##      Gets a matrix
##      Returns a matrix object with the ability
##
## Assumes that the matrix it gets as input is invertible

makeCacheMatrix <- function(the_matrix = matrix()) {
    # Cache variable
    matrixInverse <- NULL
    
    # Methods
    setMatrix <- function(new_matrix) {
        x <<- new_matrix
        inverse <<- NULL
    }
    getMatrix <- function() the_matrix
    setInverse <- function(newInverse) matrixInverse <<- newInverse
    getInverse <- function() matrixInverse
    
    # Return value
    returnObject <- list(setMatrix = setMatrix,
                            getMatrix = getMatrix,
                            getInverse = getInverse,
                            setInverse = setInverse)
    invisible(returnObject)
}


## makeCacheMatrix
##      Gets a matrix created by makeCacheMatrix
##      Returns that matrix's inverse. If possible gets it out of the cache.
##
## Assumes that the matrix it gets has been created by makeCacheMatrix

cacheSolve <- function(x, ...) {
    
    # Get value from cache
    returnInverse <- x$getInverse()
    
    # Compute value if cache is NULL
    if (is.null(returnInverse)) {
        returnInverse <- solve(x$getMatrix())
        x$setInverse(returnInverse)
    }
    
    # Return value
    returnInverse
}
