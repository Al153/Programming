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
static int ng0[] = {0, 0};
static int ng1[] = {1, 0};



static void N41_0(char *t0)
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

LAB0:    t1 = (t0 + 2416U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 5988);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 20U);
    t5 = *((char **)t4);
    t4 = (t0 + 3992);
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
    t20 = (t0 + 3876);
    *((int *)t20) = 1;

LAB1:    return;
}

static void G43_1(char *t0)
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
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;

LAB0:    t1 = (t0 + 2544U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 728U);
    t3 = *((char **)t2);
    t2 = (t0 + 4028);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    t8 = (t7 + 4U);
    t9 = (t3 + 4U);
    if (*((unsigned int *)t9) == 1)
        goto LAB4;

LAB5:    t10 = *((unsigned int *)t3);
    t11 = (t10 & 1);
    *((unsigned int *)t7) = t11;
    t12 = *((unsigned int *)t9);
    t13 = (t12 & 1);
    *((unsigned int *)t8) = t13;

LAB6:    t14 = (t0 + 4028);
    t15 = (t14 + 32U);
    t16 = *((char **)t15);
    t17 = (t16 + 40U);
    t18 = *((char **)t17);
    t19 = (t18 + 4U);
    t20 = 1U;
    t21 = t20;
    t22 = (t7 + 4U);
    t23 = *((unsigned int *)t7);
    t20 = (t20 & t23);
    t24 = *((unsigned int *)t22);
    t21 = (t21 & t24);
    t25 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t25 & 4294967294U);
    t26 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t26 | t20);
    t27 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t27 & 4294967294U);
    t28 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t28 | t21);
    t29 = (t0 + 4028);
    xsi_driver_vfirst_trans(t29, 0, 0);
    t30 = (t0 + 3884);
    *((int *)t30) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t7) = 1;
    *((unsigned int *)t8) = 1;
    goto LAB6;

}

static void G44_2(char *t0)
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
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;

LAB0:    t1 = (t0 + 2672U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 816U);
    t3 = *((char **)t2);
    t2 = (t0 + 4064);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    t8 = (t7 + 4U);
    t9 = (t3 + 4U);
    if (*((unsigned int *)t9) == 1)
        goto LAB4;

LAB5:    t10 = *((unsigned int *)t3);
    t11 = (t10 & 1);
    *((unsigned int *)t7) = t11;
    t12 = *((unsigned int *)t9);
    t13 = (t12 & 1);
    *((unsigned int *)t8) = t13;

LAB6:    t14 = (t0 + 4064);
    t15 = (t14 + 32U);
    t16 = *((char **)t15);
    t17 = (t16 + 40U);
    t18 = *((char **)t17);
    t19 = (t18 + 4U);
    t20 = 1U;
    t21 = t20;
    t22 = (t7 + 4U);
    t23 = *((unsigned int *)t7);
    t20 = (t20 & t23);
    t24 = *((unsigned int *)t22);
    t21 = (t21 & t24);
    t25 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t25 & 4294967294U);
    t26 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t26 | t20);
    t27 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t27 & 4294967294U);
    t28 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t28 | t21);
    t29 = (t0 + 4064);
    xsi_driver_vfirst_trans(t29, 0, 0);
    t30 = (t0 + 3892);
    *((int *)t30) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t7) = 1;
    *((unsigned int *)t8) = 1;
    goto LAB6;

}

static void G45_3(char *t0)
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
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;

LAB0:    t1 = (t0 + 2800U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 904U);
    t3 = *((char **)t2);
    t2 = (t0 + 4100);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t7 = *((char **)t6);
    t8 = (t7 + 4U);
    t9 = (t3 + 4U);
    if (*((unsigned int *)t9) == 1)
        goto LAB4;

LAB5:    t10 = *((unsigned int *)t3);
    t11 = (t10 & 1);
    *((unsigned int *)t7) = t11;
    t12 = *((unsigned int *)t9);
    t13 = (t12 & 1);
    *((unsigned int *)t8) = t13;

LAB6:    t14 = (t0 + 4100);
    t15 = (t14 + 32U);
    t16 = *((char **)t15);
    t17 = (t16 + 40U);
    t18 = *((char **)t17);
    t19 = (t18 + 4U);
    t20 = 1U;
    t21 = t20;
    t22 = (t7 + 4U);
    t23 = *((unsigned int *)t7);
    t20 = (t20 & t23);
    t24 = *((unsigned int *)t22);
    t21 = (t21 & t24);
    t25 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t25 & 4294967294U);
    t26 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t26 | t20);
    t27 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t27 & 4294967294U);
    t28 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t28 | t21);
    t29 = (t0 + 4100);
    xsi_driver_vfirst_trans(t29, 0, 0);
    t30 = (t0 + 3900);
    *((int *)t30) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t7) = 1;
    *((unsigned int *)t8) = 1;
    goto LAB6;

}

static void G47_4(char *t0)
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
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;

LAB0:    t1 = (t0 + 2928U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 992U);
    t3 = *((char **)t2);
    t2 = (t0 + 1664);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t0 + 4136);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    t9 = (t8 + 40U);
    t10 = *((char **)t9);
    xsi_vlog_bufIf1Gate(t10, t3, t5);
    t11 = (t0 + 4136);
    t12 = (t11 + 32U);
    t13 = *((char **)t12);
    t14 = (t13 + 40U);
    t15 = *((char **)t14);
    t16 = (t15 + 4U);
    t17 = 1U;
    t18 = t17;
    t19 = (t10 + 4U);
    t20 = *((unsigned int *)t10);
    t17 = (t17 & t20);
    t21 = *((unsigned int *)t19);
    t18 = (t18 & t21);
    t22 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t22 & 4294967294U);
    t23 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t23 | t17);
    t24 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t24 & 4294967294U);
    t25 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t25 | t18);
    t26 = (t0 + 4136);
    xsi_driver_vfirst_trans_bufif(t26, 0, 0);
    t27 = (t0 + 3908);
    *((int *)t27) = 1;

LAB1:    return;
}

static void G48_5(char *t0)
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
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;

LAB0:    t1 = (t0 + 3056U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1080U);
    t3 = *((char **)t2);
    t2 = (t0 + 1756);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t0 + 4172);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    t9 = (t8 + 40U);
    t10 = *((char **)t9);
    xsi_vlog_bufIf1Gate(t10, t3, t5);
    t11 = (t0 + 4172);
    t12 = (t11 + 32U);
    t13 = *((char **)t12);
    t14 = (t13 + 40U);
    t15 = *((char **)t14);
    t16 = (t15 + 4U);
    t17 = 1U;
    t18 = t17;
    t19 = (t10 + 4U);
    t20 = *((unsigned int *)t10);
    t17 = (t17 & t20);
    t21 = *((unsigned int *)t19);
    t18 = (t18 & t21);
    t22 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t22 & 4294967294U);
    t23 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t23 | t17);
    t24 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t24 & 4294967294U);
    t25 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t25 | t18);
    t26 = (t0 + 4172);
    xsi_driver_vfirst_trans_bufif(t26, 0, 0);
    t27 = (t0 + 3916);
    *((int *)t27) = 1;

LAB1:    return;
}

static void G49_6(char *t0)
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

LAB0:    t1 = (t0 + 3184U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 4208);
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
    t18 = (t0 + 4208);
    xsi_driver_vfirst_trans(t18, 0, 0);

LAB1:    return;
}

static void A51_7(char *t0)
{
    char t13[8];
    char t14[8];
    char t22[8];
    char t37[8];
    char t45[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    char *t35;
    char *t36;
    char *t38;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    char *t49;
    char *t50;
    char *t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    char *t59;
    char *t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    int t69;
    int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    char *t77;

LAB0:    t1 = (t0 + 3312U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 3924);
    *((int *)t2) = 1;
    t3 = (t0 + 3340);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    t4 = (t0 + 1256U);
    t5 = *((char **)t4);
    t4 = (t5 + 4U);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB5;

LAB6:    t2 = (t0 + 992U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t13, 0, 8);
    t4 = (t3 + 4U);
    t5 = (t2 + 4U);
    if (*((unsigned int *)t3) != *((unsigned int *)t2))
        goto LAB9;

LAB8:    if (*((unsigned int *)t4) != *((unsigned int *)t5))
        goto LAB9;

LAB10:    t11 = (t13 + 4U);
    t6 = *((unsigned int *)t11);
    t7 = (~(t6));
    t8 = *((unsigned int *)t13);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB11;

LAB12:
LAB13:
LAB7:    goto LAB2;

LAB5:    t11 = ((char*)((ng1)));
    t12 = (t0 + 1664);
    xsi_vlogvar_generic_wait_assign_value(t12, t11, 1, 0, 0, 1, 0LL);
    goto LAB7;

LAB9:    *((unsigned int *)t13) = 1;
    goto LAB10;

LAB11:    t12 = (t0 + 1168U);
    t15 = *((char **)t12);
    memset(t14, 0, 8);
    t12 = (t14 + 4U);
    t16 = (t15 + 4U);
    t17 = *((unsigned int *)t16);
    t18 = (~(t17));
    t19 = *((unsigned int *)t15);
    t20 = (t19 & t18);
    t21 = (t20 & 1U);
    if (t21 != 0)
        goto LAB17;

LAB15:    if (*((unsigned int *)t16) == 0)
        goto LAB14;

LAB16:    *((unsigned int *)t14) = 1;
    *((unsigned int *)t12) = 1;

LAB17:    memset(t22, 0, 8);
    t23 = (t22 + 4U);
    t24 = (t14 + 4U);
    t25 = *((unsigned int *)t24);
    t26 = (~(t25));
    t27 = *((unsigned int *)t14);
    t28 = (t27 & t26);
    t29 = (t28 & 1U);
    if (t29 != 0)
        goto LAB18;

LAB19:    if (*((unsigned int *)t24) != 0)
        goto LAB20;

LAB21:    t30 = (t22 + 4U);
    t31 = *((unsigned int *)t22);
    t32 = *((unsigned int *)t30);
    t33 = (t31 || t32);
    if (t33 > 0)
        goto LAB22;

LAB23:    memcpy(t45, t22, 8);

LAB24:    t77 = (t0 + 1664);
    xsi_vlogvar_generic_wait_assign_value(t77, t45, 2, 0, 0, 1, 0LL);
    goto LAB13;

LAB14:    *((unsigned int *)t14) = 1;
    goto LAB17;

LAB18:    *((unsigned int *)t22) = 1;
    goto LAB21;

LAB20:    *((unsigned int *)t22) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB21;

LAB22:    t34 = (t0 + 1480);
    t35 = (t34 + 32U);
    t36 = *((char **)t35);
    memset(t37, 0, 8);
    t38 = (t37 + 4U);
    t39 = (t36 + 4U);
    t40 = *((unsigned int *)t39);
    t41 = (~(t40));
    t42 = *((unsigned int *)t36);
    t43 = (t42 & t41);
    t44 = (t43 & 1U);
    if (t44 != 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t39) != 0)
        goto LAB27;

LAB28:    t46 = *((unsigned int *)t22);
    t47 = *((unsigned int *)t37);
    t48 = (t46 & t47);
    *((unsigned int *)t45) = t48;
    t49 = (t22 + 4U);
    t50 = (t37 + 4U);
    t51 = (t45 + 4U);
    t52 = *((unsigned int *)t49);
    t53 = *((unsigned int *)t50);
    t54 = (t52 | t53);
    *((unsigned int *)t51) = t54;
    t55 = *((unsigned int *)t51);
    t56 = (t55 != 0);
    if (t56 == 1)
        goto LAB29;

LAB30:
LAB31:    goto LAB24;

LAB25:    *((unsigned int *)t37) = 1;
    goto LAB28;

LAB27:    *((unsigned int *)t37) = 1;
    *((unsigned int *)t38) = 1;
    goto LAB28;

LAB29:    t57 = *((unsigned int *)t45);
    t58 = *((unsigned int *)t51);
    *((unsigned int *)t45) = (t57 | t58);
    t59 = (t22 + 4U);
    t60 = (t37 + 4U);
    t61 = *((unsigned int *)t22);
    t62 = (~(t61));
    t63 = *((unsigned int *)t59);
    t64 = (~(t63));
    t65 = *((unsigned int *)t37);
    t66 = (~(t65));
    t67 = *((unsigned int *)t60);
    t68 = (~(t67));
    t69 = (t62 & t64);
    t70 = (t66 & t68);
    t71 = (~(t69));
    t72 = (~(t70));
    t73 = *((unsigned int *)t51);
    *((unsigned int *)t51) = (t73 & t71);
    t74 = *((unsigned int *)t51);
    *((unsigned int *)t51) = (t74 & t72);
    t75 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t75 & t71);
    t76 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t76 & t72);
    goto LAB31;

}

static void A57_8(char *t0)
{
    char t13[8];
    char t15[8];
    char t29[8];
    char t37[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t14;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;
    char *t28;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    char *t41;
    char *t42;
    char *t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    char *t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    int t61;
    int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    char *t69;

LAB0:    t1 = (t0 + 3440U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 3932);
    *((int *)t2) = 1;
    t3 = (t0 + 3468);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    t4 = (t0 + 1256U);
    t5 = *((char **)t4);
    t4 = (t5 + 4U);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB5;

LAB6:    t2 = (t0 + 1080U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t13, 0, 8);
    t4 = (t3 + 4U);
    t5 = (t2 + 4U);
    if (*((unsigned int *)t3) != *((unsigned int *)t2))
        goto LAB9;

LAB8:    if (*((unsigned int *)t4) != *((unsigned int *)t5))
        goto LAB9;

LAB10:    t11 = (t13 + 4U);
    t6 = *((unsigned int *)t11);
    t7 = (~(t6));
    t8 = *((unsigned int *)t13);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB11;

LAB12:
LAB13:
LAB7:    goto LAB2;

LAB5:    t11 = ((char*)((ng0)));
    t12 = (t0 + 1756);
    xsi_vlogvar_generic_wait_assign_value(t12, t11, 1, 0, 0, 1, 0LL);
    goto LAB7;

LAB9:    *((unsigned int *)t13) = 1;
    goto LAB10;

LAB11:    t12 = (t0 + 1168U);
    t14 = *((char **)t12);
    memset(t15, 0, 8);
    t12 = (t15 + 4U);
    t16 = (t14 + 4U);
    t17 = *((unsigned int *)t16);
    t18 = (~(t17));
    t19 = *((unsigned int *)t14);
    t20 = (t19 & t18);
    t21 = (t20 & 1U);
    if (t21 != 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t16) != 0)
        goto LAB16;

LAB17:    t22 = (t15 + 4U);
    t23 = *((unsigned int *)t15);
    t24 = *((unsigned int *)t22);
    t25 = (t23 || t24);
    if (t25 > 0)
        goto LAB18;

LAB19:    memcpy(t37, t15, 8);

LAB20:    t69 = (t0 + 1756);
    xsi_vlogvar_generic_wait_assign_value(t69, t37, 2, 0, 0, 1, 0LL);
    goto LAB13;

LAB14:    *((unsigned int *)t15) = 1;
    goto LAB17;

LAB16:    *((unsigned int *)t15) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB17;

LAB18:    t26 = (t0 + 1572);
    t27 = (t26 + 32U);
    t28 = *((char **)t27);
    memset(t29, 0, 8);
    t30 = (t29 + 4U);
    t31 = (t28 + 4U);
    t32 = *((unsigned int *)t31);
    t33 = (~(t32));
    t34 = *((unsigned int *)t28);
    t35 = (t34 & t33);
    t36 = (t35 & 1U);
    if (t36 != 0)
        goto LAB21;

LAB22:    if (*((unsigned int *)t31) != 0)
        goto LAB23;

LAB24:    t38 = *((unsigned int *)t15);
    t39 = *((unsigned int *)t29);
    t40 = (t38 & t39);
    *((unsigned int *)t37) = t40;
    t41 = (t15 + 4U);
    t42 = (t29 + 4U);
    t43 = (t37 + 4U);
    t44 = *((unsigned int *)t41);
    t45 = *((unsigned int *)t42);
    t46 = (t44 | t45);
    *((unsigned int *)t43) = t46;
    t47 = *((unsigned int *)t43);
    t48 = (t47 != 0);
    if (t48 == 1)
        goto LAB25;

LAB26:
LAB27:    goto LAB20;

LAB21:    *((unsigned int *)t29) = 1;
    goto LAB24;

LAB23:    *((unsigned int *)t29) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB24;

LAB25:    t49 = *((unsigned int *)t37);
    t50 = *((unsigned int *)t43);
    *((unsigned int *)t37) = (t49 | t50);
    t51 = (t15 + 4U);
    t52 = (t29 + 4U);
    t53 = *((unsigned int *)t15);
    t54 = (~(t53));
    t55 = *((unsigned int *)t51);
    t56 = (~(t55));
    t57 = *((unsigned int *)t29);
    t58 = (~(t57));
    t59 = *((unsigned int *)t52);
    t60 = (~(t59));
    t61 = (t54 & t56);
    t62 = (t58 & t60);
    t63 = (~(t61));
    t64 = (~(t62));
    t65 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t65 & t63);
    t66 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t66 & t64);
    t67 = *((unsigned int *)t37);
    *((unsigned int *)t37) = (t67 & t63);
    t68 = *((unsigned int *)t37);
    *((unsigned int *)t37) = (t68 & t64);
    goto LAB27;

}

static void A63_9(char *t0)
{
    char t13[8];
    char t17[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t14;
    char *t15;
    char *t16;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 3568U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 3940);
    *((int *)t2) = 1;
    t3 = (t0 + 3596);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    t4 = (t0 + 1256U);
    t5 = *((char **)t4);
    t4 = (t5 + 4U);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB5;

LAB6:    t2 = (t0 + 1756);
    t3 = (t2 + 32U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t13, 0, 8);
    t11 = (t4 + 4U);
    t12 = (t5 + 4U);
    if (*((unsigned int *)t4) != *((unsigned int *)t5))
        goto LAB10;

LAB8:    if (*((unsigned int *)t11) != *((unsigned int *)t12))
        goto LAB10;

LAB9:    *((unsigned int *)t13) = 1;

LAB10:    t14 = (t13 + 4U);
    t6 = *((unsigned int *)t14);
    t7 = (~(t6));
    t8 = *((unsigned int *)t13);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB11;

LAB12:    t2 = (t0 + 992U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng0)));
    memset(t13, 0, 8);
    t4 = (t3 + 4U);
    t5 = (t2 + 4U);
    if (*((unsigned int *)t3) != *((unsigned int *)t2))
        goto LAB15;

LAB14:    if (*((unsigned int *)t4) != *((unsigned int *)t5))
        goto LAB15;

LAB16:    t11 = (t13 + 4U);
    t6 = *((unsigned int *)t11);
    t7 = (~(t6));
    t8 = *((unsigned int *)t13);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB17;

LAB18:
LAB19:
LAB13:
LAB7:    goto LAB2;

LAB5:    t11 = ((char*)((ng1)));
    t12 = (t0 + 1480);
    xsi_vlogvar_generic_wait_assign_value(t12, t11, 1, 0, 0, 1, 0LL);
    goto LAB7;

LAB11:    t15 = ((char*)((ng0)));
    t16 = (t0 + 1480);
    xsi_vlogvar_generic_wait_assign_value(t16, t15, 1, 0, 0, 1, 0LL);
    goto LAB13;

LAB15:    *((unsigned int *)t13) = 1;
    goto LAB16;

LAB17:    t12 = (t0 + 1756);
    t14 = (t12 + 32U);
    t15 = *((char **)t14);
    memset(t17, 0, 8);
    t16 = (t17 + 4U);
    t18 = (t15 + 4U);
    t19 = *((unsigned int *)t18);
    t20 = (~(t19));
    t21 = *((unsigned int *)t15);
    t22 = (t21 & t20);
    t23 = (t22 & 1U);
    if (t23 != 0)
        goto LAB23;

LAB21:    if (*((unsigned int *)t18) == 0)
        goto LAB20;

LAB22:    *((unsigned int *)t17) = 1;
    *((unsigned int *)t16) = 1;

LAB23:    t24 = (t0 + 1480);
    xsi_vlogvar_generic_wait_assign_value(t24, t17, 2, 0, 0, 1, 0LL);
    goto LAB19;

LAB20:    *((unsigned int *)t17) = 1;
    goto LAB23;

}

static void A71_10(char *t0)
{
    char t13[8];
    char t17[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t14;
    char *t15;
    char *t16;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 3696U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 3948);
    *((int *)t2) = 1;
    t3 = (t0 + 3724);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    t4 = (t0 + 1256U);
    t5 = *((char **)t4);
    t4 = (t5 + 4U);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB5;

LAB6:    t2 = (t0 + 1664);
    t3 = (t2 + 32U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t13, 0, 8);
    t11 = (t4 + 4U);
    t12 = (t5 + 4U);
    if (*((unsigned int *)t4) != *((unsigned int *)t5))
        goto LAB10;

LAB8:    if (*((unsigned int *)t11) != *((unsigned int *)t12))
        goto LAB10;

LAB9:    *((unsigned int *)t13) = 1;

LAB10:    t14 = (t13 + 4U);
    t6 = *((unsigned int *)t14);
    t7 = (~(t6));
    t8 = *((unsigned int *)t13);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB11;

LAB12:    t2 = (t0 + 1080U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng0)));
    memset(t13, 0, 8);
    t4 = (t3 + 4U);
    t5 = (t2 + 4U);
    if (*((unsigned int *)t3) != *((unsigned int *)t2))
        goto LAB15;

LAB14:    if (*((unsigned int *)t4) != *((unsigned int *)t5))
        goto LAB15;

LAB16:    t11 = (t13 + 4U);
    t6 = *((unsigned int *)t11);
    t7 = (~(t6));
    t8 = *((unsigned int *)t13);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB17;

LAB18:
LAB19:
LAB13:
LAB7:    goto LAB2;

LAB5:    t11 = ((char*)((ng0)));
    t12 = (t0 + 1572);
    xsi_vlogvar_generic_wait_assign_value(t12, t11, 1, 0, 0, 1, 0LL);
    goto LAB7;

LAB11:    t15 = ((char*)((ng0)));
    t16 = (t0 + 1572);
    xsi_vlogvar_generic_wait_assign_value(t16, t15, 1, 0, 0, 1, 0LL);
    goto LAB13;

LAB15:    *((unsigned int *)t13) = 1;
    goto LAB16;

LAB17:    t12 = (t0 + 1664);
    t14 = (t12 + 32U);
    t15 = *((char **)t14);
    memset(t17, 0, 8);
    t16 = (t17 + 4U);
    t18 = (t15 + 4U);
    t19 = *((unsigned int *)t18);
    t20 = (~(t19));
    t21 = *((unsigned int *)t15);
    t22 = (t21 & t20);
    t23 = (t22 & 1U);
    if (t23 != 0)
        goto LAB23;

LAB21:    if (*((unsigned int *)t18) == 0)
        goto LAB20;

LAB22:    *((unsigned int *)t17) = 1;
    *((unsigned int *)t16) = 1;

LAB23:    t24 = (t0 + 1572);
    xsi_vlogvar_generic_wait_assign_value(t24, t17, 2, 0, 0, 1, 0LL);
    goto LAB19;

LAB20:    *((unsigned int *)t17) = 1;
    goto LAB23;

}


extern void simprims_ver_m_00000000003919062775_0987454260_init()
{
	static char *pe[] = {(void *)N41_0,(void *)G43_1,(void *)G44_2,(void *)G45_3,(void *)G47_4,(void *)G48_5,(void *)G49_6,(void *)A51_7,(void *)A57_8,(void *)A63_9,(void *)A71_10};
	xsi_register_didat("simprims_ver_m_00000000003919062775_0987454260", "isim/_tmp/simprims_ver/m_00000000003919062775_0987454260.didat");
	xsi_register_executes(pe);
}
