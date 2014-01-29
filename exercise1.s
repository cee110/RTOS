	.file	"exercise1.c"
	.text
Ltext0:
	.comm	_g_ui32Flags, 4, 2
	.globl	_timer0Count
	.bss
	.align 4
_timer0Count:
	.space 4
	.globl	_timer1Count
	.align 4
_timer1Count:
	.space 4
	.globl	_SysTickCount
	.align 4
_SysTickCount:
	.space 4
	.comm	_sContext, 44, 5
	.globl	_resolution
	.align 4
_resolution:
	.space 4
	.comm	_systick_period, 4, 2
	.comm	_array, 204, 5
	.comm	_arrayPtr, 4, 2
	.globl	_measuretype
	.data
	.align 4
_measuretype:
	.long	1
	.text
	.globl	_ConfigureUART
	.def	_ConfigureUART;	.scl	2;	.type	32;	.endef
_ConfigureUART:
LFB6:
	.file 1 "exercise1.c"
	.loc 1 114 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 118 0
	movl	$-268433408, (%esp)
	call	_ROM_SysCtlPeripheralEnable
	.loc 1 123 0
	movl	$-268429312, (%esp)
	call	_ROM_SysCtlPeripheralEnable
	.loc 1 128 0
	movl	$1, (%esp)
	call	_ROM_GPIOPinConfigure
	.loc 1 129 0
	movl	$1025, (%esp)
	call	_ROM_GPIOPinConfigure
	.loc 1 130 0
	movl	$3, 4(%esp)
	movl	$1073758208, (%esp)
	call	_ROM_GPIOPinTypeUART
	.loc 1 135 0
	movl	$5, 4(%esp)
	movl	$1073790976, (%esp)
	call	_UARTClockSourceSet
	.loc 1 140 0
	movl	$16000000, 8(%esp)
	movl	$115200, 4(%esp)
	movl	$0, (%esp)
	call	_UARTStdioConfig
	.loc 1 141 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE6:
	.globl	_SysTickIntHandler
	.def	_SysTickIntHandler;	.scl	2;	.type	32;	.endef
_SysTickIntHandler:
LFB7:
	.loc 1 149 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	.loc 1 150 0
	movl	_SysTickCount, %eax
	addl	$1, %eax
	movl	%eax, _SysTickCount
	.loc 1 151 0
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE7:
	.globl	_GetSysTime
	.def	_GetSysTime;	.scl	2;	.type	32;	.endef
_GetSysTime:
LFB8:
	.loc 1 159 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset 3, -12
	.loc 1 161 0
	movl	_SysTickCount, %edx
	movl	_systick_period, %eax
	imull	%edx, %eax
	movl	%eax, -12(%ebp)
	.loc 1 162 0
	movl	_systick_period, %ebx
	call	_SysTickValueGet
	subl	%eax, %ebx
	movl	%ebx, %eax
	addl	%eax, -12(%ebp)
	.loc 1 164 0
	movl	-12(%ebp), %eax
	.loc 1 165 0
	addl	$20, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE8:
	.globl	_Timer0IntHandler
	.def	_Timer0IntHandler;	.scl	2;	.type	32;	.endef
_Timer0IntHandler:
LFB9:
	.loc 1 173 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	.loc 1 174 0
	call	_SysTickValueGet
	movl	%eax, -12(%ebp)
	.loc 1 175 0
	movl	_arrayPtr, %eax
	cmpl	$-1, %eax
	jne	L6
	.loc 1 175 0 is_stmt 0 discriminator 1
	movl	$-536813544, %eax
	movl	$0, (%eax)
	jmp	L7
L6:
	.loc 1 177 0 is_stmt 1
	movl	_measuretype, %eax
	cmpl	$1, %eax
	jne	L8
	.loc 1 178 0
	movl	$-536813544, %eax
	movl	$0, (%eax)
	.loc 1 179 0
	movl	_arrayPtr, %eax
	movl	$16777216, %edx
	subl	-12(%ebp), %edx
	movl	%edx, _array(,%eax,4)
	jmp	L7
L8:
	.loc 1 181 0
	movl	_arrayPtr, %ebx
	movl	$255, 4(%esp)
	movl	$1073938432, (%esp)
	call	_TimerValueGet
	movl	%eax, _array(,%ebx,4)
L7:
	.loc 1 184 0
	movl	_arrayPtr, %eax
	addl	$1, %eax
	movl	%eax, _arrayPtr
	.loc 1 186 0
	movl	_arrayPtr, %eax
	cmpl	$51, %eax
	jne	L9
	.loc 1 186 0 is_stmt 0 discriminator 1
	call	_IntMasterDisable
L9:
	.loc 1 191 0 is_stmt 1
	movl	$1, 4(%esp)
	movl	$1073938432, (%esp)
	call	_ROM_TimerIntClear
	.loc 1 196 0
	movl	$_g_ui32Flags, %eax
	andl	$1048575, %eax
	sall	$5, %eax
	movl	%eax, %edx
	movl	$_g_ui32Flags, %eax
	andl	$-268435456, %eax
	orl	$33554432, %eax
	orl	%edx, %eax
	movl	$_g_ui32Flags, %edx
	andl	$1048575, %edx
	movl	%edx, %ecx
	sall	$5, %ecx
	movl	$_g_ui32Flags, %edx
	andl	$-268435456, %edx
	orl	$33554432, %edx
	orl	%ecx, %edx
	movl	(%edx), %edx
	xorl	$1, %edx
	movl	%edx, (%eax)
	.loc 1 197 0
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE9:
	.globl	_Timer1IntHandler
	.def	_Timer1IntHandler;	.scl	2;	.type	32;	.endef
_Timer1IntHandler:
LFB10:
	.loc 1 206 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 210 0
	movl	$1, 4(%esp)
	movl	$1073942528, (%esp)
	call	_ROM_TimerIntClear
	.loc 1 215 0
	movl	$_g_ui32Flags, %eax
	andl	$1048575, %eax
	sall	$5, %eax
	movl	%eax, %edx
	movl	$_g_ui32Flags, %eax
	andl	$-268435456, %eax
	orl	$33554436, %eax
	orl	%edx, %eax
	movl	$_g_ui32Flags, %edx
	andl	$1048575, %edx
	movl	%edx, %ecx
	sall	$5, %ecx
	movl	$_g_ui32Flags, %edx
	andl	$-268435456, %edx
	orl	$33554436, %edx
	orl	%ecx, %edx
	movl	(%edx), %edx
	xorl	$1, %edx
	movl	%edx, (%eax)
	.loc 1 216 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.globl	_Delay
	.def	_Delay;	.scl	2;	.type	32;	.endef
_Delay:
LFB11:
	.loc 1 231 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 232 0
	movl	$0, -8(%ebp)
	.loc 1 233 0
	movl	$0, -4(%ebp)
	.loc 1 238 0
	jmp	L12
L16:
	.loc 1 241 0
	movl	$-536813544, %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	.loc 1 242 0
	jmp	L13
L15:
	.loc 1 243 0
	cmpl	$9, -8(%ebp)
	ja	L14
	.loc 1 243 0 is_stmt 0 discriminator 1
	jmp	L12
L14:
	.loc 1 244 0 is_stmt 1
	movl	-12(%ebp), %eax
	movl	%eax, -4(%ebp)
L13:
	.loc 1 242 0 discriminator 1
	movl	-4(%ebp), %eax
	cmpl	-12(%ebp), %eax
	jne	L15
L12:
	.loc 1 238 0 discriminator 1
	movl	8(%ebp), %eax
	leal	-1(%eax), %edx
	movl	%edx, 8(%ebp)
	testl	%eax, %eax
	jne	L16
	.loc 1 247 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE11:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "exercise1, world!\12\0"
LC1:
	.ascii "exercise1\0"
LC4:
	.ascii "%d\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB12:
	.loc 1 255 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	andl	$-16, %esp
	subl	$176, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	.loc 1 255 0
	call	___main
	.loc 1 262 0
	call	_ROM_FPULazyStackingEnable
	.loc 1 267 0
	movl	$29361472, (%esp)
	call	_ROM_SysCtlClockSet
	.loc 1 273 0
	call	_ConfigureUART
	.loc 1 275 0
	movl	$LC0, (%esp)
	call	_UARTprintf
	.loc 1 280 0
	call	_CFAL96x64x16Init
	.loc 1 286 0
	movl	$_g_sCFAL96x64x16, 4(%esp)
	movl	$_sContext, (%esp)
	call	_GrContextInit
	.loc 1 291 0
	movw	$0, 84(%esp)
	.loc 1 292 0
	movw	$0, 86(%esp)
	.loc 1 293 0
	movl	_sContext+4, %eax
	movzwl	8(%eax), %eax
	subl	$1, %eax
	movw	%ax, 88(%esp)
	.loc 1 294 0
	movw	$23, 90(%esp)
LBB2:
	.loc 1 295 0
	movl	$_sContext, 148(%esp)
	movl	148(%esp), %eax
	movl	4(%eax), %eax
	movl	32(%eax), %eax
	movl	148(%esp), %edx
	movl	4(%edx), %edx
	movl	4(%edx), %edx
	movl	$139, 4(%esp)
	movl	%edx, (%esp)
	call	*%eax
	movl	148(%esp), %edx
	movl	%eax, 16(%edx)
LBE2:
	.loc 1 296 0
	leal	84(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$_sContext, (%esp)
	call	_GrRectFill
LBB3:
	.loc 1 301 0
	movl	$_sContext, 144(%esp)
	movl	144(%esp), %eax
	movl	4(%eax), %eax
	movl	32(%eax), %eax
	movl	144(%esp), %edx
	movl	4(%edx), %edx
	movl	4(%edx), %edx
	movl	$16777215, 4(%esp)
	movl	%edx, (%esp)
	call	*%eax
	movl	144(%esp), %edx
	movl	%eax, 16(%edx)
LBE3:
	.loc 1 302 0
	leal	84(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$_sContext, (%esp)
	call	_GrRectDraw
	.loc 1 307 0
	movl	$_g_sFontCm12, 4(%esp)
	movl	$_sContext, (%esp)
	call	_GrContextFontSet
LBB4:
	.loc 1 308 0
	movl	$_sContext, 140(%esp)
	movl	$LC1, 136(%esp)
	movl	140(%esp), %eax
	movl	24(%eax), %eax
	movl	%eax, (%esp)
	call	_GrFontBaselineGet
	shrl	%eax
	movl	%eax, %edx
	movl	$10, %eax
	subl	%edx, %eax
	movl	%eax, %ebx
	movl	_sContext+4, %eax
	movzwl	8(%eax), %eax
	shrw	%ax
	movzwl	%ax, %esi
	movl	$-1, 8(%esp)
	movl	136(%esp), %eax
	movl	%eax, 4(%esp)
	movl	140(%esp), %eax
	movl	%eax, (%esp)
	call	_GrStringWidthGet
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	subl	%eax, %esi
	movl	%esi, %eax
	movl	$0, 20(%esp)
	movl	%ebx, 16(%esp)
	movl	%eax, 12(%esp)
	movl	$-1, 8(%esp)
	movl	136(%esp), %eax
	movl	%eax, 4(%esp)
	movl	140(%esp), %eax
	movl	%eax, (%esp)
	call	_GrStringDraw
LBE4:
LBB5:
	.loc 1 314 0
	movl	$_sContext, 132(%esp)
LBB6:
	movl	132(%esp), %eax
	movl	4(%eax), %eax
	movl	%eax, 128(%esp)
	movl	128(%esp), %eax
	movl	36(%eax), %eax
	movl	128(%esp), %edx
	movl	4(%edx), %edx
	movl	%edx, (%esp)
	call	*%eax
LBE6:
LBE5:
	.loc 1 320 0
	movl	$_Timer0IntHandler, 4(%esp)
	movl	$35, (%esp)
	call	_IntRegister
	.loc 1 321 0
	movl	$_Timer1IntHandler, 4(%esp)
	movl	$37, (%esp)
	call	_IntRegister
	.loc 1 322 0
	movl	$_Timer0IntHandler, 8(%esp)
	movl	$255, 4(%esp)
	movl	$1073938432, (%esp)
	call	_TimerIntRegister
	.loc 1 323 0
	movl	$_Timer1IntHandler, 8(%esp)
	movl	$255, 4(%esp)
	movl	$1073942528, (%esp)
	call	_TimerIntRegister
	.loc 1 326 0
	movl	$-268434432, (%esp)
	call	_ROM_SysCtlPeripheralEnable
	.loc 1 327 0
	movl	$-268434431, (%esp)
	call	_ROM_SysCtlPeripheralEnable
	.loc 1 332 0
	movl	$50, 4(%esp)
	movl	$1073938432, (%esp)
	call	_ROM_TimerConfigure
	.loc 1 333 0
	movl	$50, 4(%esp)
	movl	$1073942528, (%esp)
	call	_ROM_TimerConfigure
	.loc 1 335 0
	call	_ROM_SysCtlClockGet
	movl	%eax, 36(%esp)
	fildl	36(%esp)
	fldt	LC2
	fmulp	%st, %st(1)
	fstpl	40(%esp)
	fldl	40(%esp)
	fstpl	8(%esp)
	movl	$255, 4(%esp)
	movl	$1073938432, (%esp)
	call	_ROM_TimerLoadSet
	.loc 1 336 0
	call	_ROM_SysCtlClockGet
	movl	%eax, 36(%esp)
	fildl	36(%esp)
	fldt	LC3
	fmulp	%st, %st(1)
	fstpl	40(%esp)
	fldl	40(%esp)
	fstpl	8(%esp)
	movl	$255, 4(%esp)
	movl	$1073942528, (%esp)
	call	_ROM_TimerLoadSet
	.loc 1 340 0
	movl	$35, (%esp)
	call	_ROM_IntEnable
	.loc 1 341 0
	movl	$37, (%esp)
	call	_ROM_IntEnable
	.loc 1 342 0
	movl	$1, 4(%esp)
	movl	$1073938432, (%esp)
	call	_ROM_TimerIntEnable
	.loc 1 343 0
	movl	$1, 4(%esp)
	movl	$1073942528, (%esp)
	call	_ROM_TimerIntEnable
	.loc 1 348 0
	movl	$255, 4(%esp)
	movl	$1073938432, (%esp)
	call	_ROM_TimerEnable
	.loc 1 349 0
	movl	$255, 4(%esp)
	movl	$1073942528, (%esp)
	call	_ROM_TimerEnable
	.loc 1 358 0
	movl	$_SysTickIntHandler, (%esp)
	call	_SysTickIntRegister
	.loc 1 361 0
	movl	$3, 4(%esp)
	movl	$15, (%esp)
	call	_IntPrioritySet
	.loc 1 365 0
	call	_SysCtlClockGet
	movl	%eax, _systick_period
	.loc 1 366 0
	movl	_systick_period, %eax
	movl	%eax, (%esp)
	call	_SysTickPeriodSet
	.loc 1 371 0
	call	_IntMasterEnable
	.loc 1 376 0
	call	_SysTickIntEnable
	.loc 1 382 0
	movl	_measuretype, %eax
	cmpl	$1, %eax
	jne	L18
	.loc 1 383 0
	movl	$-1, _arrayPtr
	jmp	L19
L18:
	.loc 1 385 0
	movl	$0, _arrayPtr
L19:
	.loc 1 389 0
	movl	$0, 124(%esp)
	.loc 1 390 0
	movl	$0, 120(%esp)
	.loc 1 397 0
	movb	$1, 175(%esp)
	.loc 1 398 0
	movl	$0, 116(%esp)
	.loc 1 399 0
	call	_SysTickEnable
	.loc 1 402 0
	movl	$-536813544, %eax
	movl	(%eax), %eax
	movl	%eax, 112(%esp)
	.loc 1 403 0
	movl	$10, (%esp)
	call	_Delay
	.loc 1 404 0
	movl	$10, (%esp)
	call	_Delay
	.loc 1 406 0
	movl	$-536813544, %eax
	movl	(%eax), %eax
	movl	%eax, 108(%esp)
	.loc 1 408 0
	movl	108(%esp), %eax
	movl	112(%esp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 8(%esp)
	movl	$LC4, 4(%esp)
	leal	74(%esp), %eax
	movl	%eax, (%esp)
	call	_usprintf
	.loc 1 409 0
	movl	$1, 20(%esp)
	movl	$46, 16(%esp)
	movl	$48, 12(%esp)
	movl	$-1, 8(%esp)
	leal	74(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$_sContext, (%esp)
	call	_GrStringDraw
L32:
	.loc 1 414 0
	cmpb	$0, 175(%esp)
	je	L20
	.loc 1 430 0
	movb	$0, 175(%esp)
L20:
	.loc 1 434 0
	movl	_arrayPtr, %eax
	cmpl	$50, %eax
	jbe	L21
	.loc 1 434 0 is_stmt 0 discriminator 1
	cmpb	$0, 175(%esp)
	je	L21
LBB7:
	.loc 1 435 0 is_stmt 1
	movl	$0, 168(%esp)
	.loc 1 436 0
	movl	_measuretype, %eax
	testl	%eax, %eax
	jne	L22
LBB8:
	.loc 1 437 0
	movl	_array, %eax
	cltd
	xorl	%edx, %eax
	subl	%edx, %eax
	movl	%eax, 164(%esp)
	.loc 1 438 0
	movl	164(%esp), %eax
	movl	%eax, 160(%esp)
LBB9:
	.loc 1 439 0
	movl	$1, 156(%esp)
	jmp	L23
L26:
	.loc 1 440 0
	movl	156(%esp), %eax
	movl	_array(,%eax,4), %eax
	cmpl	164(%esp), %eax
	jae	L24
	.loc 1 440 0 is_stmt 0 discriminator 1
	movl	156(%esp), %eax
	movl	_array(,%eax,4), %eax
	movl	%eax, 164(%esp)
L24:
	.loc 1 441 0 is_stmt 1
	movl	156(%esp), %eax
	movl	_array(,%eax,4), %eax
	cmpl	160(%esp), %eax
	jbe	L25
	.loc 1 441 0 is_stmt 0 discriminator 1
	movl	156(%esp), %eax
	movl	_array(,%eax,4), %eax
	movl	%eax, 160(%esp)
L25:
	.loc 1 442 0 is_stmt 1
	movl	156(%esp), %eax
	movl	_array(,%eax,4), %eax
	addl	%eax, 168(%esp)
	.loc 1 439 0
	addl	$1, 156(%esp)
L23:
	.loc 1 439 0 is_stmt 0 discriminator 1
	cmpl	$50, 156(%esp)
	jle	L26
LBE9:
	.loc 1 444 0 is_stmt 1
	movl	168(%esp), %eax
	movl	$-1600085855, %edx
	mull	%edx
	movl	%edx, %eax
	shrl	$5, %eax
	movl	%eax, 168(%esp)
LBE8:
	jmp	L27
L22:
LBB10:
	.loc 1 460 0
	movl	$255, 4(%esp)
	movl	$1073938432, (%esp)
	call	_TimerLoadGet
	movl	%eax, 104(%esp)
	.loc 1 462 0
	movl	_array, %eax
	subl	104(%esp), %eax
	movl	%eax, 164(%esp)
	.loc 1 463 0
	movl	164(%esp), %eax
	movl	%eax, 160(%esp)
LBB11:
	.loc 1 464 0
	movl	$0, 152(%esp)
	jmp	L28
L31:
	.loc 1 465 0
	movl	152(%esp), %eax
	movl	_array(,%eax,4), %eax
	subl	104(%esp), %eax
	movl	%eax, 100(%esp)
	.loc 1 466 0
	movl	100(%esp), %eax
	cmpl	164(%esp), %eax
	jae	L29
	.loc 1 466 0 is_stmt 0 discriminator 1
	movl	100(%esp), %eax
	movl	%eax, 164(%esp)
L29:
	.loc 1 467 0 is_stmt 1
	movl	100(%esp), %eax
	cmpl	160(%esp), %eax
	jbe	L30
	.loc 1 467 0 is_stmt 0 discriminator 1
	movl	100(%esp), %eax
	movl	%eax, 160(%esp)
L30:
	.loc 1 468 0 is_stmt 1
	movl	100(%esp), %eax
	addl	%eax, 168(%esp)
	.loc 1 464 0
	addl	$1, 152(%esp)
L28:
	.loc 1 464 0 is_stmt 0 discriminator 1
	cmpl	$50, 152(%esp)
	jle	L31
LBE11:
	.loc 1 470 0 is_stmt 1
	movl	168(%esp), %eax
	movl	$-1600085855, %edx
	mull	%edx
	movl	%edx, %eax
	shrl	$5, %eax
	movl	%eax, 168(%esp)
L27:
LBE10:
	.loc 1 474 0 discriminator 1
	movl	164(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$LC4, 4(%esp)
	leal	69(%esp), %eax
	movl	%eax, (%esp)
	call	_usprintf
	.loc 1 475 0 discriminator 1
	movl	160(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$LC4, 4(%esp)
	leal	64(%esp), %eax
	movl	%eax, (%esp)
	call	_usprintf
	.loc 1 476 0 discriminator 1
	movl	168(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$LC4, 4(%esp)
	leal	59(%esp), %eax
	movl	%eax, (%esp)
	call	_usprintf
	.loc 1 478 0 discriminator 1
	movw	$63, 90(%esp)
LBB12:
	.loc 1 479 0 discriminator 1
	movl	$_sContext, 96(%esp)
	movl	96(%esp), %eax
	movl	4(%eax), %eax
	movl	32(%eax), %eax
	movl	96(%esp), %edx
	movl	4(%edx), %edx
	movl	4(%edx), %edx
	movl	$0, 4(%esp)
	movl	%edx, (%esp)
	call	*%eax
	movl	96(%esp), %edx
	movl	%eax, 16(%edx)
LBE12:
	.loc 1 480 0 discriminator 1
	leal	84(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$_sContext, (%esp)
	call	_GrRectFill
LBB13:
	.loc 1 482 0 discriminator 1
	movl	$_sContext, 92(%esp)
	movl	92(%esp), %eax
	movl	4(%eax), %eax
	movl	32(%eax), %eax
	movl	92(%esp), %edx
	movl	4(%edx), %edx
	movl	4(%edx), %edx
	movl	$16777215, 4(%esp)
	movl	%edx, (%esp)
	call	*%eax
	movl	92(%esp), %edx
	movl	%eax, 16(%edx)
LBE13:
	.loc 1 483 0 discriminator 1
	call	_ROM_IntMasterDisable
	.loc 1 484 0 discriminator 1
	movl	$1, 20(%esp)
	movl	$22, 16(%esp)
	movl	$40, 12(%esp)
	movl	$-1, 8(%esp)
	leal	69(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$_sContext, (%esp)
	call	_GrStringDraw
	.loc 1 485 0 discriminator 1
	movl	$1, 20(%esp)
	movl	$34, 16(%esp)
	movl	$40, 12(%esp)
	movl	$-1, 8(%esp)
	leal	64(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$_sContext, (%esp)
	call	_GrStringDraw
	.loc 1 486 0 discriminator 1
	movl	$1, 20(%esp)
	movl	$46, 16(%esp)
	movl	$40, 12(%esp)
	movl	$-1, 8(%esp)
	leal	59(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$_sContext, (%esp)
	call	_GrStringDraw
	.loc 1 487 0 discriminator 1
	call	_ROM_IntMasterEnable
	.loc 1 488 0 discriminator 1
	movb	$0, 175(%esp)
LBE7:
	.loc 1 490 0 discriminator 1
	jmp	L32
L21:
	.loc 1 490 0 is_stmt 0
	jmp	L32
	.cfi_endproc
LFE12:
	.section .rdata,"dr"
	.align 16
LC2:
	.long	741070837
	.long	-1058005064
	.long	16367
	.align 16
LC3:
	.long	-501652180
	.long	-776530088
	.long	16369
	.text
Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "../../../../grlib/grlib.h"
	.file 4 "/usr/include/sys/types.h"
	.file 5 "<built-in>"
	.file 6 "../drivers/cfal96x64x16.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0xda1
	.word	0x4
	.secrel32	Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii "GNU C 4.8.2 -mtune=generic -march=i686 -g -std=c99\0"
	.byte	0x1
	.ascii "exercise1.c\0"
	.ascii "/cygdrive/c/emsys/TivaC1157/examples/boards/ek-lm4f232/exercise1\0"
	.long	Ltext0
	.long	Letext0-Ltext0
	.secrel32	Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.uleb128 0x3
	.ascii "int16_t\0"
	.byte	0x2
	.byte	0x15
	.long	0xb7
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.ascii "short int\0"
	.uleb128 0x3
	.ascii "int32_t\0"
	.byte	0x2
	.byte	0x16
	.long	0xd3
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.ascii "long long int\0"
	.uleb128 0x3
	.ascii "uint8_t\0"
	.byte	0x2
	.byte	0x1e
	.long	0xfa
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x3
	.ascii "uint16_t\0"
	.byte	0x2
	.byte	0x1f
	.long	0x11b
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.ascii "short unsigned int\0"
	.uleb128 0x3
	.ascii "uint32_t\0"
	.byte	0x2
	.byte	0x22
	.long	0x141
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "unsigned int\0"
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x4
	.byte	0x8
	.byte	0x3
	.byte	0x36
	.long	0x1b4
	.uleb128 0x5
	.ascii "i16XMin\0"
	.byte	0x3
	.byte	0x3b
	.long	0xa8
	.byte	0
	.uleb128 0x5
	.ascii "i16YMin\0"
	.byte	0x3
	.byte	0x40
	.long	0xa8
	.byte	0x2
	.uleb128 0x5
	.ascii "i16XMax\0"
	.byte	0x3
	.byte	0x45
	.long	0xa8
	.byte	0x4
	.uleb128 0x5
	.ascii "i16YMax\0"
	.byte	0x3
	.byte	0x4a
	.long	0xa8
	.byte	0x6
	.byte	0
	.uleb128 0x3
	.ascii "tRectangle\0"
	.byte	0x3
	.byte	0x4c
	.long	0x16b
	.uleb128 0x4
	.byte	0x28
	.byte	0x3
	.byte	0x53
	.long	0x2b5
	.uleb128 0x5
	.ascii "i32Size\0"
	.byte	0x3
	.byte	0x58
	.long	0xc4
	.byte	0
	.uleb128 0x5
	.ascii "pvDisplayData\0"
	.byte	0x3
	.byte	0x5d
	.long	0x2b5
	.byte	0x4
	.uleb128 0x5
	.ascii "ui16Width\0"
	.byte	0x3
	.byte	0x62
	.long	0x10b
	.byte	0x8
	.uleb128 0x5
	.ascii "ui16Height\0"
	.byte	0x3
	.byte	0x67
	.long	0x10b
	.byte	0xa
	.uleb128 0x5
	.ascii "pfnPixelDraw\0"
	.byte	0x3
	.byte	0x6c
	.long	0x2d1
	.byte	0xc
	.uleb128 0x5
	.ascii "pfnPixelDrawMultiple\0"
	.byte	0x3
	.byte	0x75
	.long	0x310
	.byte	0x10
	.uleb128 0x5
	.ascii "pfnLineDrawH\0"
	.byte	0x3
	.byte	0x7e
	.long	0x335
	.byte	0x14
	.uleb128 0x5
	.ascii "pfnLineDrawV\0"
	.byte	0x3
	.byte	0x84
	.long	0x335
	.byte	0x18
	.uleb128 0x5
	.ascii "pfnRectFill\0"
	.byte	0x3
	.byte	0x8a
	.long	0x35b
	.byte	0x1c
	.uleb128 0x5
	.ascii "pfnColorTranslate\0"
	.byte	0x3
	.byte	0x91
	.long	0x375
	.byte	0x20
	.uleb128 0x5
	.ascii "pfnFlush\0"
	.byte	0x3
	.byte	0x97
	.long	0x386
	.byte	0x24
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.uleb128 0x7
	.long	0x2d1
	.uleb128 0x8
	.long	0x2b5
	.uleb128 0x8
	.long	0xc4
	.uleb128 0x8
	.long	0xc4
	.uleb128 0x8
	.long	0x131
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x2b7
	.uleb128 0x7
	.long	0x305
	.uleb128 0x8
	.long	0x2b5
	.uleb128 0x8
	.long	0xc4
	.uleb128 0x8
	.long	0xc4
	.uleb128 0x8
	.long	0xc4
	.uleb128 0x8
	.long	0xc4
	.uleb128 0x8
	.long	0xc4
	.uleb128 0x8
	.long	0x305
	.uleb128 0x8
	.long	0x305
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x30b
	.uleb128 0xa
	.long	0xeb
	.uleb128 0x9
	.byte	0x4
	.long	0x2d7
	.uleb128 0x7
	.long	0x335
	.uleb128 0x8
	.long	0x2b5
	.uleb128 0x8
	.long	0xc4
	.uleb128 0x8
	.long	0xc4
	.uleb128 0x8
	.long	0xc4
	.uleb128 0x8
	.long	0x131
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x316
	.uleb128 0x7
	.long	0x350
	.uleb128 0x8
	.long	0x2b5
	.uleb128 0x8
	.long	0x350
	.uleb128 0x8
	.long	0x131
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x356
	.uleb128 0xa
	.long	0x1b4
	.uleb128 0x9
	.byte	0x4
	.long	0x33b
	.uleb128 0xb
	.long	0x131
	.long	0x375
	.uleb128 0x8
	.long	0x2b5
	.uleb128 0x8
	.long	0x131
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x361
	.uleb128 0x7
	.long	0x386
	.uleb128 0x8
	.long	0x2b5
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x37b
	.uleb128 0x3
	.ascii "tDisplay\0"
	.byte	0x3
	.byte	0x99
	.long	0x1c6
	.uleb128 0x4
	.byte	0xc8
	.byte	0x3
	.byte	0xae
	.long	0x416
	.uleb128 0x5
	.ascii "ui8Format\0"
	.byte	0x3
	.byte	0xb4
	.long	0xeb
	.byte	0
	.uleb128 0x5
	.ascii "ui8MaxWidth\0"
	.byte	0x3
	.byte	0xbb
	.long	0xeb
	.byte	0x1
	.uleb128 0x5
	.ascii "ui8Height\0"
	.byte	0x3
	.byte	0xc1
	.long	0xeb
	.byte	0x2
	.uleb128 0x5
	.ascii "ui8Baseline\0"
	.byte	0x3
	.byte	0xc8
	.long	0xeb
	.byte	0x3
	.uleb128 0x5
	.ascii "pui16Offset\0"
	.byte	0x3
	.byte	0xcd
	.long	0x416
	.byte	0x4
	.uleb128 0x5
	.ascii "pui8Data\0"
	.byte	0x3
	.byte	0xd2
	.long	0x305
	.byte	0xc4
	.byte	0
	.uleb128 0xc
	.long	0x10b
	.long	0x426
	.uleb128 0xd
	.long	0x426
	.byte	0x5f
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "sizetype\0"
	.uleb128 0x3
	.ascii "tFont\0"
	.byte	0x3
	.byte	0xd4
	.long	0x39c
	.uleb128 0x9
	.byte	0x4
	.long	0x131
	.uleb128 0xe
	.byte	0x8
	.byte	0x3
	.word	0x2e2
	.long	0x496
	.uleb128 0xf
	.ascii "ui16SrcCodepage\0"
	.byte	0x3
	.word	0x2e7
	.long	0x10b
	.byte	0
	.uleb128 0xf
	.ascii "ui16FontCodepage\0"
	.byte	0x3
	.word	0x2ec
	.long	0x10b
	.byte	0x2
	.uleb128 0xf
	.ascii "pfnMapChar\0"
	.byte	0x3
	.word	0x2f2
	.long	0x4c2
	.byte	0x4
	.byte	0
	.uleb128 0xb
	.long	0x131
	.long	0x4af
	.uleb128 0x8
	.long	0x4af
	.uleb128 0x8
	.long	0x131
	.uleb128 0x8
	.long	0x43f
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x4b5
	.uleb128 0xa
	.long	0x4ba
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.uleb128 0x9
	.byte	0x4
	.long	0x496
	.uleb128 0x10
	.ascii "tCodePointMap\0"
	.byte	0x3
	.word	0x2f5
	.long	0x445
	.uleb128 0x9
	.byte	0x4
	.long	0x4e4
	.uleb128 0x7
	.long	0x508
	.uleb128 0x8
	.long	0x508
	.uleb128 0x8
	.long	0x4af
	.uleb128 0x8
	.long	0xc4
	.uleb128 0x8
	.long	0xc4
	.uleb128 0x8
	.long	0xc4
	.uleb128 0x8
	.long	0x638
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x50e
	.uleb128 0xa
	.long	0x513
	.uleb128 0x11
	.ascii "_tContext\0"
	.byte	0x2c
	.byte	0x3
	.word	0x33f
	.long	0x638
	.uleb128 0xf
	.ascii "i32Size\0"
	.byte	0x3
	.word	0x345
	.long	0xc4
	.byte	0
	.uleb128 0xf
	.ascii "psDisplay\0"
	.byte	0x3
	.word	0x34a
	.long	0x641
	.byte	0x4
	.uleb128 0xf
	.ascii "sClipRegion\0"
	.byte	0x3
	.word	0x34f
	.long	0x1b4
	.byte	0x8
	.uleb128 0xf
	.ascii "ui32Foreground\0"
	.byte	0x3
	.word	0x354
	.long	0x131
	.byte	0x10
	.uleb128 0xf
	.ascii "ui32Background\0"
	.byte	0x3
	.word	0x359
	.long	0x131
	.byte	0x14
	.uleb128 0xf
	.ascii "psFont\0"
	.byte	0x3
	.word	0x35e
	.long	0x64c
	.byte	0x18
	.uleb128 0xf
	.ascii "pfnStringRenderer\0"
	.byte	0x3
	.word	0x366
	.long	0x4de
	.byte	0x1c
	.uleb128 0xf
	.ascii "pCodePointMapTable\0"
	.byte	0x3
	.word	0x36d
	.long	0x657
	.byte	0x20
	.uleb128 0xf
	.ascii "ui16Codepage\0"
	.byte	0x3
	.word	0x372
	.long	0x10b
	.byte	0x24
	.uleb128 0xf
	.ascii "ui8NumCodePointMaps\0"
	.byte	0x3
	.word	0x377
	.long	0xeb
	.byte	0x26
	.uleb128 0xf
	.ascii "ui8CodePointMap\0"
	.byte	0x3
	.word	0x37d
	.long	0xeb
	.byte	0x27
	.uleb128 0xf
	.ascii "ui8Reserved\0"
	.byte	0x3
	.word	0x382
	.long	0xeb
	.byte	0x28
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.ascii "_Bool\0"
	.uleb128 0x9
	.byte	0x4
	.long	0x647
	.uleb128 0xa
	.long	0x38c
	.uleb128 0x9
	.byte	0x4
	.long	0x652
	.uleb128 0xa
	.long	0x432
	.uleb128 0x9
	.byte	0x4
	.long	0x65d
	.uleb128 0xa
	.long	0x4c8
	.uleb128 0x10
	.ascii "tContext\0"
	.byte	0x3
	.word	0x385
	.long	0x513
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii "long int\0"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "long unsigned int\0"
	.uleb128 0x3
	.ascii "uint\0"
	.byte	0x4
	.byte	0x70
	.long	0x141
	.uleb128 0x12
	.byte	0x4
	.byte	0x1
	.byte	0x65
	.long	0x6c3
	.uleb128 0x13
	.ascii "latency\0"
	.sleb128 0
	.uleb128 0x13
	.ascii "sysTickJitter\0"
	.sleb128 1
	.byte	0
	.uleb128 0x3
	.ascii "measureType\0"
	.byte	0x1
	.byte	0x67
	.long	0x6a0
	.uleb128 0x14
	.ascii "ConfigureUART\0"
	.byte	0x1
	.byte	0x71
	.long	LFB6
	.long	LFE6-LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x746
	.uleb128 0x15
	.secrel32	LASF0
	.byte	0x1
	.byte	0x76
	.long	0xd3
	.long	0x706
	.uleb128 0x16
	.byte	0
	.uleb128 0x17
	.ascii "ROM_GPIOPinConfigure\0"
	.byte	0x1
	.byte	0x80
	.long	0xd3
	.long	0x728
	.uleb128 0x16
	.byte	0
	.uleb128 0x18
	.ascii "ROM_GPIOPinTypeUART\0"
	.byte	0x1
	.byte	0x82
	.long	0xd3
	.uleb128 0x16
	.byte	0
	.byte	0
	.uleb128 0x19
	.ascii "SysTickIntHandler\0"
	.byte	0x1
	.byte	0x94
	.long	LFB7
	.long	LFE7-LFB7
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1a
	.ascii "GetSysTime\0"
	.byte	0x1
	.byte	0x9f
	.long	0x694
	.long	LFB8
	.long	LFE8-LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x795
	.uleb128 0x1b
	.ascii "tick\0"
	.byte	0x1
	.byte	0xa1
	.long	0x694
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x14
	.ascii "Timer0IntHandler\0"
	.byte	0x1
	.byte	0xac
	.long	LFB9
	.long	LFE9-LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x7d4
	.uleb128 0x1b
	.ascii "temp\0"
	.byte	0x1
	.byte	0xae
	.long	0x694
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.secrel32	LASF1
	.byte	0x1
	.byte	0xbf
	.long	0xd3
	.uleb128 0x16
	.byte	0
	.byte	0
	.uleb128 0x14
	.ascii "Timer1IntHandler\0"
	.byte	0x1
	.byte	0xcd
	.long	LFB10
	.long	LFE10-LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x804
	.uleb128 0x1c
	.secrel32	LASF1
	.byte	0x1
	.byte	0xbf
	.long	0xd3
	.uleb128 0x16
	.byte	0
	.byte	0
	.uleb128 0x1d
	.ascii "Delay\0"
	.byte	0x1
	.byte	0xe7
	.long	LFB11
	.long	LFE11-LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x864
	.uleb128 0x1e
	.ascii "ui32MicroSecs\0"
	.byte	0x1
	.byte	0xe7
	.long	0x131
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1b
	.ascii "duration\0"
	.byte	0x1
	.byte	0xe8
	.long	0x131
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1f
	.secrel32	LASF2
	.byte	0x1
	.byte	0xe9
	.long	0x131
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1b
	.ascii "temp\0"
	.byte	0x1
	.byte	0xea
	.long	0x131
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x20
	.ascii "main\0"
	.byte	0x1
	.byte	0xfe
	.long	0xd3
	.long	LFB12
	.long	LFE12-LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0xc33
	.uleb128 0x21
	.ascii "sRect\0"
	.byte	0x1
	.word	0x100
	.long	0x1b4
	.uleb128 0x3
	.byte	0x74
	.sleb128 84
	.uleb128 0x22
	.ascii "ROM_FPULazyStackingEnable\0"
	.byte	0x1
	.word	0x106
	.long	0xd3
	.long	0x8b8
	.uleb128 0x16
	.byte	0
	.uleb128 0x22
	.ascii "ROM_SysCtlClockSet\0"
	.byte	0x1
	.word	0x10b
	.long	0xd3
	.long	0x8d9
	.uleb128 0x16
	.byte	0
	.uleb128 0x15
	.secrel32	LASF0
	.byte	0x1
	.byte	0x76
	.long	0xd3
	.long	0x8ea
	.uleb128 0x16
	.byte	0
	.uleb128 0x22
	.ascii "ROM_TimerConfigure\0"
	.byte	0x1
	.word	0x14c
	.long	0xd3
	.long	0x90b
	.uleb128 0x16
	.byte	0
	.uleb128 0x22
	.ascii "ROM_TimerLoadSet\0"
	.byte	0x1
	.word	0x14f
	.long	0xd3
	.long	0x92a
	.uleb128 0x16
	.byte	0
	.uleb128 0x22
	.ascii "ROM_SysCtlClockGet\0"
	.byte	0x1
	.word	0x14f
	.long	0xd3
	.long	0x94b
	.uleb128 0x16
	.byte	0
	.uleb128 0x22
	.ascii "ROM_IntEnable\0"
	.byte	0x1
	.word	0x154
	.long	0xd3
	.long	0x967
	.uleb128 0x16
	.byte	0
	.uleb128 0x22
	.ascii "ROM_TimerIntEnable\0"
	.byte	0x1
	.word	0x156
	.long	0xd3
	.long	0x988
	.uleb128 0x16
	.byte	0
	.uleb128 0x22
	.ascii "ROM_TimerEnable\0"
	.byte	0x1
	.word	0x15c
	.long	0xd3
	.long	0x9a6
	.uleb128 0x16
	.byte	0
	.uleb128 0x21
	.ascii "str\0"
	.byte	0x1
	.word	0x184
	.long	0xc33
	.uleb128 0x3
	.byte	0x74
	.sleb128 74
	.uleb128 0x23
	.secrel32	LASF2
	.byte	0x1
	.word	0x185
	.long	0x131
	.uleb128 0x3
	.byte	0x74
	.sleb128 124
	.uleb128 0x21
	.ascii "mytime\0"
	.byte	0x1
	.word	0x186
	.long	0x131
	.uleb128 0x3
	.byte	0x74
	.sleb128 120
	.uleb128 0x21
	.ascii "myswitch\0"
	.byte	0x1
	.word	0x18d
	.long	0x638
	.uleb128 0x3
	.byte	0x74
	.sleb128 175
	.uleb128 0x21
	.ascii "interval\0"
	.byte	0x1
	.word	0x18e
	.long	0x694
	.uleb128 0x3
	.byte	0x74
	.sleb128 116
	.uleb128 0x21
	.ascii "start\0"
	.byte	0x1
	.word	0x192
	.long	0x694
	.uleb128 0x3
	.byte	0x74
	.sleb128 112
	.uleb128 0x21
	.ascii "end\0"
	.byte	0x1
	.word	0x196
	.long	0x694
	.uleb128 0x3
	.byte	0x74
	.sleb128 108
	.uleb128 0x24
	.long	LBB2
	.long	LBE2-LBB2
	.long	0xa42
	.uleb128 0x21
	.ascii "pC\0"
	.byte	0x1
	.word	0x127
	.long	0xc43
	.uleb128 0x3
	.byte	0x74
	.sleb128 148
	.byte	0
	.uleb128 0x24
	.long	LBB3
	.long	LBE3-LBB3
	.long	0xa5f
	.uleb128 0x21
	.ascii "pC\0"
	.byte	0x1
	.word	0x12d
	.long	0xc43
	.uleb128 0x3
	.byte	0x74
	.sleb128 144
	.byte	0
	.uleb128 0x24
	.long	LBB4
	.long	LBE4-LBB4
	.long	0xa8e
	.uleb128 0x21
	.ascii "pC\0"
	.byte	0x1
	.word	0x134
	.long	0xc49
	.uleb128 0x3
	.byte	0x74
	.sleb128 140
	.uleb128 0x21
	.ascii "pcStr\0"
	.byte	0x1
	.word	0x134
	.long	0x4af
	.uleb128 0x3
	.byte	0x74
	.sleb128 136
	.byte	0
	.uleb128 0x24
	.long	LBB5
	.long	LBE5-LBB5
	.long	0xac4
	.uleb128 0x21
	.ascii "pC\0"
	.byte	0x1
	.word	0x13a
	.long	0xc49
	.uleb128 0x3
	.byte	0x74
	.sleb128 132
	.uleb128 0x25
	.long	LBB6
	.long	LBE6-LBB6
	.uleb128 0x21
	.ascii "pD\0"
	.byte	0x1
	.word	0x13a
	.long	0x641
	.uleb128 0x3
	.byte	0x74
	.sleb128 128
	.byte	0
	.byte	0
	.uleb128 0x25
	.long	LBB7
	.long	LBE7-LBB7
	.uleb128 0x21
	.ascii "ave\0"
	.byte	0x1
	.word	0x1b3
	.long	0x694
	.uleb128 0x3
	.byte	0x74
	.sleb128 168
	.uleb128 0x21
	.ascii "min\0"
	.byte	0x1
	.word	0x1b3
	.long	0x694
	.uleb128 0x3
	.byte	0x74
	.sleb128 164
	.uleb128 0x21
	.ascii "max\0"
	.byte	0x1
	.word	0x1b3
	.long	0x694
	.uleb128 0x3
	.byte	0x74
	.sleb128 160
	.uleb128 0x21
	.ascii "str1\0"
	.byte	0x1
	.word	0x1d9
	.long	0xc54
	.uleb128 0x3
	.byte	0x74
	.sleb128 69
	.uleb128 0x21
	.ascii "str2\0"
	.byte	0x1
	.word	0x1d9
	.long	0xc54
	.uleb128 0x3
	.byte	0x74
	.sleb128 64
	.uleb128 0x21
	.ascii "str3\0"
	.byte	0x1
	.word	0x1d9
	.long	0xc54
	.uleb128 0x2
	.byte	0x74
	.sleb128 59
	.uleb128 0x22
	.ascii "ROM_IntMasterDisable\0"
	.byte	0x1
	.word	0x1e3
	.long	0xd3
	.long	0xb52
	.uleb128 0x16
	.byte	0
	.uleb128 0x22
	.ascii "ROM_IntMasterEnable\0"
	.byte	0x1
	.word	0x1e7
	.long	0xd3
	.long	0xb74
	.uleb128 0x16
	.byte	0
	.uleb128 0x24
	.long	LBB8
	.long	LBE8-LBB8
	.long	0xbab
	.uleb128 0x17
	.ascii "abs\0"
	.byte	0x5
	.byte	0
	.long	0xd3
	.long	0xb92
	.uleb128 0x16
	.byte	0
	.uleb128 0x25
	.long	LBB9
	.long	LBE9-LBB9
	.uleb128 0x21
	.ascii "i\0"
	.byte	0x1
	.word	0x1b7
	.long	0xd3
	.uleb128 0x3
	.byte	0x74
	.sleb128 156
	.byte	0
	.byte	0
	.uleb128 0x24
	.long	LBB10
	.long	LBE10-LBB10
	.long	0xbfb
	.uleb128 0x21
	.ascii "timer0period\0"
	.byte	0x1
	.word	0x1cc
	.long	0x694
	.uleb128 0x3
	.byte	0x74
	.sleb128 104
	.uleb128 0x21
	.ascii "temp\0"
	.byte	0x1
	.word	0x1cd
	.long	0x694
	.uleb128 0x3
	.byte	0x74
	.sleb128 100
	.uleb128 0x25
	.long	LBB11
	.long	LBE11-LBB11
	.uleb128 0x21
	.ascii "i\0"
	.byte	0x1
	.word	0x1d0
	.long	0xd3
	.uleb128 0x3
	.byte	0x74
	.sleb128 152
	.byte	0
	.byte	0
	.uleb128 0x24
	.long	LBB12
	.long	LBE12-LBB12
	.long	0xc18
	.uleb128 0x21
	.ascii "pC\0"
	.byte	0x1
	.word	0x1df
	.long	0xc43
	.uleb128 0x3
	.byte	0x74
	.sleb128 96
	.byte	0
	.uleb128 0x25
	.long	LBB13
	.long	LBE13-LBB13
	.uleb128 0x21
	.ascii "pC\0"
	.byte	0x1
	.word	0x1e2
	.long	0xc43
	.uleb128 0x3
	.byte	0x74
	.sleb128 92
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x4ba
	.long	0xc43
	.uleb128 0xd
	.long	0x426
	.byte	0x9
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x662
	.uleb128 0x9
	.byte	0x4
	.long	0xc4f
	.uleb128 0xa
	.long	0x662
	.uleb128 0xc
	.long	0x4ba
	.long	0xc64
	.uleb128 0xd
	.long	0x426
	.byte	0x4
	.byte	0
	.uleb128 0x26
	.ascii "g_sFontCm12\0"
	.byte	0x3
	.word	0x5db
	.long	0x652
	.uleb128 0x27
	.ascii "g_sCFAL96x64x16\0"
	.byte	0x6
	.byte	0x23
	.long	0x647
	.uleb128 0x28
	.ascii "g_ui32Flags\0"
	.byte	0x1
	.byte	0x56
	.long	0x131
	.uleb128 0x5
	.byte	0x3
	.long	_g_ui32Flags
	.uleb128 0x28
	.ascii "timer0Count\0"
	.byte	0x1
	.byte	0x5c
	.long	0xcc1
	.uleb128 0x5
	.byte	0x3
	.long	_timer0Count
	.uleb128 0x29
	.long	0x131
	.uleb128 0x28
	.ascii "timer1Count\0"
	.byte	0x1
	.byte	0x5d
	.long	0xcc1
	.uleb128 0x5
	.byte	0x3
	.long	_timer1Count
	.uleb128 0x28
	.ascii "SysTickCount\0"
	.byte	0x1
	.byte	0x5e
	.long	0xcc1
	.uleb128 0x5
	.byte	0x3
	.long	_SysTickCount
	.uleb128 0x28
	.ascii "sContext\0"
	.byte	0x1
	.byte	0x5f
	.long	0xd0f
	.uleb128 0x5
	.byte	0x3
	.long	_sContext
	.uleb128 0x29
	.long	0x662
	.uleb128 0x28
	.ascii "resolution\0"
	.byte	0x1
	.byte	0x60
	.long	0x694
	.uleb128 0x5
	.byte	0x3
	.long	_resolution
	.uleb128 0x28
	.ascii "systick_period\0"
	.byte	0x1
	.byte	0x61
	.long	0x131
	.uleb128 0x5
	.byte	0x3
	.long	_systick_period
	.uleb128 0xc
	.long	0x694
	.long	0xd58
	.uleb128 0xd
	.long	0x426
	.byte	0x32
	.byte	0
	.uleb128 0x28
	.ascii "array\0"
	.byte	0x1
	.byte	0x63
	.long	0xd6b
	.uleb128 0x5
	.byte	0x3
	.long	_array
	.uleb128 0x29
	.long	0xd48
	.uleb128 0x28
	.ascii "arrayPtr\0"
	.byte	0x1
	.byte	0x64
	.long	0xd86
	.uleb128 0x5
	.byte	0x3
	.long	_arrayPtr
	.uleb128 0x29
	.long	0x694
	.uleb128 0x28
	.ascii "measuretype\0"
	.byte	0x1
	.byte	0x69
	.long	0x6c3
	.uleb128 0x5
	.byte	0x3
	.long	_measuretype
	.byte	0
	.section	.debug_abbrev,"dr"
Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0x8
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1b
	.uleb128 0x8
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"dr"
	.long	0x1c
	.word	0x2
	.secrel32	Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	Ltext0
	.long	Letext0-Ltext0
	.long	0
	.long	0
	.section	.debug_line,"dr"
Ldebug_line0:
	.section	.debug_str,"dr"
LASF1:
	.ascii "ROM_TimerIntClear\0"
LASF2:
	.ascii "prevtime\0"
LASF0:
	.ascii "ROM_SysCtlPeripheralEnable\0"
	.ident	"GCC: (GNU) 4.8.2"
	.def	_ROM_SysCtlPeripheralEnable;	.scl	2;	.type	32;	.endef
	.def	_ROM_GPIOPinConfigure;	.scl	2;	.type	32;	.endef
	.def	_ROM_GPIOPinTypeUART;	.scl	2;	.type	32;	.endef
	.def	_UARTClockSourceSet;	.scl	2;	.type	32;	.endef
	.def	_UARTStdioConfig;	.scl	2;	.type	32;	.endef
	.def	_SysTickValueGet;	.scl	2;	.type	32;	.endef
	.def	_TimerValueGet;	.scl	2;	.type	32;	.endef
	.def	_IntMasterDisable;	.scl	2;	.type	32;	.endef
	.def	_ROM_TimerIntClear;	.scl	2;	.type	32;	.endef
	.def	_ROM_FPULazyStackingEnable;	.scl	2;	.type	32;	.endef
	.def	_ROM_SysCtlClockSet;	.scl	2;	.type	32;	.endef
	.def	_UARTprintf;	.scl	2;	.type	32;	.endef
	.def	_CFAL96x64x16Init;	.scl	2;	.type	32;	.endef
	.def	_GrContextInit;	.scl	2;	.type	32;	.endef
	.def	_GrRectFill;	.scl	2;	.type	32;	.endef
	.def	_GrRectDraw;	.scl	2;	.type	32;	.endef
	.def	_GrContextFontSet;	.scl	2;	.type	32;	.endef
	.def	_GrFontBaselineGet;	.scl	2;	.type	32;	.endef
	.def	_GrStringWidthGet;	.scl	2;	.type	32;	.endef
	.def	_GrStringDraw;	.scl	2;	.type	32;	.endef
	.def	_IntRegister;	.scl	2;	.type	32;	.endef
	.def	_TimerIntRegister;	.scl	2;	.type	32;	.endef
	.def	_ROM_TimerConfigure;	.scl	2;	.type	32;	.endef
	.def	_ROM_SysCtlClockGet;	.scl	2;	.type	32;	.endef
	.def	_ROM_TimerLoadSet;	.scl	2;	.type	32;	.endef
	.def	_ROM_IntEnable;	.scl	2;	.type	32;	.endef
	.def	_ROM_TimerIntEnable;	.scl	2;	.type	32;	.endef
	.def	_ROM_TimerEnable;	.scl	2;	.type	32;	.endef
	.def	_SysTickIntRegister;	.scl	2;	.type	32;	.endef
	.def	_IntPrioritySet;	.scl	2;	.type	32;	.endef
	.def	_SysCtlClockGet;	.scl	2;	.type	32;	.endef
	.def	_SysTickPeriodSet;	.scl	2;	.type	32;	.endef
	.def	_IntMasterEnable;	.scl	2;	.type	32;	.endef
	.def	_SysTickIntEnable;	.scl	2;	.type	32;	.endef
	.def	_SysTickEnable;	.scl	2;	.type	32;	.endef
	.def	_usprintf;	.scl	2;	.type	32;	.endef
	.def	_TimerLoadGet;	.scl	2;	.type	32;	.endef
	.def	_ROM_IntMasterDisable;	.scl	2;	.type	32;	.endef
	.def	_ROM_IntMasterEnable;	.scl	2;	.type	32;	.endef
