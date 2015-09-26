#include "soobench.h"

const double f_generalized_maxq(const double *x, const size_t n) {
  double max = x[0] * x[0];
  size_t i;
  for (i = 1; i < n; ++i) {
    const double tmp = x[i] * x[i];
    if (tmp > max)
      max = tmp;
  }
  return max;
}
