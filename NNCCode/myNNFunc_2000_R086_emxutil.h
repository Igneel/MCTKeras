//
// File: myNNFunc_2000_R086_emxutil.h
//
// MATLAB Coder version            : 3.2
// C/C++ source code generated on  : 18-Feb-2018 13:49:43
//
#ifndef MYNNFUNC_2000_R086_EMXUTIL_H
#define MYNNFUNC_2000_R086_EMXUTIL_H

// Include Files
#include <cmath>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include "rtwtypes.h"
#include "myNNFunc_2000_R086_types.h"

// Function Declarations
extern void emxEnsureCapacity(emxArray__common *emxArray, int oldNumel, int
  elementSize);
extern void emxFree_real32_T(emxArray_real32_T **pEmxArray);
extern void emxInit_real32_T(emxArray_real32_T **pEmxArray, int numDimensions);

#endif

//
// File trailer for myNNFunc_2000_R086_emxutil.h
//
// [EOF]
//
