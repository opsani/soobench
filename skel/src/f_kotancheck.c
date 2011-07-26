#include "sexp_macros.h"

SEXP do_f_kotancheck(SEXP s_x) {
    UNPACK_REAL_VECTOR(s_x, x, n);
    const double x1 = x[0];
    const double x2 = x[1];

    const double c1 = x2 - 1.2;
    const double c2 = x1 - 2.5;
    const double res = -exp(- c1 * c2) / (1 + c2 * c2);
    return ScalarReal(res);
}
