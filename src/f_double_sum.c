#include "soobench.h"

const double f_double_sum(const double *x, const size_t n) {
  double res = 0.0;
  size_t i, j;
  for (i = 0; i < n; ++i) {
    double tmp = 0.0;
    for (j = 0; j <= i; ++j) {
      tmp += x[j];
    }
    res += tmp * tmp;
  }
  return res;
}
