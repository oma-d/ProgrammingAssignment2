## caching the inverse of a matrix rather than compute it repetetedly.


## creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  
  m <- NULL
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  
  get <- function()x
  setinverse <- function(solve) m <<- solve
  getinverse <- function()m 
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)

}

## retrieve the inverse from the cache 

cacheSolve <- function(x, ...) {
       
  m <- x$getinverse
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data,...)
  x$setinverse(m)
  m
}

m1 <- matrix(c(1/2, -1/4, -1, 3/4), nrow = 2, ncol = 2)
##solve(m1)

myMatrix_object <- makeCacheMatrix(m1)
cacheSolve(myMatrix_object)
