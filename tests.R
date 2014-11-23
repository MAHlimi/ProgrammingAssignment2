# ------------------------ #
# test1: small matrix      #
# ------------------------ #
mat1 <- matrix(sample.int(50, 10*10, TRUE), 10, 10)
cache_mat1 <- makeCacheMatrix(mat1)
cacheSolve(cache_mat1)

# ------------------------ #
# test2: medium matrix     #
# ------------------------ #
mat2 <- matrix(sample.int(50, 1000*1000, TRUE), 1000, 1000)
cache_mat2 <- makeCacheMatrix(mat2)

# first time without cache
system.time(cacheSolve(cache_mat2))
            # vuser  system elapsed 
            # 3.188   0.000   2.376

# second time with cache
system.time(cacheSolve(cache_mat2))
            # getting cached data
            #  user  system elapsed 
            # 0.000   0.000   0.001 