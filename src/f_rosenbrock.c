#include "soobench.h"

const double f_rosenbrock(const double *x, const size_t n) {
  double res = 0.0;
  size_t i;

  for (i = 1; i < n; ++i) {
    const double xp = x[i - 1];
    const double xc = x[i];

    const double c1 = xp * xp - xc;
    const double c2 = xp - 1.0;
    res += 100 * c1 * c1 + c2 * c2;
  }
  return res;
}
