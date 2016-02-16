above10 <- function (x){
  use <- x>10
  x[use]
}

above_n <- function (x,n=10) {
  use <- x>n
  x[use]
}

columnmean <- function (x,removeNA=TRUE) {
  nc <- ncol(x)
  means = numeric(nc)
  for (i in 1:nc) {
    means[i] <- mean(x[,i],na.rm=removeNA)
  }
  
  means
}