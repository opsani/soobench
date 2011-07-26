#include "sexp_macros.h"

SEXP do_f_ellipsoidal(SEXP s_x) {
    double res = 0.0;
    size_t i;
    UNPACK_REAL_VECTOR(s_x, x, n);

    const double c1 = 1.0 / n;
    for (i = 0; i < n; ++i) {
        const double xi = x[i];
        const double c2 = 6.0 * (i+1) * c1;
        res += pow(10.0, c2) * xi * xi;
    }
    return ScalarReal(res);
}
