% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/qr.r
\name{qr}
\alias{qr}
\alias{qr_R}
\alias{qr_Q}
\title{QR Decomposition Methods}
\usage{
qr_R(x)

qr_Q(x, R)
}
\arguments{
\item{x}{A shaq.}

\item{R}{A regular matrix. This argument is optional, in that if it is not supplied
explicitly, then it will be computed in the background.  But if have already
computed R, supplying it here will improve performance (by avoiding
needlessly recomputing it).}
}
\value{
Q (a shaq) or R (a regular matrix).
}
\description{
QR factorization.
}
\details{
\eqn{R} is formed by first forming the crossproduct \eqn{X^T X} and taking
its Cholesky factorization.  But then \eqn{Q = X R^{-1}}.  Inverting \eqn{R}
is handled by an efficient triangular inverse routine.
}
\section{Communication}{

The operation is completely local except for forming the crossproduct, which
is an \code{allreduce()} call, quadratic on the number of columns.
}

\examples{
\dontrun{
library(kazaam)
x = ranshaq(runif, 10, 3)

R = qr_R(x)
comm.print(R)

Q = qr_Q(x, R)
Q

finalize()
}

}
