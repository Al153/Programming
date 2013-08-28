////////////////////////////////////////////////////////////////////////////////
//   ____  ____   
//  /   /\/   /  
// /___/  \  /   
// \   \   \/  
//  \   \        Copyright (c) 2003-2004 Xilinx, Inc.
//  /   /        All Right Reserved. 
// /---/   /\     
// \   \  /  \  
//  \___\/\___\
////////////////////////////////////////////////////////////////////////////////

#ifndef H_Unisim_vpkg_H
#define H_Unisim_vpkg_H

#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


#include "ieee/vital_primitives/vital_primitives.h"
#include "ieee/vital_timing/vital_timing.h"
#include "ieee/std_logic_1164/std_logic_1164.h"
#include "std/textio/textio.h"

class Unisim_vpkg: public HSim__s6 {
public:
  HSimRecordType Othergenericstype;
  HSimEnumType Memory_collision_type;
  HSimArrayType Std_logic_vector1;
  HSimArrayType Std_logic_vector2sub1;
  HSimArrayType Std_logic_vector2;
  HSimArrayType Std_logic_vector3sub2;
  HSimArrayType Std_logic_vector3sub1;
  HSimArrayType Std_logic_vector3;
  HSimArrayType Std_logic_vector4sub3;
  HSimArrayType Std_logic_vector4sub2;
  HSimArrayType Std_logic_vector4sub1;
  HSimArrayType Std_logic_vector4;
HSim__s4 E1g;
HSim__s4 E1i;
HSim__s4 E1k;
HSim__s4 E1n;
HSim__s4 E1q;
HSim__s4 E1s;
HSim__s4 E1u;
  char *t0;
  char *t1;
  char *t2;
  char *t3;
  char *t4;
HSim__s4 E1C;
  char *t5;
HSim__s4 E2G;
  char *t6;
  char *t7;
  char *t8;
  char *t9;
HSim__s4 E4b;
HSim__s4 E7c;
  char *t10;
HSim__s4 E9a;
HSim__s4 EcS;
HSim__s4 Efh;
HSim__s4 EgN;
HSim__s4 EjN;
HSim__s4 Emi;
HSim__s4 Eqj;
HSim__s4 Esh;
HSim__s4 EvW;
HSim__s4 Exs;
HSim__s4 EAt;
HSim__s4 ECn;
HSim__s4 EEz;
HSim__s4 EGL;
HSim__s4 EJs;
HSim__s4 EKz;
HSim__s4 EMX;
HSim__s4 ENG;
HSim__s4 EPw;
HSim__s4 ESz;
HSim__s4 EV2;
HSim__s4 EXx;
HSim__s4 E10v;
HSim__s4 E11i;
HSim__s4 E13M;
HSim__s4 E16b;
HSim__s4 E17f;
HSim__s4 E18H;
HSim__s4 E1a9;
HSim__s4 E1c2;
HSim__s4 E1dt;
HSim__s4 E1ew;
HSim__s4 E1fz;
HSim__s4 E1gD;
HSim__s4 E1i3;
HSim__s4 E1j5;
HSim__s4 E1jU;
HSim__s4 E1nn;
HSim__s4 E1qP;
HSim__s4 E1sj;
  char *t11;
HSim__s4 E1uk;
HSim__s4 E1y0;
  char *t12;
HSim__s4 E1Ay;
HSim__s4 E1EU;
HSim__s4 E1GV;
/* subprogram name HEX_TO_SLV16 */
char *G1KA(HSimConstraints *reConstr, const char *E1Kw);
/* subprogram name HEX_TO_SLV32 */
char *G1KK(HSimConstraints *reConstr, const char *E1KH);
/* subprogram name DECODE_ADDR4 */
int G1KV(const char *E1KS);
/* subprogram name DECODE_ADDR5 */
int G1L5(const char *E1L2);
/* subprogram name SLV_TO_INT */
int G1Lc(const char *E1L9, const HSimConstraints *constrE1L9);
/* subprogram name ADDR_IS_VALID */
char G1Li(const char *E1Lf, const HSimConstraints *constrE1Lf);
/* subprogram name SLV_TO_STR */
char *G1Lq(HSimConstraints *reConstr, const char *E1Lm, const HSimConstraints *constrE1Lm);
/* subprogram name SLV_TO_HEX */
char *G1Ly(HSimConstraints *reConstr, const char *E1Lt, const HSimConstraints *constrE1Lt, const int E1Lv);
/* subprogram name SET_MEM_TO_X */
void G1LF(HSim__s7 *process, const char *E1LB, const HSimConstraints *constrE1LB,  char *V1LD, const HSimConstraints *constrV1LD);
/* subprogram name ADDR_OVERLAP */
void G1M5(HSim__s7 *process, const int E1LI, const int E1LK, const int E1LM, const int E1LP,  char& V1LR,  int& V1LT,  int& V1LV,  int& V1LX,  int& V1LZ,  int& V1M1,  int& V1M3);
/* subprogram name COLLISION */
void G1Mr(HSim__s7 *process, const char *E1M8, const HSimConstraints *constrE1M8, const int E1Ma, const int E1Mc, const char *E1Mf, const HSimConstraints *constrE1Mf, const char *E1Mh, const HSimConstraints *constrE1Mh, const char *E1Mj, const HSimConstraints *constrE1Mj, const char *E1Mm, const HSimConstraints *constrE1Mm,  char *V1Mp, const HSimConstraints *constrV1Mp);
/* subprogram name GenericValueCheckMessage */
void G1MY(HSim__s7 *process, const char *E1Mv, const HSimConstraints *constrE1Mv, const char *E1My, const HSimConstraints *constrE1My, const char *E1MB, const HSimConstraints *constrE1MB, const char *E1ME, const HSimConstraints *constrE1ME, const char *E1MH, const HSimConstraints *constrE1MH, const char *E1MK, const HSimConstraints *constrE1MK, const char *E1MN, const HSimConstraints *constrE1MN, const char *E1MR, const HSimConstraints *constrE1MR, const char *E1MT, const HSimConstraints *constrE1MT, const char E1MW);
/* subprogram name GenericValueCheckMessage */
void G1Nt(HSim__s7 *process, const char *E1N2, const HSimConstraints *constrE1N2, const char *E1N5, const HSimConstraints *constrE1N5, const char *E1N8, const HSimConstraints *constrE1N8, const char *E1Nb, const HSimConstraints *constrE1Nb, const int E1Nd, const char *E1Ng, const HSimConstraints *constrE1Ng, const char *E1Nj, const HSimConstraints *constrE1Nj, const int E1Nm, const char *E1Np, const HSimConstraints *constrE1Np, const char E1Nr);
/* subprogram name GenericValueCheckMessage */
void G1NY(HSim__s7 *process, const char *E1Nx, const HSimConstraints *constrE1Nx, const char *E1NA, const HSimConstraints *constrE1NA, const char *E1ND, const HSimConstraints *constrE1ND, const char *E1NG, const HSimConstraints *constrE1NG, const char E1NI, const char *E1NL, const HSimConstraints *constrE1NL, const char *E1NP, const HSimConstraints *constrE1NP, const char *E1NS, const HSimConstraints *constrE1NS, const char *E1NU, const HSimConstraints *constrE1NU, const char E1NW);
/* subprogram name GenericValueCheckMessage */
void G1Pu(HSim__s7 *process, const char *E1P2, const HSimConstraints *constrE1P2, const char *E1P5, const HSimConstraints *constrE1P5, const char *E1P8, const HSimConstraints *constrE1P8, const char *E1Pb, const HSimConstraints *constrE1Pb, const int E1Pd, const char *E1Pg, const HSimConstraints *constrE1Pg, const char *E1Pj, const HSimConstraints *constrE1Pj, const char *E1Pn, const HSimConstraints *constrE1Pn, const char *E1Pq, const HSimConstraints *constrE1Pq, const char E1Ps);
/* subprogram name GenericValueCheckMessage */
void G1Q0(HSim__s7 *process, const char *E1Py, const HSimConstraints *constrE1Py, const char *E1PB, const HSimConstraints *constrE1PB, const char *E1PE, const HSimConstraints *constrE1PE, const char *E1PH, const HSimConstraints *constrE1PH, const double E1PK, const char *E1PN, const HSimConstraints *constrE1PN, const char *E1PR, const HSimConstraints *constrE1PR, const char *E1PU, const HSimConstraints *constrE1PU, const char *E1PW, const HSimConstraints *constrE1PW, const char E1PY);
/* subprogram name Memory_Collision_Msg */
void G1Qm(HSim__s7 *process, const char *E1Q4, const HSimConstraints *constrE1Q4, const char *E1Q7, const HSimConstraints *constrE1Q7, const char *E1Qa, const HSimConstraints *constrE1Qa, const char E1Qd, const char *E1Qf, const HSimConstraints *constrE1Qf, const char *E1Qh, const HSimConstraints *constrE1Qh, const char E1Qj);
/* subprogram name detect_resolution */
void G1Qs(HSim__s7 *process, const char *E1Qq, const HSimConstraints *constrE1Qq);

public:

public:
  Unisim_vpkg(const HSimString &name);
  ~Unisim_vpkg();
};

extern Unisim_vpkg *UnisimVpkg;

#endif
