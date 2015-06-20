## Put comments here that give an overall description of what your
## functions do

## The function makeCacheMatrix was define to cache a matrix and its inverse. The
## inverse of the matrix cached in this function is solve by the cacheSolve function.
## This function receive a matrix as parameter. This function has the following me-
## thods: set a matrix, get the matrix that was setted, set and get the inverse of
## the matrix setted before.

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL;
  set <- function(y) {
    x <<- y;
    i <<- NULL;
  }
  get <- function() {
    x;
  }
  setInverse <- function(slv) {
    i <<- slv;
  }
  getInverse <- function() {
    i;
  }
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse);
}

## This functions was made to solve de inverse of the matrix setted in the makeCacheMatrix
## function. If the inverse of the matrix has been solved before, this function just
## recover the solution that was cached before in the makeCacheMatrix.

cacheSolve <- function(x, ...) {
    i <- x$getInverse();
    if(!is.null(i)) {
      message("getting cached data");
      return(i);
    }
    data <- x$get();
    i <- solve(data, ...);
    x$setInverse(i);
    i;
}