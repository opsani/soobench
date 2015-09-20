#include "soobench.h"

const double f_goldstein_price(const double *x, const size_t n) {
    const double x1 = x[0];
    const double x2 = x[1];

    const double c1 = x1 + x2 + 1;
    const double c2 = 19 - 14 * x1 +  3 * x1 * x1 - 14 * x2 
        + 6 * x1 * x2 +  3 * x2 * x2;
    const double c3 = 2 * x1 - 3 * x2;
    const double c4 = 18 - 32 * x1 + 12 * x1 * x1 + 48 * x2 
        - 36 * x1 * x2 + 27 * x2 * x2;

    const double res = (1 + c1 * c1 * c2) * (30 + c3 * c3 * c4);
    return res;
}
