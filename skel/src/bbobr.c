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

#define INITIALIZE_BBOB_FUNCTION(FID, TID, DIM)                         \
    if (init == 0 ||                                                    \
        last_fid != FID || last_tid != TID || last_d != DIM) {          \
        if (init != 0)                                                  \
            bbob_free();                                                \
	bbob_init(fid, tid, d);                                         \
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

static double bbob_eval(unsigned int fid, unsigned int tid, unsigned int d, double *x) {
    INITIALIZE_BBOB_FUNCTION(fid, tid, d)

    switch(last_fid) {
    case  1: return  f1(x).Fval;
    case  2: return  f2(x).Fval;
    case  3: return  f3(x).Fval;
    case  4: return  f4(x).Fval;
    case  5: return  f5(x).Fval;
    case  6: return  f6(x).Fval;
    case  7: return  f7(x).Fval;
    case  8: return  f8(x).Fval;
    case  9: return  f9(x).Fval;
    case 10: return f10(x).Fval;
    case 11: return f11(x).Fval;
    case 12: return f12(x).Fval;
    case 13: return f13(x).Fval;
    case 14: return f14(x).Fval;
    case 15: return f15(x).Fval;
    case 16: return f16(x).Fval;
    case 17: return f17(x).Fval;
    case 18: return f18(x).Fval;
    case 19: return f19(x).Fval;
    case 20: return f20(x).Fval;
    case 21: return f21(x).Fval;
    case 22: return f22(x).Fval;
    case 23: return f23(x).Fval;
    case 24: return f24(x).Fval;
    default: exit(-1);
    }
}

static double bbob_fopt(unsigned int fid, unsigned int tid, unsigned int d) {
    INITIALIZE_BBOB_FUNCTION(fid, tid, d)

    double fopt = computeFopt(fid, tid);
    return fopt;
}

static void bbob_xopt(unsigned int fid, unsigned int tid, unsigned int d, double *x) {
    int i, rseed;    
    INITIALIZE_BBOB_FUNCTION(fid, tid, d);
    
    for (i = 0; i < d; ++i)
	x[i] = 0;

    /* Evaluate function once to initialize Xopt: */
    bbob_eval(fid, tid, d, x);

    for (i = 0; i < d; ++i)
	x[i] = Xopt[i];    
}

SEXP do_bbob_eval(SEXP s_fid, SEXP s_tid, SEXP s_par) {
    double value;
    
    /* Unpack arguments: */
    UNPACK_INT(s_fid, fid);
    UNPACK_INT(s_tid, tid);
    UNPACK_REAL_VECTOR(s_par, par, dim);
    
    /* Evaluate function: */
    value = bbob_eval(fid, tid, dim, par);
    return(ScalarReal(value));
}

SEXP do_bbob_opt(SEXP s_fid, SEXP s_tid, SEXP s_dim) {
    SEXP s_res, s_par, s_value;

    /* Unpack arguments: */
    UNPACK_INT(s_fid, fid);
    UNPACK_INT(s_tid, tid);
    UNPACK_INT(s_dim, dim);
        
    /* Allocate result objects: */
    PROTECT(s_res   = allocVector(VECSXP, 2));
    PROTECT(s_par   = allocVector(REALSXP, dim));
    PROTECT(s_value = allocVector(REALSXP, 1));
    double *par = REAL(s_par);
    double *value = REAL(s_value);

    /* Calculate optimal parameters and value: */
    value[0] = bbob_fopt(fid, tid, dim);
    bbob_xopt(fid, tid, dim, par);
    
    SET_VECTOR_ELT(s_res, 0, s_par);
    SET_VECTOR_ELT(s_res, 1, s_value);
    UNPROTECT(3); /* s_res, s_par, s_value */

    return(s_res);
}
