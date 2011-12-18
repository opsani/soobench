#include "soobench.h"

const double f_ackley(const double *x, const size_t n) {
    const double a = 20;
    const double b = 0.2;
    const double c = 2 * M_PI;
    double c1 = 0.0, c2 = 0.0;
    size_t i;

    for (i = 0; i < n; ++i) {
        const double xi = x[i];
        c1 += xi * xi;
        c2 += cos(c * xi);
    }
    c1 = sqrt(c1 / n);
    c2 /= n;
    
    return -a * exp(-b * c1) - exp(c2) + a + exp(1);
}
