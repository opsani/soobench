#include <math.h>
#include "soobench.h"

const double f_number_of_active_faces(const double *x, const size_t n) {
  double sum = 0.0;
  double max = -1.0;
  size_t i;
  /* Calculate both sum as well as maximum in one pass: */
  for (i = 0; i < n; ++i) {
    const double g = log(fabs(x[i]) + 1.0);
    if (g > max)
      max = g;

    sum += x[i];
  }
  const double gsum = log(fabs(sum) + 1.0);
  return gsum > max ? gsum : max;
}
