#include "sexp_macros.h"

static R_INLINE
double f_griewank(const double *parameters, const size_t number_of_parameters) {
    size_t i;
    double sum = 0.0, product = 1.0;
    
    for (i = 0; i < number_of_parameters; ++i) {
        const double current_parameter = parameters[i];
        sum += current_parameter * current_parameter;
        product *= cos(current_parameter / sqrt((double) (i+1)));        
    }
    return (1 + sum / 4000.0 - product);
}

SEXP do_f_griewank(SEXP s_x) {
    UNPACK_REAL_VECTOR(s_x, x, n);
    return ScalarReal(f_griewank(x, n));
}
