% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/00_setup.R
\name{global_poly_helper}
\alias{global_poly_helper}
\title{Constructing and evaluating the global polynomials, to account for boundary conditions (design matrix)}
\usage{
global_poly_helper(x, p = 2)
}
\arguments{
\item{x}{A vector of locations to evaluate the global polynomials}

\item{p}{An integer value indicates the order of smoothness}
}
\value{
A matrix with i,j component being the value of jth basis function
value at ith element of x, the ncol should equal to p, and nrow
should equal to the number of elements in x
}
\description{
Constructing and evaluating the global polynomials, to account for boundary conditions (design matrix)
}
\examples{
fashr:::global_poly_helper(x = c(0, 0.2, 0.4, 0.6, 0.8), p = 2)

}
\keyword{internal}
