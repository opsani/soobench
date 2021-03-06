% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rotate_parameter_space.R
\name{random_rotation_matrix}
\alias{random_rotation_matrix}
\title{Generate a random \code{d}-dimensional rotation matrix.}
\usage{
random_rotation_matrix(d)
}
\arguments{
\item{d}{Dimension of desired rotation matrix.}
}
\value{
A random \eqn{d \times d} rotation matrix.
}
\description{
The algorithm used to randomly create the rotation matrix is due
to R Salomon (see reference). No guarantee is given that the
generated rotation matrices are uniformly distributed in any
sense.
}
\references{
Salomon R. Re-evaluating genetic algorithm performance
under coordinate rotation of benchmark functions. A survey of some
theoretical and practical
aspects of genetic algorithms. Biosystems. 1996;39(3):263-78.
}
