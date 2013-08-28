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

#ifndef H_Unisim_dcm_sp_clock_divide_by_2_dcm_sp_clock_divide_by_2_v_H
#define H_Unisim_dcm_sp_clock_divide_by_2_dcm_sp_clock_divide_by_2_v_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Unisim_dcm_sp_clock_divide_by_2_dcm_sp_clock_divide_by_2_v: public HSim__s6 {
public:

    HSim__s1 SE[4];

    HSim__s1 SA[2];
    Unisim_dcm_sp_clock_divide_by_2_dcm_sp_clock_divide_by_2_v(const char * name);
    ~Unisim_dcm_sp_clock_divide_by_2_dcm_sp_clock_divide_by_2_v();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createUnisim_dcm_sp_clock_divide_by_2_dcm_sp_clock_divide_by_2_v(const char *name);

#endif
