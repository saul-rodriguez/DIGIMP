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

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/saul/projects/digital/DIGIMP/Papilio/helloworld/FPGA/hello_world/hello_world.srcs/sim_1/imports/helloworld/hello_tb.v";
static const char *ng1 = "top.vcd";
static int ng2[] = {0, 0};
static const char *ng3 = "my_top";
static int ng4[] = {1, 0};



static void Initial_13_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;

LAB0:    t1 = (t0 + 2520U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(13, ng0);

LAB4:    xsi_set_current_line(14, ng0);
    xsi_vcd_dumpfile(ng1);
    xsi_set_current_line(15, ng0);
    t2 = ((char*)((ng2)));
    xsi_vcd_dumpvars_args(*((unsigned int *)t2), t0, (char)115, ng3, (char)101);
    xsi_set_current_line(17, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(18, ng0);
    t2 = (t0 + 2328);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(18, ng0);
    t3 = ((char*)((ng4)));
    t4 = (t0 + 1608);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(19, ng0);
    t2 = (t0 + 2328);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(19, ng0);
    t3 = ((char*)((ng2)));
    t4 = (t0 + 1608);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    xsi_set_current_line(20, ng0);
    t2 = (t0 + 2328);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB7;
    goto LAB1;

LAB7:    xsi_set_current_line(20, ng0);
    xsi_vlog_finish(1);
    goto LAB1;

}


extern void work_m_10422408610172820684_3336283338_init()
{
	static char *pe[] = {(void *)Initial_13_0};
	xsi_register_didat("work_m_10422408610172820684_3336283338", "isim/hello_tb.exe.sim/work/m_10422408610172820684_3336283338.didat");
	xsi_register_executes(pe);
}
