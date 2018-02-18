//
// File: myNNFunc_2000_R086_types.h
//
// MATLAB Coder version            : 3.2
// C/C++ source code generated on  : 18-Feb-2018 13:49:43
//
#ifndef MYNNFUNC_2000_R086_TYPES_H
#define MYNNFUNC_2000_R086_TYPES_H

// Include Files
#include "rtwtypes.h"

// Type Definitions
#ifndef struct_emxArray__common
#define struct_emxArray__common

struct emxArray__common
{
  void *data;
  int *size;
  int allocatedSize;
  int numDimensions;
  boolean_T canFreeData;
};

#endif                                 //struct_emxArray__common

#ifndef struct_emxArray_real32_T
#define struct_emxArray_real32_T

struct emxArray_real32_T
{
  float *data;
  int *size;
  int allocatedSize;
  int numDimensions;
  boolean_T canFreeData;
};

#endif                                 //struct_emxArray_real32_T
#endif

//
// File trailer for myNNFunc_2000_R086_types.h
//
// [EOF]
//
