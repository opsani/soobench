#include <Rmath.h>
#include "sexp_macros.h"

SEXP do_f_ackley(SEXP s_x) {
    const double a = 20;
    const double b = 0.2;
    const double c = 2 * M_PI;
    double c1 = 0.0, c2 = 0.0, res;
    size_t i;
    UNPACK_REAL_VECTOR(s_x, x, n);

    for (i = 0; i < n; ++i) {
        const double xi = x[i];
        c1 += xi * xi;
        c2 += cos(c * xi);
    }
    c1 = sqrt(c1 / n);
    c2 /= n;
    
    res = -a * exp(-b * c1) - exp(c2) + a + exp(1);
    return ScalarReal(res);
}
