## Two fucntions that create and cache a matrix,
## and calculate and cache its inverse.


## makeCacheMatrix function defines four functions 
## and passes them as a list to the parent environment.


makeCacheMatrix <- function(z = matrix()) {

	i <- NULL

	set <- function (y) {
		z <<- y
		i <<- NULL
	}

	get <- function() {
		z
	}

	setinv <- function(inv) {
		i <<- inv
	}

	getinv <- function() {
		i
	}

	list (	set = set, 
			get = get, 
			setinv = setinv, 
			getinv = getinv) 
}




## Retrieves the matrix and its inverse,
## calculates inverse if not calculated (null).
## Returns the inverse of the matrix.

cacheSolve <- function(z, ...) {

	i <- z$getinv()

	if(!is.null(i)){
		message("getting cached data")
		return(i)
	}

	m <- z$get()

	i <- solve(m, ...) 

	z$setinv(i)

	i

}
