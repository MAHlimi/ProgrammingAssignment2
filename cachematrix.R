# Goal        : Cache the inverse of a "matrix".                                #
# Description : With a "standard" R matrix, every time we need its inverse,     #
#               R have to recalculate it, which can be very expensive in term   #
#               of resources/time.                                              #
#               R, through its scoping rules, permit us to create a "special"   #
#               matrix that caches its inverse, so that, if we already have the #
#               inverse calculated, no need to go through the computation, we   #
#               grab the inverse from the cache directly.                       #
# When to use : This "special" matrix is extremely useful when:                 #
#                 - the inverse is computed repeatedly,                         #
#                 - the content of the matrix is not changing frequently.       #
# ----------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------- #
# function "makeCacheMatrix" creates a special "matrix" object that can cache   #
# its inverse.                                                                  #
# NOTE: if the object is modified ("set" function called), the cached inverse   #
#       is emptied (reset to "NULL").                                           #
# ----------------------------------------------------------------------------- #
makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) inv <<- inverse
    getinverse <- function() inv
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}

# ----------------------------------------------------------------------------- #
# function "cacheSolve" computes the inverse of the special "matrix" returned   #
# by the function "makeCacheMatrix" above.                                      #
# If the inverse has already been calculated (and the matrix has not changed),  #
# then the cacheSolve should retrieve the inverse from the cache.               #
# ----------------------------------------------------------------------------- #
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inverse <- x$getinverse()
    if(!is.null(inverse)) {
        message("getting cached data")
        return(inverse)
    }
    data <- x$get()
    inverse <- solve(data, ...)
    x$setinverse(inverse)
    inverse
}

