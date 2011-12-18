#include "soobench.h"

const double f_mexican_hat(const double *x, const size_t n) {
    double res = 0.0;
    size_t i;
    
    for (i = 0; i < n; ++i) {
        res += x[i] * x[i];
    }
    return -(1.0 - res) * exp(-res * 0.5);
}
