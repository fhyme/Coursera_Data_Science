## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
		# initialize the inverse matrix value
		inv <- NULL
		
		# set the value of the matrix
		set <- function(y) {
			x <<- y
			inv <<- NULL
		}
		
		# get the value of the matrix
		get <- function() x
		
		# set the value of the inverse
		set_inverse <- function(inv_input) inv <<- inv_input
		# get the value of the inverse
		get_inverse <- function() inv
		
		# return a list of all the above functions
		list(set = set, get = get,
			 set_inverse = set_inverse,
			 get_inverse = get_inverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
		# check if the inverse is already cached,
		# if so, we get the inverse from the cache directly
		inv <- x$get_inverse()
		if(!is.null(inv)) {
			message("getting cached inverse")
			return(inv)
		}
		# else, we first get the matrix
		data <- x$get()
		# and calculate the inverse
		inv <- solve(data, ...)
		# next, cache the inverse of the matrix
		x$set_inverse(inv)
		# and finally, return the result
		inv
}
