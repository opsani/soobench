/*
 * bbobr.c - R interface to the BBOB 2009 test functions
 *
 * Author: Olaf Mersmann (OME) <olafm@statistik.tu-dortmund.de>
 */

#include <R.h>
#include <Rinternals.h>

#include "sexp_macros.h"

#include "bbobStructures.h"
#include "benchmarkshelper.h"
#include "benchmarks.h"
#include "benchmarksnoisy.h"
#include "benchmarksdeclare.h"

static int init = 0;
static unsigned int last_fid;
static unsigned int last_tid;
static unsigned int last_d;

#define INITIALIZE_BBOB_FUNCTION(FID, TID, DIM)                                \
  if (init == 0 || last_fid != FID || last_tid != TID || last_d != DIM) {      \
    if (init != 0)                                                             \
      bbob_free();                                                             \
    bbob_init(fid, tid, d);                                                    \
  }

static void bbob_init(unsigned int fid, int tid, unsigned int d) {
  isInitDone = 0;
  DIM = last_d = d;

  initbenchmarkshelper();
  initbenchmarks();
  initbenchmarksnoisy();
  trialid = last_tid = tid;
  last_fid = fid;
  init = 1;

  Fopt = computeFopt(fid, tid);
}

static void bbob_free() {
  finibenchmarks();
  finibenchmarksnoisy();
  finibenchmarkshelper();
  init = 0;
}

static double bbob_eval(unsigned int fid, unsigned int tid, unsigned int d,
                        double *x) {
  INITIALIZE_BBOB_FUNCTION(fid, tid, d)

  switch (last_fid) {
  case 1:
    return f1(x).Fval;
  case 2:
    return f2(x).Fval;
  case 3:
    return f3(x).Fval;
  case 4:
    return f4(x).Fval;
  case 5:
    return f5(x).Fval;
  case 6:
    return f6(x).Fval;
  case 7:
    return f7(x).Fval;
  case 8:
    return f8(x).Fval;
  case 9:
    return f9(x).Fval;
  case 10:
    return f10(x).Fval;
  case 11:
    return f11(x).Fval;
  case 12:
    return f12(x).Fval;
  case 13:
    return f13(x).Fval;
  case 14:
    return f14(x).Fval;
  case 15:
    return f15(x).Fval;
  case 16:
    return f16(x).Fval;
  case 17:
    return f17(x).Fval;
  case 18:
    return f18(x).Fval;
  case 19:
    return f19(x).Fval;
  case 20:
    return f20(x).Fval;
  case 21:
    return f21(x).Fval;
  case 22:
    return f22(x).Fval;
  case 23:
    return f23(x).Fval;
  case 24:
    return f24(x).Fval;
  /* Noisy funcrions: */
  case 101:
    return f101(x).Fval;
  case 102:
    return f102(x).Fval;
  case 103:
    return f103(x).Fval;
  case 104:
    return f104(x).Fval;
  case 105:
    return f105(x).Fval;
  case 106:
    return f106(x).Fval;
  case 107:
    return f107(x).Fval;
  case 108:
    return f108(x).Fval;
  case 109:
    return f109(x).Fval;
  case 110:
    return f110(x).Fval;
  case 111:
    return f111(x).Fval;
  case 112:
    return f112(x).Fval;
  case 113:
    return f113(x).Fval;
  case 114:
    return f114(x).Fval;
  case 115:
    return f115(x).Fval;
  case 116:
    return f116(x).Fval;
  case 117:
    return f117(x).Fval;
  case 118:
    return f118(x).Fval;
  case 119:
    return f119(x).Fval;
  case 120:
    return f120(x).Fval;
  case 121:
    return f121(x).Fval;
  case 122:
    return f122(x).Fval;
  case 123:
    return f123(x).Fval;
  case 124:
    return f124(x).Fval;
  default:
    return R_NaN;
  }
}

static double bbob_fopt(unsigned int fid, unsigned int tid, unsigned int d) {
  INITIALIZE_BBOB_FUNCTION(fid, tid, d)

  double fopt = computeFopt(fid, tid);
  return fopt;
}

static void bbob_xopt(unsigned int fid, unsigned int tid, unsigned int d,
                      double *x) {
  int i;
  INITIALIZE_BBOB_FUNCTION(fid, tid, d);

  for (i = 0; i < d; ++i)
    x[i] = 0;

  /* Evaluate function once to initialize Xopt: */
  bbob_eval(fid, tid, d, x);

  for (i = 0; i < d; ++i)
    x[i] = Xopt[i];
}

SEXP do_bbob_eval(SEXP s_fid, SEXP s_tid, SEXP s_x) {
  R_len_t n_parameters = 0, n_values = 0, current_value;
  /* Unpack arguments: */
  UNPACK_INT(s_fid, fid);
  UNPACK_INT(s_tid, tid);

  if (!isReal(s_x))
    error("s_x must be numeric.");

  double *x = REAL(s_x);
  if (isMatrix(s_x)) {
    n_parameters = nrows(s_x);
    n_values = ncols(s_x);
  } else if (isVector(s_x)) {
    n_parameters = length(s_x);
    n_values = 1;
  }

  SEXP s_res;
  PROTECT(s_res = allocVector(REALSXP, n_values));
  double *res = REAL(s_res);
  for (current_value = 0; current_value < n_values; ++current_value) {
    res[current_value] = bbob_eval(fid, tid, (int)n_parameters,
                                   x + current_value * n_parameters);
  }
  UNPROTECT(1); /* s_res */
  return s_res;
}

SEXP do_bbob_opt(SEXP s_fid, SEXP s_tid, SEXP s_dim) {
  SEXP s_res, s_par, s_value;

  /* Unpack arguments: */
  UNPACK_INT(s_fid, fid);
  UNPACK_INT(s_tid, tid);
  UNPACK_INT(s_dim, dim);

  /* Allocate result objects: */
  PROTECT(s_res = allocVector(VECSXP, 2));
  PROTECT(s_par = allocVector(REALSXP, dim));
  PROTECT(s_value = allocVector(REALSXP, 1));
  double *par = REAL(s_par);
  double *value = REAL(s_value);

  /* Calculate optimal parameters and value: */
  value[0] = bbob_fopt(fid, tid, dim);
  bbob_xopt(fid, tid, dim, par);

  SET_VECTOR_ELT(s_res, 0, s_par);
  SET_VECTOR_ELT(s_res, 1, s_value);
  UNPROTECT(3); /* s_res, s_par, s_value */

  return (s_res);
}

SEXP do_set_bbob_noise_seed(SEXP s_seed) {
  UNPACK_INT(s_seed, seed);
  setNoiseSeed(seed, seed);
  return (s_seed);
}
