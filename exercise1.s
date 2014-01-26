	.file	"exercise1.c"
	.text
Ltext0:
	.globl	_mytime
	.bss
	.align 4
_mytime:
	.space 4
	.globl	_prevtime
	.align 4
_prevtime:
	.space 4
	.globl	_resolution
	.data
	.align 4
_resolution:
	.long	1000
	.comm	_systick_period, 4, 2
	.comm	_sContext, 44, 5
	.text
	.globl	_ConfigureUART
	.def	_ConfigureUART;	.scl	2;	.type	32;	.endef
_ConfigureUART:
LFB6:
	.file 1 "exercise1.c"
	.loc 1 91 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 95 0
	movl	$-268433408, (%esp)
	call	_ROM_SysCtlPeripheralEnable
	.loc 1 100 0
	movl	$-268429312, (%esp)
	call	_ROM_SysCtlPeripheralEnable
	.loc 1 105 0
	movl	$1, (%esp)
	call	_ROM_GPIOPinConfigure
	.loc 1 106 0
	movl	$1025, (%esp)
	call	_ROM_GPIOPinConfigure
	.loc 1 107 0
	movl	$3, 4(%esp)
	movl	$1073758208, (%esp)
	call	_ROM_GPIOPinTypeUART
	.loc 1 112 0
	movl	$5, 4(%esp)
	movl	$1073790976, (%esp)
	call	_UARTClockSourceSet
	.loc 1 117 0
	movl	$16000000, 8(%esp)
	movl	$115200, 4(%esp)
	movl	$0, (%esp)
	call	_UARTStdioConfig
	.loc 1 118 0
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
	.loc 1 126 0
	.cfi_startproc
	pushl	%ebtp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	.loc 1 127 0
	movl	_mytime, %eax
	addl	$1, %eax
	movl	%eax, _mytime
	.loc 1 128 0
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
	.loc 1 136 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 138 0
	movl	_mytime, %eax
	leal	1(%eax), %edx
	movl	_systick_period, %eax
	imull	%edx, %eax
	movl	%eax, -12(%ebp)
	.loc 1 139 0
	call	_SysTickValueGet
	subl	%eax, -12(%ebp)
	.loc 1 141 0
	movl	-12(%ebp), %eax
	.loc 1 142 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE8:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "exercise1, world!\12\0"
LC1:
	.ascii "exercise1\0"
LC2:
	.ascii "Helliaqwuerting0r\0"
LC3:
	.ascii "%d\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB9:
	.loc 1 150 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	andl	$-16, %esp
	subl	$80, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	.loc 1 150 0
	call	___main
	.loc 1 157 0
	call	_ROM_FPULazyStackingEnable
	.loc 1 162 0
	movl	$29361472, (%esp)
	call	_ROM_SysCtlClockSet
	.loc 1 168 0
	call	_ConfigureUART
	.loc 1 170 0
	movl	$LC0, (%esp)
	call	_UARTprintf
	.loc 1 175 0
	call	_CFAL96x64x16Init
	.loc 1 180 0
	movl	$_g_sCFAL96x64x16, 4(%esp)
	movl	$_sContext, (%esp)
	call	_GrContextInit
	.loc 1 185 0
	movw	$0, 40(%esp)
	.loc 1 186 0
	movw	$0, 42(%esp)
	.loc 1 187 0
	movl	_sContext+4, %eax
	movzwl	8(%eax), %eax
	subl	$1, %eax
	movw	%ax, 44(%esp)
	.loc 1 188 0
	movw	$23, 46(%esp)
LBB2:
	.loc 1 189 0
	movl	$_sContext, 76(%esp)
	movl	76(%esp), %eax
	movl	4(%eax), %eax
	movl	32(%eax), %eax
	movl	76(%esp), %edx
	movl	4(%edx), %edx
	movl	4(%edx), %edx
	movl	$139, 4(%esp)
	movl	%edx, (%esp)
	call	*%eax
	movl	76(%esp), %edx
	movl	%eax, 16(%edx)
LBE2:
	.loc 1 190 0
	leal	40(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$_sContext, (%esp)
	call	_GrRectFill
LBB3:
	.loc 1 195 0
	movl	$_sContext, 72(%esp)
	movl	72(%esp), %eax
	movl	4(%eax), %eax
	movl	32(%eax), %eax
	movl	72(%esp), %edx
	movl	4(%edx), %edx
	movl	4(%edx), %edx
	movl	$16777215, 4(%esp)
	movl	%edx, (%esp)
	call	*%eax
	movl	72(%esp), %edx
	movl	%eax, 16(%edx)
LBE3:
	.loc 1 196 0
	leal	40(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$_sContext, (%esp)
	call	_GrRectDraw
	.loc 1 201 0
	movl	$_g_sFontCm12, 4(%esp)
	movl	$_sContext, (%esp)
	call	_GrContextFontSet
LBB4:
	.loc 1 202 0
	movl	$_sContext, 68(%esp)
	movl	$LC1, 64(%esp)
	movl	68(%esp), %eax
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
	movl	64(%esp), %eax
	movl	%eax, 4(%esp)
	movl	68(%esp), %eax
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
	movl	64(%esp), %eax
	movl	%eax, 4(%esp)
	movl	68(%esp), %eax
	movl	%eax, (%esp)
	call	_GrStringDraw
LBE4:
LBB5:
	.loc 1 217 0
	movl	$_sContext, 60(%esp)
LBB6:
	movl	60(%esp), %eax
	movl	4(%eax), %eax
	movl	%eax, 56(%esp)
	movl	56(%esp), %eax
	movl	36(%eax), %eax
	movl	56(%esp), %edx
	movl	4(%edx), %edx
	movl	%edx, (%esp)
	call	*%eax
LBE6:
LBE5:
	.loc 1 224 0
	movl	$0, _mytime
	.loc 1 228 0
	movl	$_SysTickIntHandler, (%esp)
	call	_SysTickIntRegister
	.loc 1 233 0
	call	_SysCtlClockGet
	movl	_resolution, %ecx
	movl	$0, %edx
	divl	%ecx
	movl	%eax, _systick_period
	.loc 1 234 0
	movl	_systick_period, %eax
	movl	%eax, (%esp)
	call	_SysTickPeriodSet
	.loc 1 239 0
	call	_IntMasterEnable
	.loc 1 244 0
	call	_SysTickIntEnable
	.loc 1 249 0
	call	_SysTickEnable
	.loc 1 265 0
	call	_GetSysTime
	movl	%eax, 52(%esp)
	.loc 1 266 0
	movl	$LC2, (%esp)
	call	_UARTprintf
	.loc 1 267 0
	call	_GetSysTime
	movl	%eax, 48(%esp)
	.loc 1 271 0
	movl	52(%esp), %eax
	movl	48(%esp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 8(%esp)
	movl	$LC3, 4(%esp)
	leal	36(%esp), %eax
	movl	%eax, (%esp)
	call	_usprintf
	.loc 1 272 0
	call	_ROM_IntMasterDisable
	.loc 1 273 0
	movl	$1, 20(%esp)
	movl	$46, 16(%esp)
	movl	$48, 12(%esp)
	movl	$-1, 8(%esp)
	leal	36(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$_sContext, (%esp)
	call	_GrStringDraw
	.loc 1 275 0
	call	_ROM_IntMasterEnable
L6:
	.loc 1 287 0 discriminator 1
	jmp	L6
	.cfi_endproc
LFE9:
Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "../../../../grlib/grlib.h"
	.file 4 "/usr/include/sys/types.h"
	.file 5 "../drivers/cfal96x64x16.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0x9af
	.word	0x4
	.secrel32	Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii "GNU C 4.8.2 -mtune=generic -march=i686 -g\0"
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
	.long	0xae
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.ascii "short int\0"
	.uleb128 0x3
	.ascii "int32_t\0"
	.byte	0x2
	.byte	0x16
	.long	0xca
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
	.long	0xf1
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x3
	.ascii "uint16_t\0"
	.byte	0x2
	.byte	0x1f
	.long	0x112
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.ascii "short unsigned int\0"
	.uleb128 0x3
	.ascii "uint32_t\0"
	.byte	0x2
	.byte	0x22
	.long	0x138
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
	.long	0x1ab
	.uleb128 0x5
	.ascii "i16XMin\0"
	.byte	0x3
	.byte	0x3b
	.long	0x9f
	.byte	0
	.uleb128 0x5
	.ascii "i16YMin\0"
	.byte	0x3
	.byte	0x40
	.long	0x9f
	.byte	0x2
	.uleb128 0x5
	.ascii "i16XMax\0"
	.byte	0x3
	.byte	0x45
	.long	0x9f
	.byte	0x4
	.uleb128 0x5
	.ascii "i16YMax\0"
	.byte	0x3
	.byte	0x4a
	.long	0x9f
	.byte	0x6
	.byte	0
	.uleb128 0x3
	.ascii "tRectangle\0"
	.byte	0x3
	.byte	0x4c
	.long	0x162
	.uleb128 0x4
	.byte	0x28
	.byte	0x3
	.byte	0x53
	.long	0x2ac
	.uleb128 0x5
	.ascii "i32Size\0"
	.byte	0x3
	.byte	0x58
	.long	0xbb
	.byte	0
	.uleb128 0x5
	.ascii "pvDisplayData\0"
	.byte	0x3
	.byte	0x5d
	.long	0x2ac
	.byte	0x4
	.uleb128 0x5
	.ascii "ui16Width\0"
	.byte	0x3
	.byte	0x62
	.long	0x102
	.byte	0x8
	.uleb128 0x5
	.ascii "ui16Height\0"
	.byte	0x3
	.byte	0x67
	.long	0x102
	.byte	0xa
	.uleb128 0x5
	.ascii "pfnPixelDraw\0"
	.byte	0x3
	.byte	0x6c
	.long	0x2c8
	.byte	0xc
	.uleb128 0x5
	.ascii "pfnPixelDrawMultiple\0"
	.byte	0x3
	.byte	0x75
	.long	0x307
	.byte	0x10
	.uleb128 0x5
	.ascii "pfnLineDrawH\0"
	.byte	0x3
	.byte	0x7e
	.long	0x32c
	.byte	0x14
	.uleb128 0x5
	.ascii "pfnLineDrawV\0"
	.byte	0x3
	.byte	0x84
	.long	0x32c
	.byte	0x18
	.uleb128 0x5
	.ascii "pfnRectFill\0"
	.byte	0x3
	.byte	0x8a
	.long	0x352
	.byte	0x1c
	.uleb128 0x5
	.ascii "pfnColorTranslate\0"
	.byte	0x3
	.byte	0x91
	.long	0x36c
	.byte	0x20
	.uleb128 0x5
	.ascii "pfnFlush\0"
	.byte	0x3
	.byte	0x97
	.long	0x37d
	.byte	0x24
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.uleb128 0x7
	.long	0x2c8
	.uleb128 0x8
	.long	0x2ac
	.uleb128 0x8
	.long	0xbb
	.uleb128 0x8
	.long	0xbb
	.uleb128 0x8
	.long	0x128
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x2ae
	.uleb128 0x7
	.long	0x2fc
	.uleb128 0x8
	.long	0x2ac
	.uleb128 0x8
	.long	0xbb
	.uleb128 0x8
	.long	0xbb
	.uleb128 0x8
	.long	0xbb
	.uleb128 0x8
	.long	0xbb
	.uleb128 0x8
	.long	0xbb
	.uleb128 0x8
	.long	0x2fc
	.uleb128 0x8
	.long	0x2fc
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x302
	.uleb128 0xa
	.long	0xe2
	.uleb128 0x9
	.byte	0x4
	.long	0x2ce
	.uleb128 0x7
	.long	0x32c
	.uleb128 0x8
	.long	0x2ac
	.uleb128 0x8
	.long	0xbb
	.uleb128 0x8
	.long	0xbb
	.uleb128 0x8
	.long	0xbb
	.uleb128 0x8
	.long	0x128
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x30d
	.uleb128 0x7
	.long	0x347
	.uleb128 0x8
	.long	0x2ac
	.uleb128 0x8
	.long	0x347
	.uleb128 0x8
	.long	0x128
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x34d
	.uleb128 0xa
	.long	0x1ab
	.uleb128 0x9
	.byte	0x4
	.long	0x332
	.uleb128 0xb
	.long	0x128
	.long	0x36c
	.uleb128 0x8
	.long	0x2ac
	.uleb128 0x8
	.long	0x128
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x358
	.uleb128 0x7
	.long	0x37d
	.uleb128 0x8
	.long	0x2ac
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x372
	.uleb128 0x3
	.ascii "tDisplay\0"
	.byte	0x3
	.byte	0x99
	.long	0x1bd
	.uleb128 0x4
	.byte	0xc8
	.byte	0x3
	.byte	0xae
	.long	0x40d
	.uleb128 0x5
	.ascii "ui8Format\0"
	.byte	0x3
	.byte	0xb4
	.long	0xe2
	.byte	0
	.uleb128 0x5
	.ascii "ui8MaxWidth\0"
	.byte	0x3
	.byte	0xbb
	.long	0xe2
	.byte	0x1
	.uleb128 0x5
	.ascii "ui8Height\0"
	.byte	0x3
	.byte	0xc1
	.long	0xe2
	.byte	0x2
	.uleb128 0x5
	.ascii "ui8Baseline\0"
	.byte	0x3
	.byte	0xc8
	.long	0xe2
	.byte	0x3
	.uleb128 0x5
	.ascii "pui16Offset\0"
	.byte	0x3
	.byte	0xcd
	.long	0x40d
	.byte	0x4
	.uleb128 0x5
	.ascii "pui8Data\0"
	.byte	0x3
	.byte	0xd2
	.long	0x2fc
	.byte	0xc4
	.byte	0
	.uleb128 0xc
	.long	0x102
	.long	0x41d
	.uleb128 0xd
	.long	0x41d
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
	.long	0x393
	.uleb128 0x9
	.byte	0x4
	.long	0x128
	.uleb128 0xe
	.byte	0x8
	.byte	0x3
	.word	0x2e2
	.long	0x48d
	.uleb128 0xf
	.ascii "ui16SrcCodepage\0"
	.byte	0x3
	.word	0x2e7
	.long	0x102
	.byte	0
	.uleb128 0xf
	.ascii "ui16FontCodepage\0"
	.byte	0x3
	.word	0x2ec
	.long	0x102
	.byte	0x2
	.uleb128 0xf
	.ascii "pfnMapChar\0"
	.byte	0x3
	.word	0x2f2
	.long	0x4b9
	.byte	0x4
	.byte	0
	.uleb128 0xb
	.long	0x128
	.long	0x4a6
	.uleb128 0x8
	.long	0x4a6
	.uleb128 0x8
	.long	0x128
	.uleb128 0x8
	.long	0x436
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x4ac
	.uleb128 0xa
	.long	0x4b1
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.uleb128 0x9
	.byte	0x4
	.long	0x48d
	.uleb128 0x10
	.ascii "tCodePointMap\0"
	.byte	0x3
	.word	0x2f5
	.long	0x43c
	.uleb128 0x9
	.byte	0x4
	.long	0x4db
	.uleb128 0x7
	.long	0x4ff
	.uleb128 0x8
	.long	0x4ff
	.uleb128 0x8
	.long	0x4a6
	.uleb128 0x8
	.long	0xbb
	.uleb128 0x8
	.long	0xbb
	.uleb128 0x8
	.long	0xbb
	.uleb128 0x8
	.long	0x62f
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x505
	.uleb128 0xa
	.long	0x50a
	.uleb128 0x11
	.ascii "_tContext\0"
	.byte	0x2c
	.byte	0x3
	.word	0x33f
	.long	0x62f
	.uleb128 0xf
	.ascii "i32Size\0"
	.byte	0x3
	.word	0x345
	.long	0xbb
	.byte	0
	.uleb128 0xf
	.ascii "psDisplay\0"
	.byte	0x3
	.word	0x34a
	.long	0x638
	.byte	0x4
	.uleb128 0xf
	.ascii "sClipRegion\0"
	.byte	0x3
	.word	0x34f
	.long	0x1ab
	.byte	0x8
	.uleb128 0xf
	.ascii "ui32Foreground\0"
	.byte	0x3
	.word	0x354
	.long	0x128
	.byte	0x10
	.uleb128 0xf
	.ascii "ui32Background\0"
	.byte	0x3
	.word	0x359
	.long	0x128
	.byte	0x14
	.uleb128 0xf
	.ascii "psFont\0"
	.byte	0x3
	.word	0x35e
	.long	0x643
	.byte	0x18
	.uleb128 0xf
	.ascii "pfnStringRenderer\0"
	.byte	0x3
	.word	0x366
	.long	0x4d5
	.byte	0x1c
	.uleb128 0xf
	.ascii "pCodePointMapTable\0"
	.byte	0x3
	.word	0x36d
	.long	0x64e
	.byte	0x20
	.uleb128 0xf
	.ascii "ui16Codepage\0"
	.byte	0x3
	.word	0x372
	.long	0x102
	.byte	0x24
	.uleb128 0xf
	.ascii "ui8NumCodePointMaps\0"
	.byte	0x3
	.word	0x377
	.long	0xe2
	.byte	0x26
	.uleb128 0xf
	.ascii "ui8CodePointMap\0"
	.byte	0x3
	.word	0x37d
	.long	0xe2
	.byte	0x27
	.uleb128 0xf
	.ascii "ui8Reserved\0"
	.byte	0x3
	.word	0x382
	.long	0xe2
	.byte	0x28
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.ascii "_Bool\0"
	.uleb128 0x9
	.byte	0x4
	.long	0x63e
	.uleb128 0xa
	.long	0x383
	.uleb128 0x9
	.byte	0x4
	.long	0x649
	.uleb128 0xa
	.long	0x429
	.uleb128 0x9
	.byte	0x4
	.long	0x654
	.uleb128 0xa
	.long	0x4bf
	.uleb128 0x10
	.ascii "tContext\0"
	.byte	0x3
	.word	0x385
	.long	0x50a
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
	.long	0x138
	.uleb128 0x12
	.ascii "ConfigureUART\0"
	.byte	0x1
	.byte	0x5a
	.long	LFB6
	.long	LFE6-LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x71e
	.uleb128 0x13
	.ascii "ROM_SysCtlPeripheralEnable\0"
	.byte	0x1
	.byte	0x5f
	.long	0xca
	.long	0x6de
	.uleb128 0x14
	.byte	0
	.uleb128 0x13
	.ascii "ROM_GPIOPinConfigure\0"
	.byte	0x1
	.byte	0x69
	.long	0xca
	.long	0x700
	.uleb128 0x14
	.byte	0
	.uleb128 0x15
	.ascii "ROM_GPIOPinTypeUART\0"
	.byte	0x1
	.byte	0x6b
	.long	0xca
	.uleb128 0x14
	.byte	0
	.byte	0
	.uleb128 0x16
	.ascii "SysTickIntHandler\0"
	.byte	0x1
	.byte	0x7d
	.long	LFB7
	.long	LFE7-LFB7
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x17
	.ascii "GetSysTime\0"
	.byte	0x1
	.byte	0x88
	.long	0x68b
	.long	LFB8
	.long	LFE8-LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x76d
	.uleb128 0x18
	.ascii "tick\0"
	.byte	0x1
	.byte	0x8a
	.long	0x68b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x19
	.ascii "main\0"
	.byte	0x1
	.byte	0x95
	.long	0xca
	.long	LFB9
	.long	LFE9-LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x8ed
	.uleb128 0x18
	.ascii "sRect\0"
	.byte	0x1
	.byte	0x97
	.long	0x1ab
	.uleb128 0x2
	.byte	0x74
	.sleb128 40
	.uleb128 0x13
	.ascii "ROM_FPULazyStackingEnable\0"
	.byte	0x1
	.byte	0x9d
	.long	0xca
	.long	0x7be
	.uleb128 0x14
	.byte	0
	.uleb128 0x13
	.ascii "ROM_SysCtlClockSet\0"
	.byte	0x1
	.byte	0xa2
	.long	0xca
	.long	0x7de
	.uleb128 0x14
	.byte	0
	.uleb128 0x18
	.ascii "str\0"
	.byte	0x1
	.byte	0xfa
	.long	0x8ed
	.uleb128 0x2
	.byte	0x74
	.sleb128 36
	.uleb128 0x1a
	.ascii "starttime\0"
	.byte	0x1
	.word	0x109
	.long	0x68b
	.uleb128 0x2
	.byte	0x74
	.sleb128 52
	.uleb128 0x1a
	.ascii "endtime\0"
	.byte	0x1
	.word	0x10b
	.long	0x68b
	.uleb128 0x2
	.byte	0x74
	.sleb128 48
	.uleb128 0x1b
	.ascii "ROM_IntMasterDisable\0"
	.byte	0x1
	.word	0x110
	.long	0xca
	.long	0x837
	.uleb128 0x14
	.byte	0
	.uleb128 0x1b
	.ascii "ROM_IntMasterEnable\0"
	.byte	0x1
	.word	0x113
	.long	0xca
	.long	0x859
	.uleb128 0x14
	.byte	0
	.uleb128 0x1c
	.long	LBB2
	.long	LBE2-LBB2
	.long	0x875
	.uleb128 0x18
	.ascii "pC\0"
	.byte	0x1
	.byte	0xbd
	.long	0x8fd
	.uleb128 0x3
	.byte	0x74
	.sleb128 76
	.byte	0
	.uleb128 0x1c
	.long	LBB3
	.long	LBE3-LBB3
	.long	0x891
	.uleb128 0x18
	.ascii "pC\0"
	.byte	0x1
	.byte	0xc3
	.long	0x8fd
	.uleb128 0x3
	.byte	0x74
	.sleb128 72
	.byte	0
	.uleb128 0x1c
	.long	LBB4
	.long	LBE4-LBB4
	.long	0x8be
	.uleb128 0x18
	.ascii "pC\0"
	.byte	0x1
	.byte	0xca
	.long	0x903
	.uleb128 0x3
	.byte	0x74
	.sleb128 68
	.uleb128 0x18
	.ascii "pcStr\0"
	.byte	0x1
	.byte	0xca
	.long	0x4a6
	.uleb128 0x3
	.byte	0x74
	.sleb128 64
	.byte	0
	.uleb128 0x1d
	.long	LBB5
	.long	LBE5-LBB5
	.uleb128 0x18
	.ascii "pC\0"
	.byte	0x1
	.byte	0xd9
	.long	0x903
	.uleb128 0x2
	.byte	0x74
	.sleb128 60
	.uleb128 0x1d
	.long	LBB6
	.long	LBE6-LBB6
	.uleb128 0x18
	.ascii "pD\0"
	.byte	0x1
	.byte	0xd9
	.long	0x638
	.uleb128 0x2
	.byte	0x74
	.sleb128 56
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x4b1
	.long	0x8fd
	.uleb128 0xd
	.long	0x41d
	.byte	0x3
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x659
	.uleb128 0x9
	.byte	0x4
	.long	0x909
	.uleb128 0xa
	.long	0x659
	.uleb128 0x1e
	.ascii "g_sFontCm12\0"
	.byte	0x3
	.word	0x5db
	.long	0x649
	.uleb128 0x1f
	.ascii "g_sCFAL96x64x16\0"
	.byte	0x5
	.byte	0x23
	.long	0x63e
	.uleb128 0x20
	.ascii "mytime\0"
	.byte	0x1
	.byte	0x4f
	.long	0x94d
	.uleb128 0x5
	.byte	0x3
	.long	_mytime
	.uleb128 0x21
	.long	0x128
	.uleb128 0x20
	.ascii "prevtime\0"
	.byte	0x1
	.byte	0x50
	.long	0x94d
	.uleb128 0x5
	.byte	0x3
	.long	_prevtime
	.uleb128 0x20
	.ascii "resolution\0"
	.byte	0x1
	.byte	0x51
	.long	0x68b
	.uleb128 0x5
	.byte	0x3
	.long	_resolution
	.uleb128 0x20
	.ascii "systick_period\0"
	.byte	0x1
	.byte	0x52
	.long	0x128
	.uleb128 0x5
	.byte	0x3
	.long	_systick_period
	.uleb128 0x20
	.ascii "sContext\0"
	.byte	0x1
	.byte	0x53
	.long	0x659
	.uleb128 0x5
	.byte	0x3
	.long	_sContext
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
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
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
	.ident	"GCC: (GNU) 4.8.2"
	.def	_ROM_SysCtlPeripheralEnable;	.scl	2;	.type	32;	.endef
	.def	_ROM_GPIOPinConfigure;	.scl	2;	.type	32;	.endef
	.def	_ROM_GPIOPinTypeUART;	.scl	2;	.type	32;	.endef
	.def	_UARTClockSourceSet;	.scl	2;	.type	32;	.endef
	.def	_UARTStdioConfig;	.scl	2;	.type	32;	.endef
	.def	_SysTickValueGet;	.scl	2;	.type	32;	.endef
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
	.def	_SysTickIntRegister;	.scl	2;	.type	32;	.endef
	.def	_SysCtlClockGet;	.scl	2;	.type	32;	.endef
	.def	_SysTickPeriodSet;	.scl	2;	.type	32;	.endef
	.def	_IntMasterEnable;	.scl	2;	.type	32;	.endef
	.def	_SysTickIntEnable;	.scl	2;	.type	32;	.endef
	.def	_SysTickEnable;	.scl	2;	.type	32;	.endef
	.def	_usprintf;	.scl	2;	.type	32;	.endef
	.def	_ROM_IntMasterDisable;	.scl	2;	.type	32;	.endef
	.def	_ROM_IntMasterEnable;	.scl	2;	.type	32;	.endef
