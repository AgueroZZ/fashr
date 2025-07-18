% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/00_setup.R
\name{fash_set_tmbdat}
\alias{fash_set_tmbdat}
\title{Create a TMB Data Object for a Specific Dataset}
\usage{
fash_set_tmbdat(
  data_i,
  Si = NULL,
  Omegai = NULL,
  num_basis = 30,
  betaprec = 1e-06,
  order = 2
)
}
\arguments{
\item{data_i}{A single dataset extracted from the \code{data_list} component of \code{fash_set_data}.
Must be a list containing \code{y}, \code{x}, and \code{offset}.}

\item{Si}{A numeric vector representing the standard errors for the dataset.}

\item{Omegai}{A numeric precision matrix for the dataset.}

\item{num_basis}{An integer specifying the number of O-Spline basis functions to use for the approximation.}

\item{betaprec}{A numeric value representing the precision of the fixed effects coefficients.}

\item{order}{An integer specifying the order of the Integrated Wiener Process (IWP) prior.}
}
\value{
A list formatted as a \code{tmbdat} object, containing:
\item{y}{A numeric vector of response variables for the dataset.}
\item{X}{A sparse matrix representing the design matrix for fixed effects.}
\item{P}{A sparse matrix representing the penalty matrix for the spline coefficients.}
\item{B}{A sparse matrix representing the design matrix for random effects.}
\item{offset}{A numeric vector of offsets for the dataset.}
\item{logPdet}{The log determinant of the penalty matrix.}
\item{betaprec}{The precision for the fixed effects coefficients.}
\item{S}{The standard errors for the dataset, if provided as \code{Si}.}
\item{Omega}{The precision matrix for the dataset as a sparse matrix, if provided as \code{Omegai}.}
\item{log_det_Omega}{The log determinant of the precision matrix, if \code{Omegai} is provided.}
}
\description{
Processes the \code{tmbdat} object for a specific dataset, using the provided smoothing variables,
standard errors, and precision matrix. This function generates spline basis matrices,
penalty matrices, and other quantities required for modeling.
}
\examples{
# Example usage
set.seed(1)
Y <- matrix(rnorm(20), nrow = 4, ncol = 5)
smooth_var <- matrix(runif(20), nrow = 4, ncol = 5)
offset <- 1
S <- c(0.5, 0.8, 1.2, 1.0, 0.9)
Omega <- diag(5)
data <- fash_set_data(Y, smooth_var, offset, S, Omega)
tmbdat <- fash_set_tmbdat(data$data_list[[1]], Si = S[[1]], Omegai = Omega)

}
