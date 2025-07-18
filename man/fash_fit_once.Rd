% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/03_sampling.R
\name{fash_fit_once}
\alias{fash_fit_once}
\title{Fit Model Once and Extract Posterior Sample Paths}
\usage{
fash_fit_once(
  data_i,
  refined_x,
  M,
  psd_iwp,
  Si = NULL,
  Omegai = NULL,
  num_basis = 30,
  betaprec = 1e-06,
  order = 2,
  pred_step = 1,
  likelihood,
  deriv = 0
)
}
\arguments{
\item{data_i}{A single dataset extracted from the \code{data_list} component of \code{fash_set_data}. Must be a list containing \code{y}, \code{x}, and \code{offset}.}

\item{refined_x}{A numeric vector of grid points where posterior sample paths are evaluated.}

\item{M}{An integer specifying the number of posterior samples to generate.}

\item{psd_iwp}{A numeric value specifying the PSD value for the Integrated Wiener Process.}

\item{Si}{A numeric vector representing the standard errors for the dataset (if applicable).}

\item{Omegai}{A numeric precision matrix for the dataset (if applicable).}

\item{num_basis}{An integer specifying the number of O-Spline basis functions.}

\item{betaprec}{A numeric value representing the precision of the fixed effects coefficients.}

\item{order}{An integer specifying the order of the Integrated Wiener Process (IWP) prior.}

\item{pred_step}{A numeric value specifying the prediction step size.}

\item{likelihood}{A character string specifying the likelihood function to use. Options are `gaussian` and `poisson`.}

\item{deriv}{An integer specifying the order of the derivative to compute.}
}
\value{
A numeric matrix of posterior sample paths, where rows correspond to grid points in \code{refined_x} and columns correspond to the generated samples.
}
\description{
This function fits the model for a given dataset and specified PSD value, and generates posterior sample paths at refined grid points.
}
\examples{
# Example usage
set.seed(1)
Y <- matrix(rpois(20, lambda = 5), nrow = 4, ncol = 10, byrow = TRUE)
smooth_var <- matrix(runif(20), nrow = 4, ncol = 10, byrow = TRUE)
offset <- 1
fash_data <- fash_set_data(Y, smooth_var, offset)
refined_x <- seq(0, 10, length.out = 50)
samples <- fashr:::fash_fit_once(data_i = fash_data$data_list[[1]], refined_x = refined_x, M = 100, num_basis = 60,
                         psd_iwp = 0.5, Si = NULL, Omegai = NULL, likelihood = "poisson")


}
\keyword{internal}
