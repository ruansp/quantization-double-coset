/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * main.cpp
 *
 * Code generation for function 'main'
 *
 */

/*************************************************************************/
/* This automatically generated example C main file shows how to call    */
/* entry-point functions that MATLAB Coder generated. You must customize */
/* this file for your application. Do not modify this file directly.     */
/* Instead, make a copy of this file, modify it, and integrate it into   */
/* your development environment.                                         */
/*                                                                       */
/* This file initializes entry-point function arguments to a default     */
/* size and value before calling the entry-point functions. It does      */
/* not store or use any values returned from the entry-point functions.  */
/* If necessary, it does pre-allocate memory for returned values.        */
/* You can use this file as a starting point for a main function that    */
/* you can deploy in your application.                                   */
/*                                                                       */
/* After you copy the file, and before you deploy it, you must make the  */
/* following changes:                                                    */
/* * For variable-size function arguments, change the example sizes to   */
/* the sizes that your application requires.                             */
/* * Change the example values of function arguments to the values that  */
/* your application requires.                                            */
/* * If the entry-point functions return values, store these values or   */
/* otherwise use them as required by your application.                   */
/*                                                                       */
/*************************************************************************/
/* Include files */
#include "rt_nonfinite.h"
#include "dispersion.h"
#include "main.h"
#include "dispersion_terminate.h"
#include "dispersion_emxAPI.h"
#include "dispersion_initialize.h"

/* Function Declarations */
static void argInit_3x3x50_real_T(double result[450]);
static double argInit_real_T();
static void main_dispersion();

/* Function Definitions */
static void argInit_3x3x50_real_T(double result[450])
{
  int idx0;
  int idx1;
  int idx2;

  /* Loop over the array to initialize each element. */
  for (idx0 = 0; idx0 < 3; idx0++) {
    for (idx1 = 0; idx1 < 3; idx1++) {
      for (idx2 = 0; idx2 < 50; idx2++) {
        /* Set the value of the array element.
           Change this value to the value that the application requires. */
        result[(idx0 + 3 * idx1) + 9 * idx2] = argInit_real_T();
      }
    }
  }
}

static double argInit_real_T()
{
  return 0.0;
}

static void main_dispersion()
{
  emxArray_real_T *dist_min;
  double dv0[450];
  double d;
  emxInitArray_real_T(&dist_min, 2);

  /* Initialize function 'dispersion' input arguments. */
  /* Initialize function input argument 'R'. */
  /* Call the entry-point 'dispersion'. */
  argInit_3x3x50_real_T(dv0);
  dispersion(dv0, argInit_real_T(), &d, dist_min);
  emxDestroyArray_real_T(dist_min);
}

int main(int, const char * const [])
{
  /* Initialize the application.
     You do not need to do this more than one time. */
  dispersion_initialize();

  /* Invoke the entry-point functions.
     You can call entry-point functions multiple times. */
  main_dispersion();

  /* Terminate the application.
     You do not need to do this more than one time. */
  dispersion_terminate();
  return 0;
}

/* End of code generation (main.cpp) */
