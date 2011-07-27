#include "sexp_macros.h"

SEXP do_f_schwefel(SEXP s_x) {
    double res = 0.0;
    size_t i;
    UNPACK_REAL_VECTOR(s_x, x, n);
    
    for (i = 0; i < n; ++i) {
        const double xi = x[i];
        res += - xi * sin(sqrt(abs(xi)));
    }
    res += 418.9829 * n;
    return ScalarReal(res);
}
