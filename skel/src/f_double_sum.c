#include "sexp_macros.h"

SEXP do_f_double_sum(SEXP s_x) {
    double tmp, res = 0.0;
    size_t i, j;
    UNPACK_REAL_VECTOR(s_x, x, n);
    
    for (i = 0; i < n; ++i) {
        tmp = 0.0;
        for (j = 0; j <= i; ++j) {
            tmp += x[j];
        }
        res += tmp * tmp;
    }
    return ScalarReal(res);
}
