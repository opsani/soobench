#include <math.h>
#include "soobench.h"

const double f_generalized_mxhilb(const double *x, const size_t n) {
    double max = -1.0;
    size_t i, j;
    for (i = 0; i < n; ++i) {
        double tmp = 0.0;
        for (j = 0; j < n; ++j) {
            /* Note: Instead of - 1.0 we have + 1.0 because i and j
             * are each off by one because C arrays are index starting
             * at 0. 
             */
            tmp += x[j] / (i + j + 1.0);
        }
        tmp = fabs(tmp);
        if (tmp > max) max = tmp;
    }
    return max;
}
