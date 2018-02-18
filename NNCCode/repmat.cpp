//
// File: repmat.cpp
//
// MATLAB Coder version            : 3.2
// C/C++ source code generated on  : 18-Feb-2018 13:49:43
//

// Include Files
#include "rt_nonfinite.h"
#include "myNNFunc_2000_R086.h"
#include "repmat.h"
#include "myNNFunc_2000_R086_emxutil.h"

// Function Definitions

//
// Arguments    : float varargin_2
//                emxArray_real32_T *b
// Return Type  : void
//
void repmat(float varargin_2, emxArray_real32_T *b)
{
  int jtilecol;
  int ibtile;
  int k;
  static const float a[10] = { 1.77404797F, -2.32702637F, -2.2760129F,
    -6.23634815F, -10.2700176F, -7.56742096F, 10.8457289F, 11.4823265F,
    14.2379541F, 15.6154156F };

  jtilecol = b->size[0] * b->size[1];
  b->size[0] = 10;
  b->size[1] = (int)varargin_2;
  emxEnsureCapacity((emxArray__common *)b, jtilecol, (int)sizeof(float));
  if (!((int)varargin_2 == 0)) {
    for (jtilecol = 1; jtilecol <= (int)varargin_2; jtilecol++) {
      ibtile = (jtilecol - 1) * 10;
      for (k = 0; k < 10; k++) {
        b->data[ibtile + k] = a[k];
      }
    }
  }
}

//
// File trailer for repmat.cpp
//
// [EOF]
//
