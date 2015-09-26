#include "soobench.h"

const double f_branin(const double *x, const size_t n) {
  const double a = 1;
  const double b = 5.1 / ((2.0 * M_PI) * (2.0 * M_PI));
  const double c = 5.0 / M_PI;
  const double d = 6.0;
  const double e = 10.0;
  const double f = 1 / (8 * M_PI);
  const double x1 = x[0];
  const double x2 = x[1];
  const double c1 = (x2 - b * x1 * x1 + c * x1 - d);
  return a * c1 * c1 + e * (1 - f) * cos(x1) + e;
}
