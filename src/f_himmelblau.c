#include "soobench.h"

const double f_himmelblau(const double *x, const size_t n) {
  const double x1 = x[0];
  const double x2 = x[1];

  const double c1 = x1 * x1;
  const double c2 = x2 * x2;

  const double c3 = (c1 + x2 - 11);
  const double c4 = (x1 + c2 - 7);

  return c3 * c3 + c4 * c4;
}
