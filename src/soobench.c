#include <R.h>
#include <Rinternals.h>

#include "soobench.h"

#define R_SOOFUNCTION(FUNCTION)                                                \
  SEXP do_##FUNCTION(SEXP s_x) {                                               \
    R_len_t n_parameters, n_values, current_value;                             \
    n_parameters = 0;                                                          \
    n_values = 0;                                                              \
    if (!isReal(s_x))                                                          \
      error("s_x must be numeric.");                                           \
                                                                               \
    double *x = REAL(s_x);                                                     \
    if (isMatrix(s_x)) {                                                       \
      n_parameters = nrows(s_x);                                               \
      n_values = ncols(s_x);                                                   \
    } else if (isVector(s_x)) {                                                \
      n_parameters = length(s_x);                                              \
      n_values = 1;                                                            \
    }                                                                          \
                                                                               \
    SEXP s_res;                                                                \
    PROTECT(s_res = allocVector(REALSXP, n_values));                           \
    double *res = REAL(s_res);                                                 \
    for (current_value = 0; current_value < n_values; ++current_value) {       \
      res[current_value] =                                                     \
          FUNCTION(x + current_value * n_parameters, n_parameters);            \
    }                                                                          \
    UNPROTECT(1); /* s_res */                                                  \
    return s_res;                                                              \
  }

R_SOOFUNCTION(f_ackley)
R_SOOFUNCTION(f_beale)
R_SOOFUNCTION(f_branin)
R_SOOFUNCTION(f_double_sum)
R_SOOFUNCTION(f_ellipsoidal)
R_SOOFUNCTION(f_generalized_maxq)
R_SOOFUNCTION(f_generalized_mxhilb)
R_SOOFUNCTION(f_goldstein_price)
R_SOOFUNCTION(f_griewank)
R_SOOFUNCTION(f_himmelblau)
R_SOOFUNCTION(f_kotanchek)
R_SOOFUNCTION(f_mexican_hat)
R_SOOFUNCTION(f_rastrigin)
R_SOOFUNCTION(f_rosenbrock)
R_SOOFUNCTION(f_sphere)
R_SOOFUNCTION(f_discus)
/* R_SOOFUNCTION(f_schwefel) */
R_SOOFUNCTION(f_weierstrass)
R_SOOFUNCTION(f_number_of_active_faces)
R_SOOFUNCTION(f_nonsmooth_generalized_brown_2)
R_SOOFUNCTION(f_chained_cb3_i)
R_SOOFUNCTION(f_chained_cb3_ii)
