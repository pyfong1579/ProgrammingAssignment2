## Functions to cache inverse matrices.

## Function-1, makeCacheMatrix creates the list of functions to:
  # set the value of the matrix
  # get the value of the matrix
  # set the value of the inverse matrix
  # get the value of the matrix

makeCacheMatrix <- function(x = matrix()) {

  ## Initialize 
  inv <- NULL
  
  ## Method - <set> establish matrix in cache environment
  set <- function( matrix) {
    m <<- matrix
    inv <<- NULL
  }
  
  ## Method - <get> retrieve matrix from cache environment
  get <- function() {
    ## Return matrix
    m
  }
  
  ## Method - <setInverse> invert matrix in cache environment
  setInverse <- function(inverse) {
    inv <<- inverse
  }
  
  ## Method - <getInverse> retrive inverse matrix from cache environment
  getInverse <- function() {
    ## Return inverse matrix
    inv
  }
  
  ## Return the list of methods
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## Function-2, cacheSolve - Computes the inverse matrix to be returned by Function-1 makeCacheMatrix
  # NB. If the inverse matrix has already been calculated and has not changed, then cacheSolve will
  # retrieve the inverse matrix from the cache.

cacheSolve <- function(x, ...) {

  ## method to return inverse matrix of 'x'
  m <- x$getInverse()
  
  ## return inverse from cache environment if it is already set
  if( !is.null(m) ) {
    message("getting cached data")
    return(m)
  }
  
  ## else get the matrix from this function
  data <- x$get()
  
  ## Calculate & assign the inverse matrix using matrix multiplication
  m <- solve(data, ...) 
  
  ## Set the inverse matrix to the function
  x$setInverse(m)
  
  ## Return the inverse matrix
  m
}
