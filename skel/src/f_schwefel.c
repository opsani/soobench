#include "soobench.h"

const double f_schwefel(const double *x, const size_t n) {
    double res = 0.0;
    size_t i;
    
    for (i = 0; i < n; ++i) {
        const double xi = x[i];
        res += xi * sin(sqrt(abs(xi)));
    }
    return 418.9829 * n + res;
}
