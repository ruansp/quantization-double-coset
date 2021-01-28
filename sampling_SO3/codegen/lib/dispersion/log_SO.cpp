/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * log_SO.cpp
 *
 * Code generation for function 'log_SO'
 *
 */

/* Include files */
#include <cmath>
#include "rt_nonfinite.h"
#include "dispersion.h"
#include "log_SO.h"

/* Function Definitions */
void log_SO(const double R[9], double x[3])
{
  double theta;
  double b;
  double a;
  double c;
  double d;
  double e;
  double f;
  x[0] = 0.0;
  x[1] = 0.0;
  x[2] = 0.0;
  theta = std::acos(0.5 * (((R[0] + R[4]) + R[8]) - 1.0));
  if (!(std::abs(theta) < 1.0E-15)) {
    if (std::abs(theta - 3.1415926535897931) < 1.0E-7) {
      a = 0.5 * (R[0] - 1.0);
      b = 0.5 * R[1];
      c = 0.5 * R[2];
      d = 0.5 * (R[4] - 1.0);
      e = 0.5 * R[5];
      f = 0.5 * (R[8] - 1.0);
      if (std::abs(a) < 1.0E-15) {
        /*  x_1 ~= 0 && x_2 == x_3 == 0 */
        x[0] = theta * std::sqrt(-d);
      } else if (std::abs(d) < 1.0E-15) {
        /*  x_1 == x_3 == 0 && x_2 ~= 0 */
        x[1] = theta * std::sqrt(-a);
      } else if (std::abs(f) < 1.0E-15) {
        /*  x_1 == x_2 == 0 && x_3 ~= 0 */
        x[2] = theta * std::sqrt(-a);
      } else if (std::abs(b) < 1.0E-15) {
        /*  x_1 == 0 || x_2 == 0 */
        if (std::abs(c) >= 1.0E-15) {
          /*  x_1, x_3 ~= 0 && x_2 == 0 */
          a = std::sqrt(-f);
          x[2] = c / a;
          x[0] = theta * a;
          x[2] *= theta;
        } else {
          /*  x_1 == 0 && x_2, x_3 ~= 0 */
          a = std::sqrt(-f);
          x[2] = e / a;
          x[1] = theta * a;
          x[2] *= theta;
        }
      } else if (std::abs(c) < 1.0E-15) {
        /*  x_1, x_2 ~= 0 && x_3 == 0 */
        a = std::sqrt(-d);
        x[1] = b / a;
        x[0] = theta * a;
        x[1] *= theta;
      } else {
        /*  x_1, x_2, x_3 ~= 0 */
        a = b;
        if (b < 0.0) {
          a = -1.0;
        } else if (b > 0.0) {
          a = 1.0;
        } else {
          if (b == 0.0) {
            a = 0.0;
          }
        }

        d = e;
        if (e < 0.0) {
          d = -1.0;
        } else if (e > 0.0) {
          d = 1.0;
        } else {
          if (e == 0.0) {
            d = 0.0;
          }
        }

        x[0] = theta * a * d * std::sqrt(b * c / e);
        a = e;
        if (e < 0.0) {
          a = -1.0;
        } else if (e > 0.0) {
          a = 1.0;
        } else {
          if (e == 0.0) {
            a = 0.0;
          }
        }

        x[1] = theta * a * std::sqrt(b * e / c);
        x[2] = theta * std::sqrt(c * e / b);
      }
    } else {
      b = theta / std::sin(theta);
      x[0] = 0.5 * (R[5] - R[7]) * b;
      x[1] = 0.5 * (R[6] - R[2]) * b;
      x[2] = 0.5 * (R[1] - R[3]) * b;
    }
  }
}

/* End of code generation (log_SO.cpp) */
