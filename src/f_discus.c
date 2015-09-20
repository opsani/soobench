#include "soobench.h"

const double f_discus(const double *x, const size_t n) {
    double sum = x[0] * x[0] * 1.0e6;
    size_t i;
    for (i = 1; i < n; ++i) {
        sum += x[i] * x[i];
    }
    return sum;
}
