#include "sexp_macros.h"

SEXP do_f_rosenbrock(SEXP s_x) {
    double res = 0.0;
    size_t i;
    UNPACK_REAL_VECTOR(s_x, x, n);
    
    for (i = 1; i < n; ++i) {
        const double xp = x[i-1];
        const double xc = x[i];
        
        const double c1 = xp * xp - xc;
        const double c2 = xp - 1.0;
        res += 100 * c1 * c1 + c2 * c2;
    }
    return ScalarReal(res);
}
