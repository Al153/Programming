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

#ifndef H_Unisim_dcm_sp_dcm_sp_v_H
#define H_Unisim_dcm_sp_dcm_sp_v_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Unisim_dcm_sp_dcm_sp_v: public HSim__s6 {
public:

    HSim__s4 PE[19];
    HSim__s1 SE[19];

HSim__s4 CQ;
HSim__s4 CT;
HSim__s4 CW;
HSim__s4 CZ;
  HSimArrayType Real_array_usrbase;
  HSimArrayType Real_array_usr;
  char *t101;
HSim__s4 C5n;
    HSim__s1 SA[100];
  char t102;
  char t103;
  char t104;
  char t105;
    Unisim_dcm_sp_dcm_sp_v(const char * name);
    ~Unisim_dcm_sp_dcm_sp_v();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createUnisim_dcm_sp_dcm_sp_v(const char *name);

#endif
