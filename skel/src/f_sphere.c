#include <stdlib.h>
#include <math.h>

const double f_sphere(const double *x, const size_t n) {
    size_t i;
    double res = 0.0;
    for (i = 0; i < n; ++i) {
        res += x[i] * x[i];
    }
    return sqrt(res);
}
