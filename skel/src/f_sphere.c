#include "sexp_macros.h"

SEXP do_f_sphere(SEXP s_x) {
    double res = 0.0;
    size_t i;
    UNPACK_REAL_VECTOR(s_x, x, n);
    
    for (i = 0; i < n; ++i) {
        res += x[i] * x[i];
    }
    return ScalarReal(res);
}
