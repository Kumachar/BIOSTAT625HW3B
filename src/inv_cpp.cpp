
#include <RcppArmadillo.h>
// [[Rcpp::depends(RcppArmadillo)]]

// [[Rcpp::export]]
arma::mat invertMatrix(const arma::mat& M) {
  return arma::inv(M);
}
