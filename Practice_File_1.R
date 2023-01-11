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

## apply: Apply a function over the margins(rows or columns) of an array (matrices)
## 4 arguments: (1) an array X, (2) the margin (as an integer vector), indicating which margins should be retained
## (3) the function, (4) other arguments that go together with the function

## A matrix is simply a 2-dimensional array 
## Example 1
x<- matrix(rnorm(200), 20, 10)

## (1)x is the array we want to iterate the function on, (2) we indicate the dimension we want to iterate the function over
## When we call dim(x) we see row dimension =20 is listed first and then column dimension = 10 is listed second
dim(x)
## So 1= iterate the function over each row, & 2 = iterate the function over each column
## In other words, the margin we indicate is the margin that remains (and the other margin is eliminated)

## Below calculates mean across all 20 rows (returns answers for all 20 rows)
apply(x,1,mean)

## Below calculates mean across all 10 columns ( returns answers for all 10 columns)
apply(x,2,mean)

## R provides some functions to calcualte the sum/mean over the row/column of a matrix 
## rowSums function = apply(x,1,sum)
## rowMeans function = apply(x,1,mean)
## colSums function = apply(x,2,sum)
## colSums function = apply(x,2,mean)

## Example 2
## Below calculates the 25% and 75% percentile across each row 
apply(x,1, quantile, probs =c(.25,.75))

##Now let's look at 3-dimensional arrays 
## Example 3 (10 2 X 2 matricies that are stacked)
a <- array(rnorm(2 *2 * 10), c(2,2,10))
dim(a)

## Below will calculate average along each 2 X 2 position and will get rid of the third dimension 
apply(a, c(1,2), mean)

## Below will retain only the third dimension (10) and calculate average across all 10
apply(a, 3, mean)

## We can use the shortcut functions to arrays 
## Below calculates mean across each row/column pair 
rowMeans(a, dims=2)

## Below calculates mean across each row 
rowMeans(a, dims=1)


## mapply: Multivariate version of lappy

## tapply: Apply a function over subsets of a vector
 
## split: splits object into sub pieces. Often used together with lapply and sapply 

