#include "soobench.h"

const double f_kotancheck(const double *x, const size_t n) {
    const double x1 = x[0];
    const double x2 = x[1];

    const double c1 = x2 - 1.2;
    const double c2 = x1 - 2.5;
    return -exp(- c1 * c2) / (1 + c2 * c2);
}
