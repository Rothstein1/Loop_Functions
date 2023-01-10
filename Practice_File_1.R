##LAPPLY 
## lapply: loop over a list and evaluate a function on each element of list
## 3 arguments: (1) a list x, (2) a function, (3) other arguments that go together with the function
## example: 

## Create a list contianing a and b: a = 1,2,3,4,5 & b = 10 random numbers 
x<- list(a=1:5, b=rnorm(10))
## Now use lappy to caluclate mean across both a and b (both elements of the list). Output is also a list
z <- lapply(x, mean)
z

## runif example
## runif(x) returns a set of x random numbers 
runif(1)
runif(2)
x<-1:4
## Below iterates runif function over each element. Giving us a list containing runif(1), runif(2) runif(3), & runif(4)
lapply(x,runif)

## runif example using the third argument (other arguments that go together with the function)
## third argument specifies min and max
lapply(x, runif, min=1, max =2)

## We can also create functions within lapply
a <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
a
##Define function within lappy that extracts the first column of the matrices
## 1. Call lapply on a: and then write a function with an argument firstsc 
## 2. Given that argument, firstc, we are going to extract the first column
## This function does not exist except in the context of lappy 
## We call this anonymous function. Lappy and a lot of these apply functions use anonymous functions
## We are often creating functions on the spot within lappy (and other applys) to do what we want 
lapply(a, function(firstc) firstc[,1])

##SAPPLY 
## sapply: Same as lapply but try to simplify result
## Simplifications: 
## If result is a list where every element is length 1 --> then a vector is returned 
## If result is a list where every element has the same length --> a matrix is returned
## If it can't figure out how to simplify --> a list is returned 

b<- list(a=1:4, b=rnorm(10), c = rnorm(20,1), d=rnorm(100,5))
## lapply returns a list of 4 elements, each with length =1
## lapply keeps original list tags (a,b,c,d), wheras sapply does not 
lapply(b, mean)
#sapply simplifies this result and returns a vector of length =4
sapply(x,mean)

#below does not work, this is why we need to use the loop functions to iterate over each element in the list 
mean(b)

## apply: Apply a function over the margins of an array 
## tapply: Apply a function over subsets of a vector
## mapply: Multivariate version of lappy 
## split: splits object into sub pieces. Often used together with lapply and sapply 

