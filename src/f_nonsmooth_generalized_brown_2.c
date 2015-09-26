#include "soobench.h"

const double f_nonsmooth_generalized_brown_2(const double *x, const size_t n) {
  double sum = 0.0;
  size_t i;
  for (i = 0; i < n - 1; ++i) {
    const double xi = x[i];
    const double xip = x[i + 1];
    const double c1 = pow(fabs(xi), xip * xip + 1.0);
    const double c2 = pow(fabs(xip), xi * xi + 1.0);
    sum += c1 + c2;
  }
  return sum;
}
