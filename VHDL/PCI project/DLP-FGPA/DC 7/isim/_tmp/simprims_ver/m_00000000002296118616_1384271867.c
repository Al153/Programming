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



static void N36_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;

LAB0:    t1 = (t0 + 1728U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 3212);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 20U);
    t5 = *((char **)t4);
    t4 = (t0 + 2088);
    t6 = (t4 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    t10 = (t9 + 4U);
    t11 = 1U;
    t12 = t11;
    t13 = (t5 + 4U);
    t14 = *((unsigned int *)t5);
    t11 = (t11 & t14);
    t15 = *((unsigned int *)t13);
    t12 = (t12 & t15);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 & 4294967294U);
    t17 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t17 | t11);
    t18 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t18 & 4294967294U);
    t19 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t19 | t12);
    xsi_driver_vfirst_trans(t4, 0, 0U);
    t20 = (t0 + 2036);
    *((int *)t20) = 1;

LAB1:    return;
}

static void G38_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t25;

LAB0:    t1 = (t0 + 1856U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 1120U);
    t4 = *((char **)t2);
    t2 = (t0 + 2124);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    xsi_vlog_bufIf0Gate(t8, t3, t4);
    t9 = (t0 + 2124);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    t12 = (t11 + 40U);
    t13 = *((char **)t12);
    t14 = (t13 + 4U);
    t15 = 1U;
    t16 = t15;
    t17 = (t8 + 4U);
    t18 = *((unsigned int *)t8);
    t15 = (t15 & t18);
    t19 = *((unsigned int *)t17);
    t16 = (t16 & t19);
    t20 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t20 & 4294967294U);
    t21 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t21 | t15);
    t22 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t22 & 4294967294U);
    t23 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t23 | t16);
    t24 = (t0 + 2124);
    xsi_driver_vfirst_trans_bufif(t24, 0, 0);
    t25 = (t0 + 2044);
    *((int *)t25) = 1;

LAB1:    return;
}


extern void simprims_ver_m_00000000002296118616_1384271867_init()
{
	static char *pe[] = {(void *)N36_0,(void *)G38_1};
	xsi_register_didat("simprims_ver_m_00000000002296118616_1384271867", "isim/_tmp/simprims_ver/m_00000000002296118616_1384271867.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002296118616_1923483298_init()
{
	static char *pe[] = {(void *)N36_0,(void *)G38_1};
	xsi_register_didat("simprims_ver_m_00000000002296118616_1923483298", "isim/_tmp/simprims_ver/m_00000000002296118616_1923483298.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002296118616_3436290860_init()
{
	static char *pe[] = {(void *)N36_0,(void *)G38_1};
	xsi_register_didat("simprims_ver_m_00000000002296118616_3436290860", "isim/_tmp/simprims_ver/m_00000000002296118616_3436290860.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002296118616_1649743637_init()
{
	static char *pe[] = {(void *)N36_0,(void *)G38_1};
	xsi_register_didat("simprims_ver_m_00000000002296118616_1649743637", "isim/_tmp/simprims_ver/m_00000000002296118616_1649743637.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002296118616_2165224520_init()
{
	static char *pe[] = {(void *)N36_0,(void *)G38_1};
	xsi_register_didat("simprims_ver_m_00000000002296118616_2165224520", "isim/_tmp/simprims_ver/m_00000000002296118616_2165224520.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002296118616_3440625947_init()
{
	static char *pe[] = {(void *)N36_0,(void *)G38_1};
	xsi_register_didat("simprims_ver_m_00000000002296118616_3440625947", "isim/_tmp/simprims_ver/m_00000000002296118616_3440625947.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002296118616_3419933680_init()
{
	static char *pe[] = {(void *)N36_0,(void *)G38_1};
	xsi_register_didat("simprims_ver_m_00000000002296118616_3419933680", "isim/_tmp/simprims_ver/m_00000000002296118616_3419933680.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002296118616_1396712908_init()
{
	static char *pe[] = {(void *)N36_0,(void *)G38_1};
	xsi_register_didat("simprims_ver_m_00000000002296118616_1396712908", "isim/_tmp/simprims_ver/m_00000000002296118616_1396712908.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002296118616_4017176091_init()
{
	static char *pe[] = {(void *)N36_0,(void *)G38_1};
	xsi_register_didat("simprims_ver_m_00000000002296118616_4017176091", "isim/_tmp/simprims_ver/m_00000000002296118616_4017176091.didat");
	xsi_register_executes(pe);
}
