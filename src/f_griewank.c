#include "soobench.h"

const double f_griewank(const double *x, const size_t n) {
  size_t i;
  double sum = 0.0, product = 1.0;

  for (i = 0; i < n; ++i) {
    const double xi = x[i];
    sum += xi * xi;
    product *= cos(xi / sqrt((double)(i + 1)));
  }
  return (1 + sum / 4000.0 - product);
}
