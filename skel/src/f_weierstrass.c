#include "sexp_macros.h"

SEXP do_f_weierstrass(SEXP s_x) {
    const size_t k_max = 20;
    const double a = 0.5;
    const double b = 3.0;
    double c1 = 0.0, c2 = 0.0, res = 0.0;
    size_t i, k;
    UNPACK_REAL_VECTOR(s_x, x, n);
    
    for (k = 0; k <= k_max; ++k) {
        const double a_k = pow(a, k);
        const double b_k = pow(b, k);
        for (i = 0; i < n; ++i) {
            const double xi = x[i];
            c1 += a_k * cos(2 * M_PI * b_k * (xi + 0.5));
        }
        c2 += a_k * cos(2 * M_PI * b_k * 0.5);
    }
    res = c1 - n * c2;
    return ScalarReal(res);
}
