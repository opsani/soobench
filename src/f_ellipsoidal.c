#include "soobench.h"

const double f_ellipsoidal(const double *x, const size_t n) {
  double res = 0.0;
  size_t i;

  const double c1 = 1.0 / n;
  for (i = 0; i < n; ++i) {
    const double xi = x[i];
    const double c2 = 6.0 * (i + 1) * c1;
    res += pow(10.0, c2) * xi * xi;
  }
  return res;
}
