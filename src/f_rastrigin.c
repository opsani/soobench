#include <stdlib.h>
#include "pi.h"

const double f_rastrigin(const double *x, const size_t n) {
  double res = 0.0;
  size_t i;

  for (i = 0; i < n; ++i) {
    const double xi = x[i];
    res += xi * xi - 10.0 * cos(2 * M_PI * xi) + 10;
  }
  return res;
}
