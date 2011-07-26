#include "sexp_macros.h"

SEXP do_f_rastrigin(SEXP s_x) {
    double res = 0.0;
    size_t i;
    UNPACK_REAL_VECTOR(s_x, x, n);
    
    for (i = 0; i < n; ++i) {
        const double xi = x[i];
        res += xi * xi - 10 * cos( 2 * M_PI * xi) + 10;
    }
    return ScalarReal(res);
}
