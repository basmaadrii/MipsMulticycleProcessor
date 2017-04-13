/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Xilinx/mipsmulti01.sv/idmem.vhd";
extern char *IEEE_P_3499444699;
extern char *STD_TEXTIO;
extern char *STD_STANDARD;
extern char *IEEE_P_3620187407;

char *ieee_p_3499444699_sub_2213602152_3536714472(char *, char *, int , int );
int ieee_p_3499444699_sub_252593879_3536714472(char *, int );
int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);


static void work_a_2197823596_3212880686_p_0(char *t0)
{
    char t6[16];
    char t26[16];
    char t28[16];
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    char *t7;
    char *t8;
    char *t9;
    int t10;
    int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned char t16;
    unsigned char t17;
    unsigned char t18;
    unsigned char t19;
    unsigned char t20;
    unsigned char t21;
    int t22;
    int t23;
    int t24;
    char *t25;
    char *t27;
    char *t29;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;

LAB0:    t1 = (t0 + 3488U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 10552);
    *((int *)t2) = 0;
    t3 = (t0 + 10556);
    *((int *)t3) = 127;
    t4 = 0;
    t5 = 127;

LAB4:    if (t4 <= t5)
        goto LAB5;

LAB7:    xsi_set_current_line(28, ng0);
    t2 = (t0 + 2208U);
    t3 = *((char **)t2);
    t2 = (t3 + 0);
    *((int *)t2) = 0;
    xsi_set_current_line(29, ng0);
    t2 = (t0 + 2656U);
    t3 = (t0 + 10560);
    t8 = (t6 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 1;
    t9 = (t8 + 4U);
    *((int *)t9) = 19;
    t9 = (t8 + 8U);
    *((int *)t9) = 1;
    t4 = (19 - 1);
    t12 = (t4 * 1);
    t12 = (t12 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t12;
    std_textio_file_open1(t2, t3, t6, (unsigned char)0);
    xsi_set_current_line(30, ng0);

LAB9:    t2 = (t0 + 2656U);
    t16 = std_textio_endfile(t2);
    t17 = (!(t16));
    if (t17 != 0)
        goto LAB10;

LAB12:    xsi_set_current_line(47, ng0);

LAB29:
LAB30:    xsi_set_current_line(48, ng0);
    t2 = (t0 + 1968U);
    t3 = *((char **)t2);
    t2 = (t0 + 1352U);
    t7 = *((char **)t2);
    t12 = (31 - 8);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t2 = (t7 + t14);
    t8 = (t6 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 8;
    t9 = (t8 + 4U);
    *((int *)t9) = 2;
    t9 = (t8 + 8U);
    *((int *)t9) = -1;
    t4 = (2 - 8);
    t31 = (t4 * -1);
    t31 = (t31 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t31;
    t5 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t2, t6);
    t10 = (t5 - 127);
    t31 = (t10 * -1);
    xsi_vhdl_check_range_of_index(127, 0, -1, t5);
    t32 = (32U * t31);
    t33 = (0 + t32);
    t9 = (t3 + t33);
    t15 = (t0 + 3904);
    t25 = (t15 + 56U);
    t27 = *((char **)t25);
    t29 = (t27 + 56U);
    t30 = *((char **)t29);
    memcpy(t30, t9, 32U);
    xsi_driver_first_trans_fast_port(t15);
    xsi_set_current_line(49, ng0);

LAB35:    t2 = (t0 + 3808);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB36;

LAB1:    return;
LAB5:    xsi_set_current_line(26, ng0);
    t7 = ieee_p_3499444699_sub_2213602152_3536714472(IEEE_P_3499444699, t6, 0, 32);
    t8 = (t0 + 1968U);
    t9 = *((char **)t8);
    t8 = (t0 + 10552);
    t10 = ieee_p_3499444699_sub_252593879_3536714472(IEEE_P_3499444699, *((int *)t8));
    t11 = (t10 - 127);
    t12 = (t11 * -1);
    xsi_vhdl_check_range_of_index(127, 0, -1, t10);
    t13 = (32U * t12);
    t14 = (0 + t13);
    t15 = (t9 + t14);
    memcpy(t15, t7, 32U);

LAB6:    t2 = (t0 + 10552);
    t4 = *((int *)t2);
    t3 = (t0 + 10556);
    t5 = *((int *)t3);
    if (t4 == t5)
        goto LAB7;

LAB8:    t10 = (t4 + 1);
    t4 = t10;
    t7 = (t0 + 10552);
    *((int *)t7) = t4;
    goto LAB4;

LAB10:    xsi_set_current_line(31, ng0);
    t3 = (t0 + 3296);
    t7 = (t0 + 2656U);
    t8 = (t0 + 2832U);
    std_textio_readline(STD_TEXTIO, t3, t7, t8);
    xsi_set_current_line(32, ng0);
    t2 = (t0 + 2328U);
    t3 = *((char **)t2);
    t2 = (t3 + 0);
    *((int *)t2) = 0;
    xsi_set_current_line(33, ng0);
    t2 = (t0 + 10579);
    *((int *)t2) = 1;
    t3 = (t0 + 10583);
    *((int *)t3) = 8;
    t4 = 1;
    t5 = 8;

LAB13:    if (t4 <= t5)
        goto LAB14;

LAB16:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 2328U);
    t3 = *((char **)t2);
    t4 = *((int *)t3);
    t2 = ieee_p_3499444699_sub_2213602152_3536714472(IEEE_P_3499444699, t6, t4, 32);
    t7 = (t0 + 1968U);
    t8 = *((char **)t7);
    t7 = (t0 + 2208U);
    t9 = *((char **)t7);
    t5 = *((int *)t9);
    t10 = (t5 - 127);
    t12 = (t10 * -1);
    xsi_vhdl_check_range_of_index(127, 0, -1, t5);
    t13 = (32U * t12);
    t14 = (0 + t13);
    t7 = (t8 + t14);
    t15 = (t6 + 12U);
    t31 = *((unsigned int *)t15);
    t31 = (t31 * 1U);
    memcpy(t7, t2, t31);
    xsi_set_current_line(44, ng0);
    t2 = (t0 + 2208U);
    t3 = *((char **)t2);
    t4 = *((int *)t3);
    t5 = (t4 + 1);
    t2 = (t0 + 2208U);
    t7 = *((char **)t2);
    t2 = (t7 + 0);
    *((int *)t2) = t5;
    goto LAB9;

LAB11:;
LAB14:    xsi_set_current_line(34, ng0);
    t7 = (t0 + 3296);
    t8 = (t0 + 2832U);
    t9 = (t0 + 2088U);
    t15 = *((char **)t9);
    t9 = (t15 + 0);
    std_textio_read8(STD_TEXTIO, t7, t8, t9);
    xsi_set_current_line(35, ng0);
    t2 = (t0 + 2088U);
    t3 = *((char **)t2);
    t17 = *((unsigned char *)t3);
    t18 = ((unsigned char)48 <= t17);
    if (t18 == 1)
        goto LAB20;

LAB21:    t16 = (unsigned char)0;

LAB22:    if (t16 != 0)
        goto LAB17;

LAB19:    t2 = (t0 + 2088U);
    t3 = *((char **)t2);
    t17 = *((unsigned char *)t3);
    t18 = ((unsigned char)97 <= t17);
    if (t18 == 1)
        goto LAB25;

LAB26:    t16 = (unsigned char)0;

LAB27:    if (t16 != 0)
        goto LAB23;

LAB24:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 10587);
    t7 = ((STD_STANDARD) + 384);
    t8 = (t0 + 2208U);
    t9 = *((char **)t8);
    t10 = *((int *)t9);
    t8 = xsi_int_to_mem(t10);
    t15 = xsi_string_variable_get_image(t6, t7, t8);
    t27 = ((STD_STANDARD) + 1008);
    t29 = (t28 + 0U);
    t30 = (t29 + 0U);
    *((int *)t30) = 1;
    t30 = (t29 + 4U);
    *((int *)t30) = 20;
    t30 = (t29 + 8U);
    *((int *)t30) = 1;
    t11 = (20 - 1);
    t12 = (t11 * 1);
    t12 = (t12 + 1);
    t30 = (t29 + 12U);
    *((unsigned int *)t30) = t12;
    t25 = xsi_base_array_concat(t25, t26, t27, (char)97, t2, t28, (char)97, t15, t6, (char)101);
    t30 = (t6 + 12U);
    t12 = *((unsigned int *)t30);
    t13 = (20U + t12);
    xsi_report(t25, t13, (unsigned char)2);

LAB18:
LAB15:    t2 = (t0 + 10579);
    t4 = *((int *)t2);
    t3 = (t0 + 10583);
    t5 = *((int *)t3);
    if (t4 == t5)
        goto LAB16;

LAB28:    t10 = (t4 + 1);
    t4 = t10;
    t7 = (t0 + 10579);
    *((int *)t7) = t4;
    goto LAB13;

LAB17:    xsi_set_current_line(36, ng0);
    t2 = (t0 + 2328U);
    t8 = *((char **)t2);
    t10 = *((int *)t8);
    t11 = (t10 * 16);
    t2 = (t0 + 2088U);
    t9 = *((char **)t2);
    t21 = *((unsigned char *)t9);
    t22 = (t11 + (((int)(t21))));
    t23 = (t22 - (((int)((unsigned char)48))));
    t2 = (t0 + 2328U);
    t15 = *((char **)t2);
    t2 = (t15 + 0);
    *((int *)t2) = t23;
    goto LAB18;

LAB20:    t2 = (t0 + 2088U);
    t7 = *((char **)t2);
    t19 = *((unsigned char *)t7);
    t20 = (t19 <= (unsigned char)57);
    t16 = t20;
    goto LAB22;

LAB23:    xsi_set_current_line(38, ng0);
    t2 = (t0 + 2328U);
    t8 = *((char **)t2);
    t10 = *((int *)t8);
    t11 = (t10 * 16);
    t2 = (t0 + 2088U);
    t9 = *((char **)t2);
    t21 = *((unsigned char *)t9);
    t22 = (t11 + (((int)(t21))));
    t23 = (t22 - (((int)((unsigned char)97))));
    t24 = (t23 + 10);
    t2 = (t0 + 2328U);
    t15 = *((char **)t2);
    t2 = (t15 + 0);
    *((int *)t2) = t24;
    goto LAB18;

LAB25:    t2 = (t0 + 2088U);
    t7 = *((char **)t2);
    t19 = *((unsigned char *)t7);
    t20 = (t19 <= (unsigned char)102);
    t16 = t20;
    goto LAB27;

LAB31:;
LAB32:    xsi_set_current_line(52, ng0);

LAB37:
LAB38:    xsi_set_current_line(53, ng0);
    t2 = (t0 + 10607);
    xsi_report(t2, 31U, 0);
    xsi_set_current_line(54, ng0);
    t2 = (t0 + 992U);
    t17 = xsi_signal_has_event(t2);
    if (t17 == 1)
        goto LAB44;

LAB45:    t16 = (unsigned char)0;

LAB46:    if (t16 != 0)
        goto LAB41;

LAB43:
LAB42:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 1968U);
    t3 = *((char **)t2);
    t2 = (t0 + 1352U);
    t7 = *((char **)t2);
    t12 = (31 - 8);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t2 = (t7 + t14);
    t8 = (t6 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 8;
    t9 = (t8 + 4U);
    *((int *)t9) = 2;
    t9 = (t8 + 8U);
    *((int *)t9) = -1;
    t4 = (2 - 8);
    t31 = (t4 * -1);
    t31 = (t31 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t31;
    t5 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t2, t6);
    t10 = (t5 - 127);
    t31 = (t10 * -1);
    xsi_vhdl_check_range_of_index(127, 0, -1, t5);
    t32 = (32U * t31);
    t33 = (0 + t32);
    t9 = (t3 + t33);
    t15 = (t0 + 3904);
    t25 = (t15 + 56U);
    t27 = *((char **)t25);
    t29 = (t27 + 56U);
    t30 = *((char **)t29);
    memcpy(t30, t9, 32U);
    xsi_driver_first_trans_fast_port(t15);
    xsi_set_current_line(61, ng0);

LAB52:    t2 = (t0 + 3824);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB53;
    goto LAB1;

LAB33:    t3 = (t0 + 3808);
    *((int *)t3) = 0;
    goto LAB29;

LAB34:    goto LAB33;

LAB36:    goto LAB34;

LAB39:;
LAB40:    goto LAB2;

LAB41:    xsi_set_current_line(55, ng0);
    t3 = (t0 + 1192U);
    t8 = *((char **)t3);
    t20 = *((unsigned char *)t8);
    t21 = (t20 == (unsigned char)3);
    if (t21 != 0)
        goto LAB47;

LAB49:
LAB48:    goto LAB42;

LAB44:    t3 = (t0 + 1032U);
    t7 = *((char **)t3);
    t18 = *((unsigned char *)t7);
    t19 = (t18 == (unsigned char)3);
    t16 = t19;
    goto LAB46;

LAB47:    xsi_set_current_line(56, ng0);
    t3 = (t0 + 1512U);
    t9 = *((char **)t3);
    t3 = (t0 + 1968U);
    t15 = *((char **)t3);
    t3 = (t0 + 1352U);
    t25 = *((char **)t3);
    t12 = (31 - 8);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t3 = (t25 + t14);
    t27 = (t6 + 0U);
    t29 = (t27 + 0U);
    *((int *)t29) = 8;
    t29 = (t27 + 4U);
    *((int *)t29) = 2;
    t29 = (t27 + 8U);
    *((int *)t29) = -1;
    t4 = (2 - 8);
    t31 = (t4 * -1);
    t31 = (t31 + 1);
    t29 = (t27 + 12U);
    *((unsigned int *)t29) = t31;
    t5 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t3, t6);
    t10 = (t5 - 127);
    t31 = (t10 * -1);
    xsi_vhdl_check_range_of_index(127, 0, -1, t5);
    t32 = (32U * t31);
    t33 = (0 + t32);
    t29 = (t15 + t33);
    memcpy(t29, t9, 32U);
    goto LAB48;

LAB50:    t3 = (t0 + 3824);
    *((int *)t3) = 0;
    goto LAB37;

LAB51:    goto LAB50;

LAB53:    goto LAB51;

}


extern void work_a_2197823596_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2197823596_3212880686_p_0};
	xsi_register_didat("work_a_2197823596_3212880686", "isim/idmem_isim_beh.exe.sim/work/a_2197823596_3212880686.didat");
	xsi_register_executes(pe);
}
