% Generated by roxygen2 (4.0.1): do not edit by hand
\name{predict}
\alias{predict}
\title{Recommender model predictions}
\arguments{
\item{r}{Object returned by \code{\link{Reco}}()}

\item{outfile}{Name of the output file for prediction}

\item{verbose}{Whether to show detailed information. Default is \code{TRUE}.}
}
\description{
This method is a member function of class "\code{RecoSys}"
that predicts unknown entries in the rating matrix.
Prior to calling this method, model needs to be trained by calling
\code{$\link{train}()}, and testing data also must be set through
\code{$\link{convert_test}()}.
Prediction results will be written into the specified file, one value
per line, corresponding to the testing data.

The common usage of this method is
\preformatted{r = Reco()
r$predict(outfile, verbose = TRUE)}
}
\examples{
set.seed(123) # this is a randomized algorithm
trainset = system.file("dat", "smalltrain.txt", package = "recosystem")
testset = system.file("dat", "smalltest.txt", package = "recosystem")
r = Reco()
r$convert_train(trainset)
r$convert_test(testset)
r$train(opts = list(dim = 100, niter = 100,
                    cost.p = 0.001, cost.q = 0.001))
outfile = tempfile()
r$predict(outfile)

## Compare the first few true values of testing data
## with predicted ones
print(read.table(testset, header = FALSE, sep = " ", nrows = 10)$V3)
print(scan(outfile, n = 10))
}
\author{
Yixuan Qiu <\url{http://statr.me}>
}
\references{
LIBMF: A Matrix-factorization Library for Recommender Systems.
\url{http://www.csie.ntu.edu.tw/~cjlin/libmf/}

Y. Zhuang, W.-S. Chin, Y.-C. Juan, and C.-J. Lin.
A Fast Parallel Stochastic Gradient Method for Matrix Factorization in Shared Memory Systems.
Technical report 2014.
}
\seealso{
\code{\link{convert}}, \code{\link{train}}
}

