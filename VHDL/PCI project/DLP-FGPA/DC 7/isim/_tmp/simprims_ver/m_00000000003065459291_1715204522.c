/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2007 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

/* This file is designed for use with ISim build 0xef153c89 */

#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static int ng0[] = {1, 0};



static void G28_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 1248U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1464);
    t3 = (t2 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 40U);
    t6 = *((char **)t5);
    t7 = (t6 + 4U);
    t8 = 1U;
    t9 = t8;
    t10 = ((((char*)((ng0)))) + 0U);
    t11 = ((((char*)((ng0)))) + 4U);
    t12 = *((unsigned int *)t10);
    t8 = (t8 & t12);
    t13 = *((unsigned int *)t11);
    t9 = (t9 & t13);
    t14 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t14 & 4294967294U);
    t15 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t15 | t8);
    t16 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t16 & 4294967294U);
    t17 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t17 | t9);
    t18 = (t0 + 1464);
    xsi_driver_vfirst_trans(t18, 0, 0);

LAB1:    return;
}


extern void simprims_ver_m_00000000003065459291_1715204522_init()
{
	static char *pe[] = {(void *)G28_0};
	xsi_register_didat("simprims_ver_m_00000000003065459291_1715204522", "isim/_tmp/simprims_ver/m_00000000003065459291_1715204522.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000003065459291_1992876061_init()
{
	static char *pe[] = {(void *)G28_0};
	xsi_register_didat("simprims_ver_m_00000000003065459291_1992876061", "isim/_tmp/simprims_ver/m_00000000003065459291_1992876061.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000003065459291_3405380554_init()
{
	static char *pe[] = {(void *)G28_0};
	xsi_register_didat("simprims_ver_m_00000000003065459291_3405380554", "isim/_tmp/simprims_ver/m_00000000003065459291_3405380554.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000003065459291_3409678845_init()
{
	static char *pe[] = {(void *)G28_0};
	xsi_register_didat("simprims_ver_m_00000000003065459291_3409678845", "isim/_tmp/simprims_ver/m_00000000003065459291_3409678845.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000003065459291_1550808410_init()
{
	static char *pe[] = {(void *)G28_0};
	xsi_register_didat("simprims_ver_m_00000000003065459291_1550808410", "isim/_tmp/simprims_ver/m_00000000003065459291_1550808410.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000003065459291_1571626861_init()
{
	static char *pe[] = {(void *)G28_0};
	xsi_register_didat("simprims_ver_m_00000000003065459291_1571626861", "isim/_tmp/simprims_ver/m_00000000003065459291_1571626861.didat");
	xsi_register_executes(pe);
}
