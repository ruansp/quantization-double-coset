/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * dispersion_initialize.cpp
 *
 * Code generation for function 'dispersion_initialize'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "dispersion.h"
#include "dispersion_initialize.h"
#include "eml_rand_mt19937ar_stateful.h"

/* Function Definitions */
void dispersion_initialize()
{
  rt_InitInfAndNaN(8U);
  c_eml_rand_mt19937ar_stateful_i();
}

/* End of code generation (dispersion_initialize.cpp) */
