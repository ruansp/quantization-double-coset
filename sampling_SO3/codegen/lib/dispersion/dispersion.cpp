/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * dispersion.cpp
 *
 * Code generation for function 'dispersion'
 *
 */

/* Include files */
#include <cmath>
#include <string.h>
#include "rt_nonfinite.h"
#include "dispersion.h"
#include "log_SO.h"
#include "rand.h"
#include "dispersion_emxutil.h"

/* Function Definitions */
void dispersion(const double R[450], double num, double *d, emxArray_real_T
                *dist_min)
{
  int i0;
  int i1;
  int i;
  int n;
  double q_exp[3];
  int idx;
  double scale;
  int R_tmp;
  double R_rand[9];
  boolean_T exitg1;
  double q_exp_tmp;
  double b_q_exp_tmp;
  double c_q_exp_tmp;
  double x_norm;
  double scale_1;
  double a[9];
  double a_tmp;
  double dist[50];
  int i2;

  /* DISPERSION computes the dispersion of sampling on SO(3) */
  /*    Detailed explanation goes here */
  i0 = (int)num;
  i1 = dist_min->size[0] * dist_min->size[1];
  dist_min->size[0] = 1;
  dist_min->size[1] = i0;
  emxEnsureCapacity_real_T(dist_min, i1);
  for (i = 0; i < i0; i++) {
    /*     %% Random rotation on SO(3) */
    b_rand(q_exp);
    q_exp[0] *= 3.1415926535897931;
    q_exp[1] *= 3.1415926535897931;
    q_exp[2] *= 3.1415926535897931;
    memset(&R_rand[0], 0, 9U * sizeof(double));

    /*  TODO: Can be made even faster with cases? Probably not (it's only the axes)... */
    R_rand[0] = 1.0;
    q_exp_tmp = q_exp[0] * q_exp[0];
    R_rand[4] = 1.0;
    b_q_exp_tmp = q_exp[1] * q_exp[1];
    R_rand[8] = 1.0;
    c_q_exp_tmp = q_exp[2] * q_exp[2];
    scale = (q_exp_tmp + b_q_exp_tmp) + c_q_exp_tmp;
    x_norm = std::sqrt(scale);
    scale_1 = std::sin(x_norm) / x_norm;

    /*  TODO: Use Taylor expansion for small x_norm? */
    R_rand[5] = scale_1 * q_exp[0];
    R_rand[6] = scale_1 * q_exp[1];
    R_rand[1] = scale_1 * q_exp[2];
    R_rand[7] = -R_rand[5];
    R_rand[2] = -R_rand[6];
    R_rand[3] = -R_rand[1];
    scale = (1.0 - std::cos(x_norm)) / scale;

    /*  TODO: Use Taylor expansion for small x_norm? */
    a[0] = scale * -(b_q_exp_tmp + c_q_exp_tmp);
    a_tmp = scale * (q_exp[0] * q_exp[1]);
    a[3] = a_tmp;
    x_norm = scale * (q_exp[0] * q_exp[2]);
    a[6] = x_norm;
    a[1] = a_tmp;
    a[4] = scale * -(q_exp_tmp + c_q_exp_tmp);
    a_tmp = scale * (q_exp[1] * q_exp[2]);
    a[7] = a_tmp;
    a[2] = x_norm;
    a[5] = a_tmp;
    a[8] = scale * -(q_exp_tmp + b_q_exp_tmp);
    for (i1 = 0; i1 < 9; i1++) {
      R_rand[i1] += a[i1];
    }

    /*     %% Nearest neighbor with all samples */
    for (n = 0; n < 50; n++) {
      for (i1 = 0; i1 < 3; i1++) {
        for (idx = 0; idx < 3; idx++) {
          R_tmp = i1 + 3 * idx;
          a[R_tmp] = 0.0;
          i2 = 3 * i1 + 9 * n;
          a[R_tmp] = (R[i2] * R_rand[3 * idx] + R[i2 + 1] * R_rand[1 + 3 * idx])
            + R[i2 + 2] * R_rand[2 + 3 * idx];
        }
      }

      log_SO(a, q_exp);
      scale = 3.3121686421112381E-170;
      x_norm = std::abs(q_exp[0]);
      if (x_norm > 3.3121686421112381E-170) {
        a_tmp = 1.0;
        scale = x_norm;
      } else {
        scale_1 = x_norm / 3.3121686421112381E-170;
        a_tmp = scale_1 * scale_1;
      }

      x_norm = std::abs(q_exp[1]);
      if (x_norm > scale) {
        scale_1 = scale / x_norm;
        a_tmp = 1.0 + a_tmp * scale_1 * scale_1;
        scale = x_norm;
      } else {
        scale_1 = x_norm / scale;
        a_tmp += scale_1 * scale_1;
      }

      x_norm = std::abs(q_exp[2]);
      if (x_norm > scale) {
        scale_1 = scale / x_norm;
        a_tmp = 1.0 + a_tmp * scale_1 * scale_1;
        scale = x_norm;
      } else {
        scale_1 = x_norm / scale;
        a_tmp += scale_1 * scale_1;
      }

      dist[n] = scale * std::sqrt(a_tmp);
    }

    if (!rtIsNaN(dist[0])) {
      idx = 1;
    } else {
      idx = 0;
      R_tmp = 2;
      exitg1 = false;
      while ((!exitg1) && (R_tmp < 51)) {
        if (!rtIsNaN(dist[R_tmp - 1])) {
          idx = R_tmp;
          exitg1 = true;
        } else {
          R_tmp++;
        }
      }
    }

    if (idx == 0) {
      dist_min->data[i] = dist[0];
    } else {
      scale = dist[idx - 1];
      i1 = idx + 1;
      for (R_tmp = i1; R_tmp < 51; R_tmp++) {
        x_norm = dist[R_tmp - 1];
        if (scale > x_norm) {
          scale = x_norm;
        }
      }

      dist_min->data[i] = scale;
    }
  }

  /*  Dispersion */
  n = dist_min->size[1];
  if (dist_min->size[1] <= 2) {
    if (dist_min->size[1] == 1) {
      scale = dist_min->data[0];
    } else if ((dist_min->data[0] < dist_min->data[1]) || (rtIsNaN
                (dist_min->data[0]) && (!rtIsNaN(dist_min->data[1])))) {
      scale = dist_min->data[1];
    } else {
      scale = dist_min->data[0];
    }
  } else {
    if (!rtIsNaN(dist_min->data[0])) {
      idx = 1;
    } else {
      idx = 0;
      R_tmp = 2;
      exitg1 = false;
      while ((!exitg1) && (R_tmp <= dist_min->size[1])) {
        if (!rtIsNaN(dist_min->data[R_tmp - 1])) {
          idx = R_tmp;
          exitg1 = true;
        } else {
          R_tmp++;
        }
      }
    }

    if (idx == 0) {
      scale = dist_min->data[0];
    } else {
      scale = dist_min->data[idx - 1];
      i0 = idx + 1;
      for (R_tmp = i0; R_tmp <= n; R_tmp++) {
        if (scale < dist_min->data[R_tmp - 1]) {
          scale = dist_min->data[R_tmp - 1];
        }
      }
    }
  }

  /*  function R = SO3_exp(q) */
  /*  q_hat = skew(q); */
  /*  R = eye(3) + sin(norm(q))/norm(q) * q_hat +... */
  /*      (1-cos(norm(q)))/norm(q)^2 * q_hat^2; */
  /*  end */
  /*   */
  /*  function q = SO3_log(R) */
  /*  th = acos( (trace(R)-1)/2 ); */
  /*  q = 1/2 * th/sin(th) * (R-R'); */
  /*  end */
  *d = scale;
}

/* End of code generation (dispersion.cpp) */
