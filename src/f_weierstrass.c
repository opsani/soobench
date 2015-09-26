#include "soobench.h"

const double f_weierstrass(const double *x, const size_t n) {
  const size_t k_max = 20;
  const double a = 0.5;
  const double b = 3.0;
  double c1 = 0.0, c2 = 0.0;
  size_t i, k;

  for (k = 0; k <= k_max; ++k) {
    const double a_k = pow(a, k);
    const double b_k = pow(b, k);
    for (i = 0; i < n; ++i) {
      const double xi = x[i];
      c1 += a_k * cos(2 * M_PI * b_k * (xi + 0.5));
    }
    c2 += a_k * cos(2 * M_PI * b_k * 0.5);
  }
  return c1 - n * c2;
}
