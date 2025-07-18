% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/04_fash.R
\name{fash}
\alias{fash}
\title{Perform Full FASH Analysis}
\usage{
fash(
  Y,
  smooth_var,
  offset = 0,
  S = NULL,
  Omega = NULL,
  data_list = NULL,
  grid = seq(0, 1, length.out = 25),
  likelihood = c("gaussian", "poisson"),
  num_basis = 30,
  betaprec = 1e-06,
  order = 1,
  pred_step = 1,
  penalty = 1,
  num_cores = 1,
  verbose = TRUE
)
}
\arguments{
\item{Y}{Either a numeric matrix of response variables or a character string specifying the column name in \code{data_list} for response variables.}

\item{smooth_var}{A numeric matrix, vector, or a character string specifying the column name in \code{data_list} for smoothing variables.}

\item{offset}{A numeric matrix, vector, scalar, or a character string specifying the column name in \code{data_list} for offset variables.}

\item{S}{A numeric matrix, vector, scalar, or list representing the standard errors of \code{Y}. Or a character string specifying the column name in \code{data_list} for SD.}

\item{Omega}{Either a list of precision matrices (one for each dataset) or a single precision matrix (shared across all datasets).}

\item{data_list}{A list of data frames, where each data frame corresponds to a single dataset.}

\item{grid}{A numeric vector representing the grid of PSD (Predictive Standard Deviation) values.}

\item{likelihood}{A character string specifying the likelihood function to use. Options are `gaussian` and `poisson`.}

\item{num_basis}{An integer specifying the number of O-Spline basis functions.}

\item{betaprec}{A numeric value representing the precision of the fixed effects coefficients.}

\item{order}{An integer specifying the order of the Integrated Wiener Process (IWP) prior.}

\item{pred_step}{A numeric value specifying the prediction step size.}

\item{penalty}{A numeric value representing the lambda value for the Dirichlet prior.}

\item{num_cores}{An integer specifying the number of cores to use for parallel processing.}

\item{verbose}{A logical value. If \code{TRUE}, shows progress messages and timing for each step.}
}
\value{
A \code{fash} object containing:
  \describe{
    \item{\code{prior_weights}}{Estimated prior weights for PSD values.}
    \item{\code{posterior_weights}}{Posterior weight matrix of PSD values.}
    \item{\code{psd_grid}}{PSD grid values.}
    \item{\code{lfdr}}{Local false discovery rate for each dataset.}
    \item{\code{settings}}{A list of settings used in the FASH pipeline.}
    \item{\code{fash_data}}{A structured list of data components.}
    \item{\code{L_matrix}}{Likelihood matrix used in the FASH pipeline.}
    \item{\code{eb_result}}{Empirical Bayes estimation results.}
  }
}
\description{
This function performs the full FASH pipeline, including data setup, likelihood computation,
empirical Bayes estimation, and outputs a structured \code{fash} object.
}
\examples{
set.seed(1)
data_list <- list(
  data.frame(y = rpois(5, lambda = 5), x = 1:5, offset = 0),
  data.frame(y = rpois(5, lambda = 5), x = 1:5, offset = 0)
)
grid <- seq(0, 2, length.out = 10)
result <- fash(data_list = data_list, Y = "y", smooth_var = "x", offset = "offset", grid = grid, likelihood = "poisson", verbose = TRUE)
print(result)

}
