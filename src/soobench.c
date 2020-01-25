#include <R.h>
#include <Rinternals.h>

#include "soobench.h"
#include "bbobr.h"
#include "f_batman.h"
#include "f_happycat.h"

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

static const R_CallMethodDef CallEntries[] = {
    {"do_f_ackley",                        (DL_FUNC) &do_f_ackley,                        1},
    {"do_f_beale",                         (DL_FUNC) &do_f_beale,                         1},
    {"do_f_branin",                        (DL_FUNC) &do_f_branin,                        1},
    {"do_f_chained_cb3_i",                 (DL_FUNC) &do_f_chained_cb3_i,                 1},
    {"do_f_chained_cb3_ii",                (DL_FUNC) &do_f_chained_cb3_ii,                1},
    {"do_f_discus",                        (DL_FUNC) &do_f_discus,                        1},
    {"do_f_double_sum",                    (DL_FUNC) &do_f_double_sum,                    1},
    {"do_f_ellipsoidal",                   (DL_FUNC) &do_f_ellipsoidal,                   1},
    {"do_f_generalized_maxq",              (DL_FUNC) &do_f_generalized_maxq,              1},
    {"do_f_generalized_mxhilb",            (DL_FUNC) &do_f_generalized_mxhilb,            1},
    {"do_f_goldstein_price",               (DL_FUNC) &do_f_goldstein_price,               1},
    {"do_f_griewank",                      (DL_FUNC) &do_f_griewank,                      1},
    {"do_f_himmelblau",                    (DL_FUNC) &do_f_himmelblau,                    1},
    {"do_f_kotanchek",                     (DL_FUNC) &do_f_kotanchek,                     1},
    {"do_f_mexican_hat",                   (DL_FUNC) &do_f_mexican_hat,                   1},
    {"do_f_nonsmooth_generalized_brown_2", (DL_FUNC) &do_f_nonsmooth_generalized_brown_2, 1},
    {"do_f_number_of_active_faces",        (DL_FUNC) &do_f_number_of_active_faces,        1},
    {"do_f_rastrigin",                     (DL_FUNC) &do_f_rastrigin,                     1},
    {"do_f_rosenbrock",                    (DL_FUNC) &do_f_rosenbrock,                    1},
    {"do_f_sphere",                        (DL_FUNC) &do_f_sphere,                        1},
    {"do_f_weierstrass",                   (DL_FUNC) &do_f_weierstrass,                   1},
    {"do_bbob_eval",                       (DL_FUNC) &do_bbob_eval,                       3},
    {"do_bbob_opt",                        (DL_FUNC) &do_bbob_opt,                        3},
    {"do_set_bbob_noise_seed",             (DL_FUNC) &do_set_bbob_noise_seed,             1},
    {"do_eval_batman",                     (DL_FUNC) &do_eval_batman,                     2},
    {"do_eval_happycat",                   (DL_FUNC) &do_eval_happycat,                   2},
    {NULL, NULL, 0}
};

void R_init_soobench(DllInfo *dll)
{
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
