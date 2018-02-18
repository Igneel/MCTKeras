//
// File: bsxfun.cpp
//
// MATLAB Coder version            : 3.2
// C/C++ source code generated on  : 18-Feb-2018 13:49:43
//

// Include Files
#include "rt_nonfinite.h"
#include "myNNFunc_2000_R086.h"
#include "bsxfun.h"
#include "myNNFunc_2000_R086_emxutil.h"

// Function Definitions

//
// Arguments    : const emxArray_real32_T *a
//                emxArray_real32_T *c
// Return Type  : void
//
void bsxfun(const emxArray_real32_T *a, emxArray_real32_T *c)
{
  int csz_idx_1;
  int i1;
  int ak;
  int ck;
  float av[116];
  int k;
  static const float b[116] = { -9.51990223F, 1.0E-6F, 1.0F, 0.0F, -790.095093F,
    -19.3540058F, 0.0F, -1800.42175F, -1.49536488E+6F, 0.0F, -7.9849995E+6F,
    0.0F, -9.005213E+6F, -4.19345549E+13F, -3.72624778E+13F, -4.19345549E+13F,
    -9.9797028E+11F, -4.19345549E+13F, -5.20994616F, 1.0E-6F, 1.0F, 0.0F,
    -0.002391F, -20.935F, 0.0F, -135683.641F, -235775.75F, -0.167401F,
    -8.013531E+6F, -1617.44885F, -8.013531E+6F, -5.71482812E+13F,
    -5.71482812E+13F, -1.97305408E+13F, -4.56452801E+11F, -1.97305408E+13F,
    -67952.8438F, 1.0E-6F, 1.0F, 0.0F, -0.000213F, -190537.297F, 0.0F,
    -54.7755852F, -2.24423373E+9F, -0.010127F, -2.55727677E+10F, -0.056361F,
    -2.55727677E+10F, -5.72495E+16F, -5.43675042E+16F, -2.29456927E+17F,
    -4.15361516E+10F, -2.29456927E+17F, 0.0F, 0.0F, 0.0F, 0.0F, -2.54946709F,
    1.0E-6F, 1.0F, 0.0F, -495.841583F, -5.09893513F, 1.0E-6F, -473.367065F,
    -504.156036F, 1.0E-6F, -2210.41089F, 1.0E-6F, -2210.41089F, -6.389202E+7F,
    -6.389202E+7F, -5.6250844E+7F, -197879.406F, -5.6250844E+7F, -2.65396094F,
    1.0E-6F, 1.0F, 0.0F, -613.282593F, -5.30792189F, 0.0F, -119554.039F,
    -508.04071F, -0.005611F, -2172.02173F, -0.193469F, -2172.02173F,
    -5.8870488E+7F, -5.5970004E+7F, -5.8870488E+7F, -724149.0F, -5.8870488E+7F,
    -1.262501F, 1.0E-6F, 1.0F, 0.0F, -103.170166F, 0.0F, 2.0E-6F, -170.564896F,
    -13.2823639F, -6.92853F, -6.34472F, -6.92853F, -6.72005796F, -21.9353848F,
    -2733.771F, -7089.13232F, -22.1821594F, -2738.72119F, -13.5270576F,
    -13.4196F, -19.6239376F, -19.6227131F };

  csz_idx_1 = a->size[1];
  i1 = c->size[0] * c->size[1];
  c->size[0] = 116;
  c->size[1] = csz_idx_1;
  emxEnsureCapacity((emxArray__common *)c, i1, (int)sizeof(float));
  if (c->size[1] != 0) {
    csz_idx_1 = 1;
    ak = 0;
    i1 = 116 * c->size[1] - 116;
    for (ck = 0; ck <= i1; ck += 116) {
      for (k = 0; k < 116; k++) {
        av[k] = a->data[ak + k];
      }

      for (k = 0; k < 116; k++) {
        av[k] -= b[k];
      }

      for (k = 0; k < 116; k++) {
        c->data[ck + k] = av[k];
      }

      if (csz_idx_1 < a->size[1]) {
        ak += 116;
        csz_idx_1++;
      } else {
        csz_idx_1 = 1;
      }
    }
  }
}

//
// File trailer for bsxfun.cpp
//
// [EOF]
//
