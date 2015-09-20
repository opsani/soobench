#ifndef __SOOBENCH_H__
#define __SOOBENCH_H__

#include <stdlib.h>
#include <math.h>

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

#define SOOFUNCTION(NAME) const double NAME(const double *x, const size_t n);

SOOFUNCTION(f_ackley)
SOOFUNCTION(f_beale)
SOOFUNCTION(f_branin)
SOOFUNCTION(f_discus)
SOOFUNCTION(f_double_sum)
SOOFUNCTION(f_ellipsoidal)
SOOFUNCTION(f_generalized_maxq)
SOOFUNCTION(f_generalized_mxhilb)
SOOFUNCTION(f_goldstein_price)
SOOFUNCTION(f_griewank)
SOOFUNCTION(f_himmelblau)
SOOFUNCTION(f_kotanchek)
SOOFUNCTION(f_mexican_hat)
SOOFUNCTION(f_rastrigin)
SOOFUNCTION(f_rosenbrock)
/* SOOFUNCTION(f_schwefel) */
SOOFUNCTION(f_sphere)
SOOFUNCTION(f_weierstrass)
SOOFUNCTION(f_number_of_active_faces)
SOOFUNCTION(f_nonsmooth_generalized_brown_2)
SOOFUNCTION(f_chained_cb3_i)
SOOFUNCTION(f_chained_cb3_ii)

#undef SOOFUNCTION /* Hygiene */
#endif
