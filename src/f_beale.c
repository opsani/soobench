#include "soobench.h"

const double f_beale(const double *x, const size_t n) {
  const double x1 = x[0];
  const double x2 = x[1];

  const double c1 = 1 - x2;
  const double c2 = 1 - x2 * x2;
  const double c3 = 1 - x2 * x2 * x2;

  const double c4 = 1.5 - x1 * c1;
  const double c5 = 2.25 - x1 * c2;
  const double c6 = 2.625 - x1 * c3;

  return c4 * c4 + c5 * c5 + c6 * c6;
}
