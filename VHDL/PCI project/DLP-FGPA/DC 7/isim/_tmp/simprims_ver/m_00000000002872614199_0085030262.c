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



static void N37_0(char *t0)
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

LAB0:    t1 = (t0 + 1904U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 3672);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 20U);
    t5 = *((char **)t4);
    t4 = (t0 + 2400);
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
    t20 = (t0 + 2340);
    *((int *)t20) = 1;

LAB1:    return;
}

static void G40_1(char *t0)
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

LAB0:    t1 = (t0 + 2032U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = (t0 + 1032U);
    t4 = *((char **)t2);
    t2 = (t0 + 2436);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    xsi_vlog_OrGate(t8, 2U, t3, t4);
    t9 = (t0 + 2436);
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
    t24 = (t0 + 2436);
    xsi_driver_vfirst_trans(t24, 0, 0);
    t25 = (t0 + 2348);
    *((int *)t25) = 1;

LAB1:    return;
}

static void G41_2(char *t0)
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

LAB0:    t1 = (t0 + 2160U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1120U);
    t3 = *((char **)t2);
    t2 = (t0 + 1296U);
    t4 = *((char **)t2);
    t2 = (t0 + 2472);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 40U);
    t8 = *((char **)t7);
    xsi_vlog_bufIf0Gate(t8, t3, t4);
    t9 = (t0 + 2472);
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
    t24 = (t0 + 2472);
    xsi_driver_vfirst_trans_bufif(t24, 0, 0);
    t25 = (t0 + 2356);
    *((int *)t25) = 1;

LAB1:    return;
}


extern void simprims_ver_m_00000000002872614199_0085030262_init()
{
	static char *pe[] = {(void *)N37_0,(void *)G40_1,(void *)G41_2};
	xsi_register_didat("simprims_ver_m_00000000002872614199_0085030262", "isim/_tmp/simprims_ver/m_00000000002872614199_0085030262.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002872614199_0603913924_init()
{
	static char *pe[] = {(void *)N37_0,(void *)G40_1,(void *)G41_2};
	xsi_register_didat("simprims_ver_m_00000000002872614199_0603913924", "isim/_tmp/simprims_ver/m_00000000002872614199_0603913924.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002872614199_0080944961_init()
{
	static char *pe[] = {(void *)N37_0,(void *)G40_1,(void *)G41_2};
	xsi_register_didat("simprims_ver_m_00000000002872614199_0080944961", "isim/_tmp/simprims_ver/m_00000000002872614199_0080944961.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002872614199_2399051411_init()
{
	static char *pe[] = {(void *)N37_0,(void *)G40_1,(void *)G41_2};
	xsi_register_didat("simprims_ver_m_00000000002872614199_2399051411", "isim/_tmp/simprims_ver/m_00000000002872614199_2399051411.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002872614199_2314679887_init()
{
	static char *pe[] = {(void *)N37_0,(void *)G40_1,(void *)G41_2};
	xsi_register_didat("simprims_ver_m_00000000002872614199_2314679887", "isim/_tmp/simprims_ver/m_00000000002872614199_2314679887.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002872614199_0528239051_init()
{
	static char *pe[] = {(void *)N37_0,(void *)G40_1,(void *)G41_2};
	xsi_register_didat("simprims_ver_m_00000000002872614199_0528239051", "isim/_tmp/simprims_ver/m_00000000002872614199_0528239051.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002872614199_2403136676_init()
{
	static char *pe[] = {(void *)N37_0,(void *)G40_1,(void *)G41_2};
	xsi_register_didat("simprims_ver_m_00000000002872614199_2403136676", "isim/_tmp/simprims_ver/m_00000000002872614199_2403136676.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002872614199_2322850337_init()
{
	static char *pe[] = {(void *)N37_0,(void *)G40_1,(void *)G41_2};
	xsi_register_didat("simprims_ver_m_00000000002872614199_2322850337", "isim/_tmp/simprims_ver/m_00000000002872614199_2322850337.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002872614199_0396679832_init()
{
	static char *pe[] = {(void *)N37_0,(void *)G40_1,(void *)G41_2};
	xsi_register_didat("simprims_ver_m_00000000002872614199_0396679832", "isim/_tmp/simprims_ver/m_00000000002872614199_0396679832.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002872614199_2360877258_init()
{
	static char *pe[] = {(void *)N37_0,(void *)G40_1,(void *)G41_2};
	xsi_register_didat("simprims_ver_m_00000000002872614199_2360877258", "isim/_tmp/simprims_ver/m_00000000002872614199_2360877258.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002872614199_0375828655_init()
{
	static char *pe[] = {(void *)N37_0,(void *)G40_1,(void *)G41_2};
	xsi_register_didat("simprims_ver_m_00000000002872614199_0375828655", "isim/_tmp/simprims_ver/m_00000000002872614199_0375828655.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002872614199_2447160491_init()
{
	static char *pe[] = {(void *)N37_0,(void *)G40_1,(void *)G41_2};
	xsi_register_didat("simprims_ver_m_00000000002872614199_2447160491", "isim/_tmp/simprims_ver/m_00000000002872614199_2447160491.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002872614199_3422725438_init()
{
	static char *pe[] = {(void *)N37_0,(void *)G40_1,(void *)G41_2};
	xsi_register_didat("simprims_ver_m_00000000002872614199_3422725438", "isim/_tmp/simprims_ver/m_00000000002872614199_3422725438.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002872614199_0694211534_init()
{
	static char *pe[] = {(void *)N37_0,(void *)G40_1,(void *)G41_2};
	xsi_register_didat("simprims_ver_m_00000000002872614199_0694211534", "isim/_tmp/simprims_ver/m_00000000002872614199_0694211534.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002872614199_3451965193_init()
{
	static char *pe[] = {(void *)N37_0,(void *)G40_1,(void *)G41_2};
	xsi_register_didat("simprims_ver_m_00000000002872614199_3451965193", "isim/_tmp/simprims_ver/m_00000000002872614199_3451965193.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002872614199_0681753081_init()
{
	static char *pe[] = {(void *)N37_0,(void *)G40_1,(void *)G41_2};
	xsi_register_didat("simprims_ver_m_00000000002872614199_0681753081", "isim/_tmp/simprims_ver/m_00000000002872614199_0681753081.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002872614199_3377312699_init()
{
	static char *pe[] = {(void *)N37_0,(void *)G40_1,(void *)G41_2};
	xsi_register_didat("simprims_ver_m_00000000002872614199_3377312699", "isim/_tmp/simprims_ver/m_00000000002872614199_3377312699.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002872614199_3613385970_init()
{
	static char *pe[] = {(void *)N37_0,(void *)G40_1,(void *)G41_2};
	xsi_register_didat("simprims_ver_m_00000000002872614199_3613385970", "isim/_tmp/simprims_ver/m_00000000002872614199_3613385970.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002872614199_3970860555_init()
{
	static char *pe[] = {(void *)N37_0,(void *)G40_1,(void *)G41_2};
	xsi_register_didat("simprims_ver_m_00000000002872614199_3970860555", "isim/_tmp/simprims_ver/m_00000000002872614199_3970860555.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002872614199_4263193061_init()
{
	static char *pe[] = {(void *)N37_0,(void *)G40_1,(void *)G41_2};
	xsi_register_didat("simprims_ver_m_00000000002872614199_4263193061", "isim/_tmp/simprims_ver/m_00000000002872614199_4263193061.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002872614199_4008196178_init()
{
	static char *pe[] = {(void *)N37_0,(void *)G40_1,(void *)G41_2};
	xsi_register_didat("simprims_ver_m_00000000002872614199_4008196178", "isim/_tmp/simprims_ver/m_00000000002872614199_4008196178.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002872614199_0852460868_init()
{
	static char *pe[] = {(void *)N37_0,(void *)G40_1,(void *)G41_2};
	xsi_register_didat("simprims_ver_m_00000000002872614199_0852460868", "isim/_tmp/simprims_ver/m_00000000002872614199_0852460868.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002872614199_0856551283_init()
{
	static char *pe[] = {(void *)N37_0,(void *)G40_1,(void *)G41_2};
	xsi_register_didat("simprims_ver_m_00000000002872614199_0856551283", "isim/_tmp/simprims_ver/m_00000000002872614199_0856551283.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002872614199_0931173313_init()
{
	static char *pe[] = {(void *)N37_0,(void *)G40_1,(void *)G41_2};
	xsi_register_didat("simprims_ver_m_00000000002872614199_0931173313", "isim/_tmp/simprims_ver/m_00000000002872614199_0931173313.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002872614199_0872695727_init()
{
	static char *pe[] = {(void *)N37_0,(void *)G40_1,(void *)G41_2};
	xsi_register_didat("simprims_ver_m_00000000002872614199_0872695727", "isim/_tmp/simprims_ver/m_00000000002872614199_0872695727.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002872614199_2204703557_init()
{
	static char *pe[] = {(void *)N37_0,(void *)G40_1,(void *)G41_2};
	xsi_register_didat("simprims_ver_m_00000000002872614199_2204703557", "isim/_tmp/simprims_ver/m_00000000002872614199_2204703557.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002872614199_0064665501_init()
{
	static char *pe[] = {(void *)N37_0,(void *)G40_1,(void *)G41_2};
	xsi_register_didat("simprims_ver_m_00000000002872614199_0064665501", "isim/_tmp/simprims_ver/m_00000000002872614199_0064665501.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002872614199_2192273778_init()
{
	static char *pe[] = {(void *)N37_0,(void *)G40_1,(void *)G41_2};
	xsi_register_didat("simprims_ver_m_00000000002872614199_2192273778", "isim/_tmp/simprims_ver/m_00000000002872614199_2192273778.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00000000002872614199_0515777532_init()
{
	static char *pe[] = {(void *)N37_0,(void *)G40_1,(void *)G41_2};
	xsi_register_didat("simprims_ver_m_00000000002872614199_0515777532", "isim/_tmp/simprims_ver/m_00000000002872614199_0515777532.didat");
	xsi_register_executes(pe);
}
