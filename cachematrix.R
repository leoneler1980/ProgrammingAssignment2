## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function


# makeCacheMatrix, creates a function that creates a matrix to do the following:
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inv) m <<- inv
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function

## cacheSolve
# this function calculates the inverse of the matrix created 
# with makeCacheMatrix.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}

# to check if works

a <- makeCacheMatrix(matrix(rnorm(25),nrow = 5,ncol = 5))
a$get()
a$getinverse()
cacheSolve(a)
a$getinverse()  
cacheSolve(a)

