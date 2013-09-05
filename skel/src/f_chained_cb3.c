#include <math.h>
#include "soobench.h"

static const double max_of_three(const double a, const double b, const double c) {
    double max = a;
    
    if (b > max) max = b;
    if (c > max) max = c;
    return max;
}

const double f_chained_cb3_i(const double *x, const size_t n) {
    double sum = 0.0;
    size_t i;
    for (i = 0; i < n - 1; ++i) {
        const double xi = x[i];
        const double xip = x[i+1];
        const double c1 = pow(xi, 4.0) + pow(xip, 2.0);
        const double c2 = pow(2.0 - xi, 2.0) + pow(2.0 - xip, 2.0);
        const double c3 = 2.0 * exp(xip - xi);
        sum += max_of_three(c1, c2, c3);
    }
    return sum;
}

const double f_chained_cb3_ii(const double *x, const size_t n) {
    double sum1 = 0.0, sum2 = 0.0, sum3 = 0.0;
    size_t i;
    for (i = 0; i < n - 1; ++i) {
        const double xi = x[i];
        const double xip = x[i+1];
        sum1 += pow(xi, 4.0) + pow(xip, 2.0);
        sum2 += pow(2.0 - xi, 2.0) + pow(2.0 - xip, 2.0);
        sum3 += 2.0 * exp(xip - xi);
    }
    return max_of_three(sum1, sum2, sum3);
}
