//
// File: main.cpp
//
// MATLAB Coder version            : 3.2
// C/C++ source code generated on  : 18-Feb-2018 13:49:43
//

//***********************************************************************
// This automatically generated example C main file shows how to call
// entry-point functions that MATLAB Coder generated. You must customize
// this file for your application. Do not modify this file directly.
// Instead, make a copy of this file, modify it, and integrate it into
// your development environment.
//
// This file initializes entry-point function arguments to a default
// size and value before calling the entry-point functions. It does
// not store or use any values returned from the entry-point functions.
// If necessary, it does pre-allocate memory for returned values.
// You can use this file as a starting point for a main function that
// you can deploy in your application.
//
// After you copy the file, and before you deploy it, you must make the
// following changes:
// * For variable-size function arguments, change the example sizes to
// the sizes that your application requires.
// * Change the example values of function arguments to the values that
// your application requires.
// * If the entry-point functions return values, store these values or
// otherwise use them as required by your application.
//
//***********************************************************************
// Include Files
#include "rt_nonfinite.h"
#include "myNNFunc_2000_R086.h"
#include "main.h"
#include "myNNFunc_2000_R086_terminate.h"
#include "myNNFunc_2000_R086_emxAPI.h"
#include "myNNFunc_2000_R086_initialize.h"

// Function Declarations
static emxArray_real32_T *argInit_116xUnbounded_real32_T();
static float argInit_real32_T();
static void main_myNNFunc_2000_R086();

// Function Definitions

//
// Arguments    : void
// Return Type  : emxArray_real32_T *
//
static emxArray_real32_T *argInit_116xUnbounded_real32_T()
{
  emxArray_real32_T *result;
  static int iv0[2] = { 116, 2 };

  int idx0;
  int idx1;

  // Set the size of the array.
  // Change this size to the value that the application requires.
  result = emxCreateND_real32_T(2, *(int (*)[2])&iv0[0]);

  // Loop over the array to initialize each element.
  for (idx0 = 0; idx0 < 116; idx0++) {
    for (idx1 = 0; idx1 < result->size[1U]; idx1++) {
      // Set the value of the array element.
      // Change this value to the value that the application requires.
      result->data[idx0 + result->size[0] * idx1] = argInit_real32_T();
    }
  }

  return result;
}

//
// Arguments    : void
// Return Type  : float
//
static float argInit_real32_T()
{
  return 0.0F;
}

//
// Arguments    : void
// Return Type  : void
//
static void main_myNNFunc_2000_R086()
{
  emxArray_real32_T *b_y1;
  emxArray_real32_T *x1;
  emxInitArray_real32_T(&b_y1, 2);

  // Initialize function 'myNNFunc_2000_R086' input arguments.
  // Initialize function input argument 'x1'.
  x1 = argInit_116xUnbounded_real32_T();

  // Call the entry-point 'myNNFunc_2000_R086'.
  myNNFunc_2000_R086(x1, b_y1);
  emxDestroyArray_real32_T(b_y1);
  emxDestroyArray_real32_T(x1);
}

//
// Arguments    : int argc
//                const char * const argv[]
// Return Type  : int
//
int main(int, const char * const [])
{
  // Initialize the application.
  // You do not need to do this more than one time.
  myNNFunc_2000_R086_initialize();

  // Invoke the entry-point functions.
  // You can call entry-point functions multiple times.
  main_myNNFunc_2000_R086();

  // Terminate the application.
  // You do not need to do this more than one time.
  myNNFunc_2000_R086_terminate();
  return 0;
}

//
// File trailer for main.cpp
//
// [EOF]
//
