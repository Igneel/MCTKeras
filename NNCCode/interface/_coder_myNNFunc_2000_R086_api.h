/*
 * File: _coder_myNNFunc_2000_R086_api.h
 *
 * MATLAB Coder version            : 3.2
 * C/C++ source code generated on  : 18-Feb-2018 13:49:43
 */

#ifndef _CODER_MYNNFUNC_2000_R086_API_H
#define _CODER_MYNNFUNC_2000_R086_API_H

/* Include Files */
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"
#include <stddef.h>
#include <stdlib.h>
#include "_coder_myNNFunc_2000_R086_api.h"

/* Type Definitions */
#ifndef struct_emxArray_real32_T
#define struct_emxArray_real32_T

struct emxArray_real32_T
{
  real32_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};

#endif                                 /*struct_emxArray_real32_T*/

#ifndef typedef_emxArray_real32_T
#define typedef_emxArray_real32_T

typedef struct emxArray_real32_T emxArray_real32_T;

#endif                                 /*typedef_emxArray_real32_T*/

/* Variable Declarations */
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;

/* Function Declarations */
extern void myNNFunc_2000_R086(emxArray_real32_T *x1, emxArray_real32_T *b_y1);
extern void myNNFunc_2000_R086_api(const mxArray * const prhs[1], const mxArray *
  plhs[1]);
extern void myNNFunc_2000_R086_atexit(void);
extern void myNNFunc_2000_R086_initialize(void);
extern void myNNFunc_2000_R086_terminate(void);
extern void myNNFunc_2000_R086_xil_terminate(void);

#endif

/*
 * File trailer for _coder_myNNFunc_2000_R086_api.h
 *
 * [EOF]
 */
