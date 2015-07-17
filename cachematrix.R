## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(the_matrix = matrix()) {
    matrixInverse <- NULL
    setMatrix <- function(new_matrix) {
        x <<- new_matrix
        inverse <<- NULL
    }
    getMatrix <- function() the_matrix
    setInverse <- function(newInverse) matrixInverse <<- newInverse
    getInverse <- function() matrixInverse
    returnObject <- list(setMatrix = setMatrix,
                            getMatrix = getMatrix,
                            getInverse = getInverse,
                            setInverse = setInverse)
    invisible(returnObject)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    returnInverse <- x$getInverse()
    if (is.null(returnInverse)) {
        returnInverse <- solve(x$getMatrix())
        x$setInverse(returnInverse)
    }
    returnInverse
}
