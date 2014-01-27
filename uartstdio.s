	.file	"uartstdio.c"
	.text
Ltext0:
.lcomm _g_ui32Base,4,4
	.section .rdata,"dr"
LC0:
	.ascii "0123456789abcdef\0"
	.align 4
_g_pcHex:
	.long	LC0
	.align 4
_g_ui32UARTBase:
	.long	1073790976
	.long	1073795072
	.long	1073799168
	.align 4
_g_ui32UARTPeriph:
	.long	-268429312
	.long	-268429311
	.long	-268429310
	.text
	.globl	_UARTStdioConfig
	.def	_UARTStdioConfig;	.scl	2;	.type	32;	.endef
_UARTStdioConfig:
LFB0:
	.file 1 "../../../../utils/uartstdio.c"
	.loc 1 335 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 352 0
	movl	8(%ebp), %eax
	movl	_g_ui32UARTPeriph(,%eax,4), %eax
	movl	%eax, (%esp)
	call	_SysCtlPeripheralPresent
	xorl	$1, %eax
	testb	%al, %al
	je	L2
	.loc 1 354 0
	jmp	L1
L2:
	.loc 1 360 0
	movl	8(%ebp), %eax
	movl	_g_ui32UARTBase(,%eax,4), %eax
	movl	%eax, _g_ui32Base
	.loc 1 365 0
	movl	8(%ebp), %eax
	movl	_g_ui32UARTPeriph(,%eax,4), %eax
	movl	%eax, (%esp)
	call	_SysCtlPeripheralEnable
	.loc 1 370 0
	movl	_g_ui32Base, %eax
	movl	$96, 12(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	16(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_UARTConfigSetExpClk
	.loc 1 406 0
	movl	_g_ui32Base, %eax
	movl	%eax, (%esp)
	call	_UARTEnable
L1:
	.loc 1 407 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE0:
	.globl	_UARTwrite
	.def	_UARTwrite;	.scl	2;	.type	32;	.endef
_UARTwrite:
LFB1:
	.loc 1 437 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 515 0
	movl	$0, -12(%ebp)
	jmp	L5
L7:
	.loc 1 521 0
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$10, %al
	jne	L6
	.loc 1 523 0
	movl	_g_ui32Base, %eax
	movl	$13, 4(%esp)
	movl	%eax, (%esp)
	call	_UARTCharPut
L6:
	.loc 1 529 0
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movl	_g_ui32Base, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_UARTCharPut
	.loc 1 515 0
	addl	$1, -12(%ebp)
L5:
	.loc 1 515 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jb	L7
	.loc 1 535 0 is_stmt 1
	movl	-12(%ebp), %eax
	.loc 1 537 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE1:
	.section .rdata,"dr"
LC1:
	.ascii "\10 \10\0"
LC2:
	.ascii "\15\12\0"
	.text
	.globl	_UARTgets
	.def	_UARTgets;	.scl	2;	.type	32;	.endef
_UARTgets:
LFB2:
	.loc 1 570 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 643 0
	movl	$0, -12(%ebp)
	.loc 1 658 0
	subl	$1, 12(%ebp)
L18:
	.loc 1 668 0
	movl	_g_ui32Base, %eax
	movl	%eax, (%esp)
	call	_UARTCharGet
	movb	%al, -13(%ebp)
	.loc 1 673 0
	cmpb	$8, -13(%ebp)
	jne	L10
	.loc 1 679 0
	cmpl	$0, -12(%ebp)
	je	L11
	.loc 1 684 0
	movl	$3, 4(%esp)
	movl	$LC1, (%esp)
	call	_UARTwrite
	.loc 1 689 0
	subl	$1, -12(%ebp)
	.loc 1 695 0
	jmp	L12
L11:
	jmp	L12
L10:
	.loc 1 702 0
	cmpb	$10, -13(%ebp)
	jne	L13
	.loc 1 702 0 is_stmt 0 discriminator 1
	movzbl	_bLastWasCR.1733, %eax
	testb	%al, %al
	je	L13
	.loc 1 704 0 is_stmt 1
	movb	$0, _bLastWasCR.1733
	.loc 1 705 0
	jmp	L12
L13:
	.loc 1 711 0
	cmpb	$13, -13(%ebp)
	je	L14
	.loc 1 711 0 is_stmt 0 discriminator 1
	cmpb	$10, -13(%ebp)
	je	L14
	cmpb	$27, -13(%ebp)
	jne	L15
L14:
	.loc 1 718 0 is_stmt 1
	cmpb	$13, -13(%ebp)
	jne	L16
	.loc 1 720 0
	movb	$1, _bLastWasCR.1733
	.loc 1 726 0
	jmp	L17
L16:
	jmp	L17
L15:
	.loc 1 734 0
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jae	L12
	.loc 1 739 0
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	addl	%eax, %edx
	movzbl	-13(%ebp), %eax
	movb	%al, (%edx)
	.loc 1 744 0
	addl	$1, -12(%ebp)
	.loc 1 749 0
	movzbl	-13(%ebp), %eax
	movzbl	%al, %edx
	movl	_g_ui32Base, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_UARTCharPut
	.loc 1 751 0
	jmp	L18
L12:
	jmp	L18
L17:
	.loc 1 756 0
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	addl	%edx, %eax
	movb	$0, (%eax)
	.loc 1 761 0
	movl	$2, 4(%esp)
	movl	$LC2, (%esp)
	call	_UARTwrite
	.loc 1 766 0
	movl	-12(%ebp), %eax
	.loc 1 768 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE2:
	.globl	_UARTgetc
	.def	_UARTgetc;	.scl	2;	.type	32;	.endef
_UARTgetc:
LFB3:
	.loc 1 787 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 817 0
	movl	_g_ui32Base, %eax
	movl	%eax, (%esp)
	call	_UARTCharGet
	.loc 1 819 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE3:
	.section .rdata,"dr"
LC3:
	.ascii " \0"
LC4:
	.ascii "ERROR\0"
	.text
	.globl	_UARTvprintf
	.def	_UARTvprintf;	.scl	2;	.type	32;	.endef
_UARTvprintf:
LFB4:
	.loc 1 861 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$68, %esp
	.cfi_offset 3, -12
	.loc 1 873 0
	jmp	L23
L57:
	.loc 1 878 0
	movl	$0, -12(%ebp)
	jmp	L24
L26:
	.loc 1 880 0
	addl	$1, -12(%ebp)
L24:
	.loc 1 879 0 discriminator 1
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	addl	%edx, %eax
	movzbl	(%eax), %eax
	.loc 1 878 0 discriminator 1
	cmpb	$37, %al
	je	L25
	.loc 1 879 0
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	addl	%edx, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	L26
L25:
	.loc 1 887 0
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_UARTwrite
	.loc 1 892 0
	movl	-12(%ebp), %eax
	addl	%eax, 8(%ebp)
	.loc 1 897 0
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$37, %al
	jne	L23
	.loc 1 902 0
	addl	$1, 8(%ebp)
	.loc 1 908 0
	movl	$0, -20(%ebp)
	.loc 1 909 0
	movb	$32, -29(%ebp)
L27:
	.loc 1 921 0
	movl	8(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, 8(%ebp)
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$37, %eax
	cmpl	$83, %eax
	ja	L28
	movl	L30(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L30:
	.long	L29
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L31
	.long	L31
	.long	L31
	.long	L31
	.long	L31
	.long	L31
	.long	L31
	.long	L31
	.long	L31
	.long	L31
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L32
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L33
	.long	L34
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L34
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L28
	.long	L32
	.long	L28
	.long	L28
	.long	L35
	.long	L28
	.long	L36
	.long	L28
	.long	L28
	.long	L32
	.text
L31:
	.loc 1 941 0
	movl	8(%ebp), %eax
	subl	$1, %eax
	movzbl	(%eax), %eax
	cmpb	$48, %al
	jne	L37
	.loc 1 941 0 is_stmt 0 discriminator 1
	cmpl	$0, -20(%ebp)
	jne	L37
	.loc 1 943 0 is_stmt 1
	movb	$48, -29(%ebp)
L37:
	.loc 1 949 0
	movl	-20(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, -20(%ebp)
	.loc 1 950 0
	movl	8(%ebp), %eax
	subl	$1, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	subl	$48, %eax
	movl	%eax, -20(%ebp)
	.loc 1 955 0
	jmp	L27
L33:
	.loc 1 966 0
	movl	12(%ebp), %eax
	leal	4(%eax), %edx
	movl	%edx, 12(%ebp)
	movl	(%eax), %eax
	movl	%eax, -40(%ebp)
	.loc 1 971 0
	movl	$1, 4(%esp)
	leal	-40(%ebp), %eax
	movl	%eax, (%esp)
	call	_UARTwrite
	.loc 1 976 0
	jmp	L23
L34:
	.loc 1 988 0
	movl	12(%ebp), %eax
	leal	4(%eax), %edx
	movl	%edx, 12(%ebp)
	movl	(%eax), %eax
	movl	%eax, -40(%ebp)
	.loc 1 993 0
	movl	$0, -16(%ebp)
	.loc 1 999 0
	movl	-40(%ebp), %eax
	testl	%eax, %eax
	jns	L38
	.loc 1 1004 0
	movl	-40(%ebp), %eax
	negl	%eax
	movl	%eax, -40(%ebp)
	.loc 1 1009 0
	movl	$1, -28(%ebp)
	jmp	L39
L38:
	.loc 1 1017 0
	movl	$0, -28(%ebp)
L39:
	.loc 1 1023 0
	movl	$10, -24(%ebp)
	.loc 1 1028 0
	jmp	L40
L35:
	.loc 1 1039 0
	movl	12(%ebp), %eax
	leal	4(%eax), %edx
	movl	%edx, 12(%ebp)
	movl	(%eax), %eax
	movl	%eax, -36(%ebp)
	.loc 1 1044 0
	movl	$0, -12(%ebp)
	jmp	L41
L42:
	.loc 1 1044 0 is_stmt 0 discriminator 2
	addl	$1, -12(%ebp)
L41:
	.loc 1 1044 0 discriminator 1
	movl	-12(%ebp), %eax
	movl	-36(%ebp), %edx
	addl	%edx, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	L42
	.loc 1 1051 0 is_stmt 1
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-36(%ebp), %eax
	movl	%eax, (%esp)
	call	_UARTwrite
	.loc 1 1056 0
	movl	-20(%ebp), %eax
	cmpl	-12(%ebp), %eax
	jbe	L43
	.loc 1 1058 0
	movl	-12(%ebp), %eax
	subl	%eax, -20(%ebp)
	.loc 1 1059 0
	jmp	L44
L45:
	.loc 1 1061 0
	movl	$1, 4(%esp)
	movl	$LC3, (%esp)
	call	_UARTwrite
L44:
	.loc 1 1059 0 discriminator 1
	movl	-20(%ebp), %eax
	leal	-1(%eax), %edx
	movl	%edx, -20(%ebp)
	testl	%eax, %eax
	jne	L45
L43:
	.loc 1 1068 0
	jmp	L23
L36:
	.loc 1 1079 0
	movl	12(%ebp), %eax
	leal	4(%eax), %edx
	movl	%edx, 12(%ebp)
	movl	(%eax), %eax
	movl	%eax, -40(%ebp)
	.loc 1 1084 0
	movl	$0, -16(%ebp)
	.loc 1 1089 0
	movl	$10, -24(%ebp)
	.loc 1 1095 0
	movl	$0, -28(%ebp)
	.loc 1 1100 0
	jmp	L40
L32:
	.loc 1 1116 0
	movl	12(%ebp), %eax
	leal	4(%eax), %edx
	movl	%edx, 12(%ebp)
	movl	(%eax), %eax
	movl	%eax, -40(%ebp)
	.loc 1 1121 0
	movl	$0, -16(%ebp)
	.loc 1 1126 0
	movl	$16, -24(%ebp)
	.loc 1 1132 0
	movl	$0, -28(%ebp)
L40:
	.loc 1 1139 0
	movl	$1, -12(%ebp)
	jmp	L46
L48:
	.loc 1 1142 0
	movl	-12(%ebp), %eax
	imull	-24(%ebp), %eax
	movl	%eax, -12(%ebp)
	subl	$1, -20(%ebp)
L46:
	.loc 1 1140 0 discriminator 1
	movl	-12(%ebp), %eax
	imull	-24(%ebp), %eax
	movl	%eax, %edx
	movl	-40(%ebp), %eax
	.loc 1 1139 0 discriminator 1
	cmpl	%eax, %edx
	ja	L47
	.loc 1 1141 0
	movl	-12(%ebp), %eax
	imull	-24(%ebp), %eax
	movl	$0, %edx
	divl	-24(%ebp)
	.loc 1 1140 0
	cmpl	-12(%ebp), %eax
	je	L48
L47:
	.loc 1 1150 0
	cmpl	$0, -28(%ebp)
	je	L49
	.loc 1 1152 0
	subl	$1, -20(%ebp)
L49:
	.loc 1 1159 0
	cmpl	$0, -28(%ebp)
	je	L50
	.loc 1 1159 0 is_stmt 0 discriminator 1
	cmpb	$48, -29(%ebp)
	jne	L50
	.loc 1 1164 0 is_stmt 1
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movb	$45, -56(%ebp,%eax)
	.loc 1 1170 0
	movl	$0, -28(%ebp)
L50:
	.loc 1 1177 0
	cmpl	$1, -20(%ebp)
	jbe	L51
	.loc 1 1177 0 is_stmt 0 discriminator 1
	cmpl	$15, -20(%ebp)
	ja	L51
	.loc 1 1179 0 is_stmt 1
	subl	$1, -20(%ebp)
	jmp	L52
L53:
	.loc 1 1181 0 discriminator 2
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movzbl	-29(%ebp), %edx
	movb	%dl, -56(%ebp,%eax)
	.loc 1 1179 0 discriminator 2
	subl	$1, -20(%ebp)
L52:
	.loc 1 1179 0 is_stmt 0 discriminator 1
	cmpl	$0, -20(%ebp)
	jne	L53
L51:
	.loc 1 1189 0 is_stmt 1
	cmpl	$0, -28(%ebp)
	je	L54
	.loc 1 1194 0
	movl	-16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -16(%ebp)
	movb	$45, -56(%ebp,%eax)
	.loc 1 1200 0
	jmp	L55
L54:
	jmp	L55
L56:
	.loc 1 1202 0 discriminator 2
	movl	-16(%ebp), %ecx
	leal	1(%ecx), %eax
	movl	%eax, -16(%ebp)
	.loc 1 1203 0 discriminator 2
	movl	$LC0, %ebx
	movl	-40(%ebp), %eax
	movl	$0, %edx
	divl	-12(%ebp)
	movl	$0, %edx
	divl	-24(%ebp)
	movl	%edx, %eax
	addl	%ebx, %eax
	movzbl	(%eax), %eax
	.loc 1 1202 0 discriminator 2
	movb	%al, -56(%ebp,%ecx)
	.loc 1 1200 0 discriminator 2
	movl	-12(%ebp), %eax
	movl	$0, %edx
	divl	-24(%ebp)
	movl	%eax, -12(%ebp)
L55:
	.loc 1 1200 0 is_stmt 0 discriminator 1
	cmpl	$0, -12(%ebp)
	jne	L56
	.loc 1 1209 0 is_stmt 1
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-56(%ebp), %eax
	movl	%eax, (%esp)
	call	_UARTwrite
	.loc 1 1214 0
	jmp	L23
L29:
	.loc 1 1225 0
	movl	8(%ebp), %eax
	subl	$1, %eax
	movl	$1, 4(%esp)
	movl	%eax, (%esp)
	call	_UARTwrite
	.loc 1 1230 0
	jmp	L23
L28:
	.loc 1 1241 0
	movl	$5, 4(%esp)
	movl	$LC4, (%esp)
	call	_UARTwrite
	.loc 1 1246 0
	nop
L23:
	.loc 1 873 0 discriminator 1
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	L57
	.loc 1 1251 0
	addl	$68, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE4:
	.globl	_UARTprintf
	.def	_UARTprintf;	.scl	2;	.type	32;	.endef
_UARTprintf:
LFB5:
	.loc 1 1293 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 1299 0
	leal	12(%ebp), %eax
	movl	%eax, -12(%ebp)
	.loc 1 1301 0
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_UARTvprintf
	.loc 1 1307 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE5:
.lcomm _bLastWasCR.1733,1,1
Letext0:
	.file 2 "/usr/include/stdint.h"
	.file 3 "/usr/lib/gcc/i686-pc-cygwin/4.8.2/include/stdarg.h"
	.section	.debug_info,"dr"
Ldebug_info0:
	.long	0x4de
	.word	0x4
	.secrel32	Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii "GNU C 4.8.2 -mtune=generic -march=i686 -g\0"
	.byte	0x1
	.ascii "../../../../utils/uartstdio.c\0"
	.ascii "/cygdrive/c/emsys/TivaC1157/examples/boards/ek-lm4f232/exercise1\0"
	.long	Ltext0
	.long	Letext0-Ltext0
	.secrel32	Ldebug_line0
	.uleb128 0x2
	.ascii "int8_t\0"
	.byte	0x2
	.byte	0x14
	.long	0xb0
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.ascii "short int\0"
	.uleb128 0x2
	.ascii "int32_t\0"
	.byte	0x2
	.byte	0x16
	.long	0xdb
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.ascii "long long int\0"
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.ascii "short unsigned int\0"
	.uleb128 0x2
	.ascii "uint32_t\0"
	.byte	0x2
	.byte	0x22
	.long	0x12a
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.ascii "unsigned int\0"
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x2
	.ascii "__gnuc_va_list\0"
	.byte	0x3
	.byte	0x28
	.long	0x16a
	.uleb128 0x4
	.byte	0x4
	.ascii "__builtin_va_list\0"
	.long	0x182
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.uleb128 0x2
	.ascii "va_list\0"
	.byte	0x3
	.byte	0x62
	.long	0x154
	.uleb128 0x5
	.ascii "UARTStdioConfig\0"
	.byte	0x1
	.word	0x14e
	.long	LFB0
	.long	LFE0-LFB0
	.uleb128 0x1
	.byte	0x9c
	.long	0x1ff
	.uleb128 0x6
	.ascii "ui32PortNum\0"
	.byte	0x1
	.word	0x14e
	.long	0x11a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x6
	.ascii "ui32Baud\0"
	.byte	0x1
	.word	0x14e
	.long	0x11a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x6
	.ascii "ui32SrcClock\0"
	.byte	0x1
	.word	0x14e
	.long	0x11a
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.byte	0
	.uleb128 0x7
	.ascii "UARTwrite\0"
	.byte	0x1
	.word	0x1b4
	.long	0xdb
	.long	LFB1
	.long	LFE1-LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x254
	.uleb128 0x6
	.ascii "pcBuf\0"
	.byte	0x1
	.word	0x1b4
	.long	0x254
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x6
	.ascii "ui32Len\0"
	.byte	0x1
	.word	0x1b4
	.long	0x11a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x8
	.ascii "uIdx\0"
	.byte	0x1
	.word	0x1f8
	.long	0x12a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x25a
	.uleb128 0xa
	.long	0x182
	.uleb128 0x7
	.ascii "UARTgets\0"
	.byte	0x1
	.word	0x239
	.long	0xdb
	.long	LFB2
	.long	LFE2-LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x2dc
	.uleb128 0x6
	.ascii "pcBuf\0"
	.byte	0x1
	.word	0x239
	.long	0x2dc
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x6
	.ascii "ui32Len\0"
	.byte	0x1
	.word	0x239
	.long	0x11a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xb
	.secrel32	LASF0
	.byte	0x1
	.word	0x283
	.long	0x11a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x8
	.ascii "cChar\0"
	.byte	0x1
	.word	0x284
	.long	0xa2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x8
	.ascii "bLastWasCR\0"
	.byte	0x1
	.word	0x285
	.long	0xa2
	.uleb128 0x5
	.byte	0x3
	.long	_bLastWasCR.1733
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x182
	.uleb128 0xc
	.ascii "UARTgetc\0"
	.byte	0x1
	.word	0x312
	.long	0xf3
	.long	LFB3
	.long	LFE3-LFB3
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.ascii "UARTvprintf\0"
	.byte	0x1
	.word	0x35c
	.long	LFB4
	.long	LFE4-LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x3ff
	.uleb128 0xd
	.secrel32	LASF1
	.byte	0x1
	.word	0x35c
	.long	0x254
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x6
	.ascii "vaArgP\0"
	.byte	0x1
	.word	0x35c
	.long	0x18a
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x8
	.ascii "ui32Idx\0"
	.byte	0x1
	.word	0x35e
	.long	0x11a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x8
	.ascii "ui32Value\0"
	.byte	0x1
	.word	0x35e
	.long	0x11a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x8
	.ascii "ui32Pos\0"
	.byte	0x1
	.word	0x35e
	.long	0x11a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xb
	.secrel32	LASF0
	.byte	0x1
	.word	0x35e
	.long	0x11a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x8
	.ascii "ui32Base\0"
	.byte	0x1
	.word	0x35e
	.long	0x11a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x8
	.ascii "ui32Neg\0"
	.byte	0x1
	.word	0x35e
	.long	0x11a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x8
	.ascii "pcStr\0"
	.byte	0x1
	.word	0x35f
	.long	0x2dc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x8
	.ascii "pcBuf\0"
	.byte	0x1
	.word	0x35f
	.long	0x3ff
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x8
	.ascii "cFill\0"
	.byte	0x1
	.word	0x35f
	.long	0x182
	.uleb128 0x2
	.byte	0x91
	.sleb128 -37
	.uleb128 0xe
	.ascii "again\0"
	.byte	0x1
	.word	0x394
	.long	L27
	.uleb128 0xe
	.ascii "convert\0"
	.byte	0x1
	.word	0x472
	.long	L40
	.byte	0
	.uleb128 0xf
	.long	0x182
	.long	0x40f
	.uleb128 0x10
	.long	0x40f
	.byte	0xf
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.ascii "sizetype\0"
	.uleb128 0x5
	.ascii "UARTprintf\0"
	.byte	0x1
	.word	0x50c
	.long	LFB5
	.long	LFE5-LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x45b
	.uleb128 0xd
	.secrel32	LASF1
	.byte	0x1
	.word	0x50c
	.long	0x254
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.uleb128 0x8
	.ascii "vaArgP\0"
	.byte	0x1
	.word	0x50e
	.long	0x18a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x12
	.ascii "g_ui32Base\0"
	.byte	0x1
	.byte	0x7e
	.long	0x11a
	.uleb128 0x5
	.byte	0x3
	.long	_g_ui32Base
	.uleb128 0x12
	.ascii "g_pcHex\0"
	.byte	0x1
	.byte	0x86
	.long	0x488
	.uleb128 0x5
	.byte	0x3
	.long	_g_pcHex
	.uleb128 0xa
	.long	0x254
	.uleb128 0xf
	.long	0x11a
	.long	0x49d
	.uleb128 0x10
	.long	0x40f
	.byte	0x2
	.byte	0
	.uleb128 0x12
	.ascii "g_ui32UARTBase\0"
	.byte	0x1
	.byte	0x8d
	.long	0x4b9
	.uleb128 0x5
	.byte	0x3
	.long	_g_ui32UARTBase
	.uleb128 0xa
	.long	0x48d
	.uleb128 0x12
	.ascii "g_ui32UARTPeriph\0"
	.byte	0x1
	.byte	0xaa
	.long	0x4dc
	.uleb128 0x5
	.byte	0x3
	.long	_g_ui32UARTPeriph
	.uleb128 0xa
	.long	0x48d
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
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
	.uleb128 0x5
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x5
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
	.uleb128 0xe
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.ascii "pcString\0"
LASF0:
	.ascii "ui32Count\0"
	.ident	"GCC: (GNU) 4.8.2"
	.def	_SysCtlPeripheralPresent;	.scl	2;	.type	32;	.endef
	.def	_SysCtlPeripheralEnable;	.scl	2;	.type	32;	.endef
	.def	_UARTConfigSetExpClk;	.scl	2;	.type	32;	.endef
	.def	_UARTEnable;	.scl	2;	.type	32;	.endef
	.def	_UARTCharPut;	.scl	2;	.type	32;	.endef
	.def	_UARTCharGet;	.scl	2;	.type	32;	.endef
