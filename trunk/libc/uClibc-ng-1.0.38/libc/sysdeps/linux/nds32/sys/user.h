/*
 * Copyright (C) 2016 Andes Technology, Inc.
 * Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
 */

/* Copyright (C) 1998, 1999, 2000, 2001 Free Software Foundation, Inc.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

#ifndef _SYS_USER_H
#define _SYS_USER_H	1

/* The whole purpose of this file is for GDB and GDB only.  Don't read
   too much into it.  Don't use it for anything other than GDB unless
   you know what you are doing.  */

struct user_fpregs
{
  struct fp_reg
  {
    unsigned int sign1:1;
    unsigned int unused:15;
    unsigned int sign2:1;
    unsigned int exponent:14;
    unsigned int j:1;
    unsigned int mantissa1:31;
    unsigned int mantissa0:32;
  } fpregs[8];
  unsigned int fpsr:32;
  unsigned int fpcr:32;
  unsigned char ftype[8];
  unsigned int init_flag;
};

struct user_regs
{
  unsigned long int uregs[18];
};

struct user
{
  struct user_regs regs;	/* General registers */
  int u_fpvalid;		/* True if math co-processor being used. */

  unsigned long int u_tsize;	/* Text segment size (pages). */
  unsigned long int u_dsize;	/* Data segment size (pages). */
  unsigned long int u_ssize;	/* Stack segment size (pages). */

  unsigned long start_code;	/* Starting virtual address of text. */
  unsigned long start_stack;	/* Starting virtual address of stack. */

  long int signal;     		/* Signal that caused the core dump. */
  int reserved;			/* No longer used */
  struct user_regs *u_ar0;	/* help gdb to find the general registers. */

  unsigned long magic;		/* uniquely identify a core file */
  char u_comm[32];		/* User command that was responsible */
  int u_debugreg[8];
  struct user_fpregs u_fp;	/* Floating point registers */
  struct user_fpregs *u_fp0;	/* help gdb to find the FP registers. */
};

#include <bits/uClibc_page.h>
#define NBPG			PAGE_SIZE
#define UPAGES			1
#define HOST_TEXT_START_ADDR	(u.start_code)
#define HOST_DATA_START_ADDR	(u.start_data)
#define HOST_STACK_END_ADDR	(u.start_stack + u.u_ssize * NBPG)

#endif  /* sys/user.h */
