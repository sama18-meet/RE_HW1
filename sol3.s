	.file	"sol3.c"
	.intel_syntax noprefix
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC1:
	.ascii "%02d %02d %02d %02d %02d\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB10:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	esi
	push	ebx
	and	esp, -16
	sub	esp, 64
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	call	___main
	mov	DWORD PTR [esp+44], 0
	mov	DWORD PTR [esp+48], 0
	mov	DWORD PTR [esp+52], 0
	mov	DWORD PTR [esp+56], 0
	mov	DWORD PTR [esp+60], 0
	jmp	L2
L6:
	movzx	eax, BYTE PTR [esp+32]
	cmp	al, 114
	jne	L3
	mov	eax, DWORD PTR [esp+44]
	add	eax, 1
	mov	DWORD PTR [esp+44], eax
	mov	eax, DWORD PTR [esp+48]
	add	eax, 1
	mov	DWORD PTR [esp+48], eax
	jmp	L2
L3:
	movzx	eax, BYTE PTR [esp+32]
	cmp	al, 115
	jne	L4
	mov	eax, DWORD PTR [esp+44]
	add	eax, 1
	mov	DWORD PTR [esp+44], eax
	mov	eax, DWORD PTR [esp+48]
	add	eax, 1
	mov	DWORD PTR [esp+48], eax
	mov	eax, DWORD PTR [esp+52]
	add	eax, 1
	mov	DWORD PTR [esp+52], eax
	mov	eax, DWORD PTR [esp+56]
	add	eax, 1
	mov	DWORD PTR [esp+56], eax
	jmp	L2
L4:
	movzx	eax, BYTE PTR [esp+32]
	cmp	al, 99
	jne	L5
	mov	eax, DWORD PTR [esp+56]
	add	eax, 2
	mov	DWORD PTR [esp+56], eax
	mov	eax, DWORD PTR [esp+60]
	add	eax, 3
	mov	DWORD PTR [esp+60], eax
	jmp	L2
L5:
	movzx	eax, BYTE PTR [esp+32]
	cmp	al, 100
	jne	L2
	mov	eax, DWORD PTR [esp+52]
	add	eax, 1
	mov	DWORD PTR [esp+52], eax
	mov	eax, DWORD PTR [esp+56]
	add	eax, 1
	mov	DWORD PTR [esp+56], eax
	mov	eax, DWORD PTR [esp+60]
	add	eax, 1
	mov	DWORD PTR [esp+60], eax
L2:
	lea	eax, [esp+32]
	push 0x00005D0A # null, null, ], \n
	push 0x5E5B2520 # ^, [, %, space
	mov ecx, esp
	push eax
	push ecx
	call	_scanf
	add esp, 0x10
	cmp	eax, -1
	jne	L6
	mov	esi, DWORD PTR [esp+60]
	mov	ebx, DWORD PTR [esp+56]
	mov	ecx, DWORD PTR [esp+52]
	mov	edx, DWORD PTR [esp+48]
	mov	eax, DWORD PTR [esp+44]
	mov	DWORD PTR [esp+20], esi
	mov	DWORD PTR [esp+16], ebx
	mov	DWORD PTR [esp+12], ecx
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC1
	call	_printf
	mov	eax, 0
	lea	esp, [ebp-8]
	pop	ebx
	.cfi_restore 3
	pop	esi
	.cfi_restore 6
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
