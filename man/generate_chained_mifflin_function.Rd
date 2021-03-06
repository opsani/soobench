% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/f_chained_mifflin_I.R
\name{generate_chained_mifflin_function}
\alias{generate_chained_mifflin_function}
\title{Chained Mifflin 2 function generator.}
\usage{
generate_chained_mifflin_function(dimensions)
}
\arguments{
\item{dimensions}{[\code{integer(1)}] Size of parameter space.}
}
\value{
A \code{soo_function}.
}
\description{
The chained Mifflin function 2 is defined as
}
\details{
\deqn{f(x) = \sum_{i=1}^{n-1} \left(-x_i + 2(x_i^2 + x_{i+1}^2 - 1) + 1.75|x_i^2 + x_{i+1}^2 - 1|\right)}
}
\references{
Haarala, M. and Miettinen, K. and Maekelae, M. M., New limited
memory bundle method for large-scale nonsmooth optimization.
}
