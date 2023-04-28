	.file	"crackme.c"
	.intel_syntax noprefix
	.text
	.globl	_arg
	.bss
	.align 4
_arg:
	.space 4
	.comm	_mark, 64, 5
	.section .rdata,"dr"
LC0:
	.ascii "Error #%d: %s\12\0"
	.text
	.globl	_check_error
	.def	_check_error;	.scl	2;	.type	32;	.endef

_sqlite3_errmsg:
_sqlite3_open:
_sqlite3_exec:
_sqlite3_close:	

_check_error:
	push	ebp
	mov	ebp, esp
	sub	esp, 16
	cmp	DWORD PTR [ebp+8], 0
	je	L3
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [esp], eax
	call	_sqlite3_errmsg
	mov	DWORD PTR [esp+12], eax
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp+8], eax
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC0
	mov	eax, DWORD PTR __imp___iob
	add	eax, 64
	mov	DWORD PTR [esp], eax
	call	_fprintf
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [esp], eax
	call	_sqlite3_close
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp], eax
	call	_exit
L3:
	nop
	leave
	ret
	.section .rdata,"dr"
LC1:
	.ascii "ADMIN\0"
LC2:
	.ascii "1\0"
LC3:
	.ascii "Admin\0"
LC4:
	.ascii "%10s\0"
LC5:
	.ascii "-----\0"
LC6:
	.ascii " | \0"
	.text
	.globl	_select_callback
	.def	_select_callback;	.scl	2;	.type	32;	.endef
_select_callback:
	push	ebp
	mov	ebp, esp
	sub	esp, 12
	mov	DWORD PTR [ebp-4], 0
	jmp	L5
L10:
	mov	eax, DWORD PTR [ebp-4]
	lea	edx, [0+eax*4]
	mov	eax, DWORD PTR [ebp+20]
	add	eax, edx
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC1
	mov	DWORD PTR [esp], eax
	call	_strcmp
	test	eax, eax
	jne	L6
	mov	eax, DWORD PTR [ebp-4]
	lea	edx, [0+eax*4]
	mov	eax, DWORD PTR [ebp+16]
	add	eax, edx
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC2
	mov	DWORD PTR [esp], eax
	call	_strcmp
	test	eax, eax
	jne	L7
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC3
	mov	DWORD PTR [esp], OFFSET FLAT:LC4
	call	_printf
	jmp	L8
L7:
	mov	DWORD PTR [esp+4], OFFSET FLAT:LC5
	mov	DWORD PTR [esp], OFFSET FLAT:LC4
	call	_printf
	jmp	L8
L6:
	mov	eax, DWORD PTR [ebp-4]
	lea	edx, [0+eax*4]
	mov	eax, DWORD PTR [ebp+16]
	add	eax, edx
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC4
	call	_printf
L8:
	mov	eax, DWORD PTR [ebp+12]
	sub	eax, 1
	cmp	DWORD PTR [ebp-4], eax
	jge	L9
	mov	DWORD PTR [esp], OFFSET FLAT:LC6
	call	_printf
L9:
	add	DWORD PTR [ebp-4], 1
L5:
	mov	eax, DWORD PTR [ebp-4]
	cmp	eax, DWORD PTR [ebp+12]
	jl	L10
	mov	DWORD PTR [esp], 10
	call	_putchar
	mov	eax, 0
	leave
	ret
	.section .rdata,"dr"
	.align 4
LC7:
	.ascii "select username, password from users where username='\0"
LC8:
	.ascii "users.db\0"
	.align 4
LC9:
	.ascii "Cannot open db. Please contact the IT guy\12\0"
	.text
	.globl	_db_access
	.def	_db_access;	.scl	2;	.type	32;	.endef
_db_access:
	push	ebp
	mov	ebp, esp
	push	edi # esp - 4
	sub	esp, 292 # 73 var
	mov	DWORD PTR [ebp-16], 0
	mov	DWORD PTR [ebp-8], OFFSET FLAT:LC7
	lea	eax, [ebp-16] # eax = ebp - 16
	mov	DWORD PTR [esp+4], eax 
	mov	DWORD PTR [esp], OFFSET FLAT:LC8
	call	_sqlite3_open # _sqlite3_open(users.db\0, 4)
	test	eax, eax
	jne	L13 # if eax != 0 --> jump 
	mov	DWORD PTR [ebp-276], 0
	lea	edx, [ebp-272] # edx = ebp -272
	mov	eax, 0 # eax = 0
	mov	ecx, 63 # ecx = 63
	mov	edi, edx # edi = ebp -272
	rep stosd # 63 blocks starting from ebp -272 will be 0
	mov	eax, DWORD PTR [ebp-8] # eax = select username, password from users where username='\0 
	mov	DWORD PTR [esp+4], eax 
	lea	eax, [ebp-276]
	mov	DWORD PTR [esp], eax
	call	_strcat # strcat(dest = ebp - 276, source = select username, password from users where username='\0 )
	mov	eax, DWORD PTR _arg # eax = [arg2+8] from main 
	mov	DWORD PTR [esp+8], 11
	mov	DWORD PTR [esp+4], eax
	lea	eax, [ebp-276]
	mov	DWORD PTR [esp], eax
	call	_strncat # strncat(destination = ebp -276, source = eax, 11);
	lea	eax, [ebp-276] # eax = select username, password from users where username= 11 characters from eax
	mov	ecx, -1 # ecx = -1	
	mov	edx, eax # edx = eax
	mov	eax, 0 # eax = 0
	mov	edi, edx # edi = eax
	repnz scasb # ecx = -strlen(edi)+1
	mov	eax, ecx # eax = ecx 
	not	eax # eax = ~eax
	lea	edx, [eax-1]  # edx = strlen(edi)
	lea	eax, [ebp-276] #  eax = ebp -276
	add	eax, edx # ebp - 276 + strlen(edi)
	mov	WORD PTR [eax], 39 # write to byte of [eax] = 39
	mov	eax, DWORD PTR [ebp-16] # eax = 0
	lea	edx, [ebp-20] # edx = ebp - 20
	mov	DWORD PTR [esp+16], edx 
	mov	DWORD PTR [esp+12], 0
	mov	DWORD PTR [esp+8], OFFSET FLAT:_select_callback
	lea	edx, [ebp-276]
	mov	DWORD PTR [esp+4], edx
	mov	DWORD PTR [esp], eax
	call	_sqlite3_exec
	mov	DWORD PTR [ebp-12], eax
	mov	eax, DWORD PTR [ebp-16]
	mov	DWORD PTR [esp+4], eax
	mov	eax, DWORD PTR [ebp-12]
	mov	DWORD PTR [esp], eax
	call	_check_error
	mov	eax, DWORD PTR [ebp-16]
	mov	DWORD PTR [esp], eax
	call	_sqlite3_close
	jmp	L16
L13:
	mov	eax, DWORD PTR __imp___iob
	add	eax, 64
	mov	DWORD PTR [esp+12], eax
	mov	DWORD PTR [esp+8], 42
	mov	DWORD PTR [esp+4], 1
	mov	DWORD PTR [esp], OFFSET FLAT:LC9
	call	_fwrite
	mov	eax, DWORD PTR [ebp-16]
	mov	DWORD PTR [esp], eax
	call	_sqlite3_close
	mov	DWORD PTR [esp], 1
	call	_exit
L16:
	mov	eax, 0
	add	esp, 292
	pop	edi
	pop	ebp
	ret
	.globl	_divider
	.data
	.align 4
_divider:
	.long	80
	.text
	.globl	_rand_32
	.def	_rand_32;	.scl	2;	.type	32;	.endef
_rand_32:
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	eax, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR [ebp-4], eax
	mov	eax, DWORD PTR [ebp-4]
	imul	eax, eax, 1103515245
	mov	DWORD PTR [ebp-4], eax
	add	DWORD PTR [ebp-4], 12345
	mov	eax, DWORD PTR [ebp-4]
	shr	eax, 16
	and	eax, 2047
	mov	DWORD PTR [ebp-8], eax
	mov	eax, DWORD PTR [ebp-4]
	imul	eax, eax, 1103515245
	mov	DWORD PTR [ebp-4], eax
	add	DWORD PTR [ebp-4], 12345
	sal	DWORD PTR [ebp-8], 10
	mov	eax, DWORD PTR [ebp-4]
	shr	eax, 16
	and	eax, 1023
	mov	edx, eax
	mov	eax, DWORD PTR [ebp-8]
	xor	eax, edx
	mov	DWORD PTR [ebp-8], eax
	mov	eax, DWORD PTR [ebp-4]
	imul	eax, eax, 1103515245
	mov	DWORD PTR [ebp-4], eax
	add	DWORD PTR [ebp-4], 12345
	sal	DWORD PTR [ebp-8], 10
	mov	eax, DWORD PTR [ebp-4]
	shr	eax, 16
	and	eax, 1023
	mov	edx, eax
	mov	eax, DWORD PTR [ebp-8]
	xor	eax, edx
	mov	DWORD PTR [ebp-8], eax
	mov	eax, DWORD PTR [ebp+8]
	mov	edx, DWORD PTR [ebp-4]
	mov	DWORD PTR [eax], edx
	mov	eax, DWORD PTR [ebp-8]
	leave
	ret
	.section .rdata,"dr"
LC10:
	.ascii "Level 4 Passed!\0"
LC11:
	.ascii "Points will be reduced\0"
	.text
	.globl	_handler
	.def	_handler;	.scl	2;	.type	32;	.endef
_handler: # dividing by zero or any othe non valid arithmetical operation will be enough to pass level 4 !
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	eax, DWORD PTR [ebp+8] # eax = arg1 
	cmp	eax, 8 # if eax != 8 --> jmp to L20
	jne	L20
	mov	DWORD PTR [esp], OFFSET FLAT:LC10 # "Level 4 Passed!\0"
	call	_puts # Print to STDOUT
	lea	eax, [ebp+8] # eax = ebp+8
	mov	DWORD PTR [esp], eax # push epb + 8
	call	_rand_32 # 
	mov	DWORD PTR _divider, eax # 0x00000080 = eax 
	mov	DWORD PTR [esp+4], -1
	mov	DWORD PTR [esp], OFFSET FLAT:_mark
	call	_longjmp # void longjmp(jmp_buf environment, int value) jump to set jump point and return -1
L20:
	mov	DWORD PTR [esp], OFFSET FLAT:LC11 # "Points will be reduced\0" - Only if we mess somehow with the signal
	call	_puts
	nop
	leave
	ret
	.section .rdata,"dr"
LC12:
	.ascii "Level 3 Passed!\0"
	.text
	.globl	__dummy_
	.def	__dummy_;	.scl	2;	.type	32;	.endef
__dummy_:
	push	ebp
	mov	ebp, esp
	sub	esp, 12
	mov	DWORD PTR [esp], OFFSET FLAT:LC12 # "Level 3 Passed!\0"
	call	_puts	
	mov	DWORD PTR [esp], OFFSET FLAT:_mark
	call	__setjmp  # Save current enviromnet - FAIILING HERE
	mov	ecx, DWORD PTR _divider # ecx = [80]
	mov	eax, 236496 # eax = 236496
	mov	edx, 0  # edx = 0
	div	ecx # 236496 / [80] ==> edx = remainder, eax = integer 
	mov	DWORD PTR [ebp-4], eax # local var1 = eax
	mov	eax, DWORD PTR [ebp-4] # eax = eax 
	sal	eax, 3 # shift left by 3 bits ==> eax = eax * 8
	mov	DWORD PTR [ebp-8], eax  # local var2 = eax * 8
	call	_db_access
	mov	DWORD PTR [esp], 0
	call	_exit
	.section .rdata,"dr"
LC13:
	.ascii "%08X \0"
	.text
	.globl	_printArray
	.def	_printArray;	.scl	2;	.type	32;	.endef
_printArray:
	push	ebp
	mov	ebp, esp
	sub	esp, 12
	mov	eax, DWORD PTR [ebp+12]
	mov	DWORD PTR [ebp-4], eax
	jmp	L24
L27:
	mov	eax, DWORD PTR [ebp-4]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC13
	call	_printf
	mov	eax, DWORD PTR [ebp-4]
	sub	eax, DWORD PTR [ebp+12]
	sar	eax, 2
	add	eax, 1
	and	eax, 3
	test	eax, eax
	jne	L25
	mov	DWORD PTR [esp], 10
	call	_putchar
	jmp	L26
L25:
	mov	eax, DWORD PTR [ebp-4]
	add	eax, 4
	cmp	DWORD PTR [ebp+16], eax
	ja	L26
	mov	DWORD PTR [esp], 10
	call	_putchar
L26:
	add	DWORD PTR [ebp-4], 4
L24:
	mov	eax, DWORD PTR [ebp-4]
	cmp	eax, DWORD PTR [ebp+16]
	jb	L27
	nop
	nop
	leave
	ret
	.section .rdata,"dr"
LC14:
	.ascii "Level 1 Passed!\0"
	.text
	.globl	_level1
	.def	_level1;	.scl	2;	.type	32;	.endef
_level1:
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	cmp	DWORD PTR [ebp+8], 1
	jle	L29
	mov	DWORD PTR [esp], OFFSET FLAT:LC14
	call	_puts
	jmp	L31
L29:
	mov	DWORD PTR [esp], 0
	call	_exit
L31:
	leave
	ret
	.section .rdata,"dr"
LC15:
	.ascii "%d %d\0"
LC16:
	.ascii "%X\0"
LC17:
	.ascii "Level 2 Passed!\0"
	.text
	.globl	_level2
	.def	_level2;	.scl	2;	.type	32;	.endef
_level2:
	push	ebp
	mov	ebp, esp
	sub	esp, 64
	mov	DWORD PTR [ebp-46], 120904275
	mov	DWORD PTR [ebp-42], -166938207
	mov	BYTE PTR [ebp-38], -49
	mov	DWORD PTR [ebp-4], 0 # name it i
	jmp	L33
L34:
	lea	eax, [ebp+8] # eax = arg1 that was pushed to level2
	mov	DWORD PTR [esp], eax
	call	_rand_32 # call rand num
	cdq # sign extened content of eax into edx (probably it sets edx = 0)
	shr	edx, 24 # shift right 24 bits 
	add	eax, edx # I think eax is the same here
	movzx	eax, al # eax = al 
	sub	eax, edx # I think eax is the same here
	mov	ecx, eax # ecx = eax
	lea	edx, [ebp-37] # edx = ebp-37 
	mov	eax, DWORD PTR [ebp-4] # eax = i 
	add	eax, edx # eax = ebp - 37 +i
	mov	BYTE PTR [eax], cl # 8 lower bits of ecx (cl) into ebp-37+i
	add	DWORD PTR [ebp-4], 1 # i++
L33:
	cmp	DWORD PTR [ebp-4], 8 # loop 8 times+
	jle	L34 
	lea	eax, [ebp-28] 
	mov	DWORD PTR [esp+8], eax # arg2 for scanf will be kept at ebp-28 = input2 decimal
	lea	eax, [ebp-24]
	mov	DWORD PTR [esp+4], eax # arg1 for scanf will be kept at ebp-24 = input1 decimal
	mov	DWORD PTR [esp], OFFSET FLAT:LC15
	call	_scanf
	mov	eax, DWORD PTR [ebp-24] # eax = input1
	test	eax, eax 
	js	L43 # If input1 is negative - jump to L43 --> starting over
	mov	eax, DWORD PTR [ebp-24] # eax = input1
	mov	edx, eax # edx = # eax = input1
	lea	eax, [ebp-37] # eax = ebp - 37
	add	eax, edx # eax = ebp - 37 + input1
	and	eax, -4  # set 2 LSB  to 0
	mov	DWORD PTR [ebp-16], eax # local4 = eax_input1 (with 00 at the end)
	mov	eax, DWORD PTR [ebp-28] # eax = input2
	mov	edx, eax # edx = input2
	lea	eax, [ebp-37]
	add	eax, edx # eax = ebp - 37 + input2
	and	eax, -4 
	mov	DWORD PTR [ebp-20], eax # local5 = eax_input2 (with 00 at the end)
	mov	eax, DWORD PTR [ebp-20]
	mov	DWORD PTR [esp+8], eax # arg1 for printArray (local5) 
	mov	eax, DWORD PTR [ebp-16]
	mov	DWORD PTR [esp+4], eax # arg2 for printArray (local4) 
	lea	eax, [ebp-37] 
	mov	DWORD PTR [esp], eax # esp = ebp -37
	call	_printArray # Prints array of numbers (I think its a machine code)
	mov	eax, DWORD PTR [ebp-16] # eax = local4
	mov	DWORD PTR [ebp-8], eax # local2 = local4
	jmp	L37
L38:
	lea	eax, [ebp-52] # eax = local13
	mov	DWORD PTR [esp+4], eax # local13 holds input3 - hexdecimal
	mov	DWORD PTR [esp], OFFSET FLAT:LC16
	call	_scanf
	mov	eax, DWORD PTR [ebp-8] # eax = local2
	mov	eax, DWORD PTR [eax] # eax = *local2
	mov	edx, eax # edx =*local2
	mov	eax, DWORD PTR [ebp-52] # eax = input3
	xor	eax, edx # xor between two address
	mov	edx, eax # edx = result of xor
	mov	eax, DWORD PTR [ebp-8] # eax = local2
	mov	DWORD PTR [eax], edx # *local2 = xor result
	add	DWORD PTR [ebp-8], 4 # local2 = local2 + 4
L37:
	mov	eax, DWORD PTR [ebp-8] # eax = local2 
	cmp	eax, DWORD PTR [ebp-20] # compare local2 with local5
	jb	L38 # if local4 < local 5 eventually wont jump because of line 470
	mov	DWORD PTR [ebp-12], 0 # mark it as j
	jmp	L39
L41:
	lea	edx, [ebp-37] # edx = ebp-37
	mov	eax, DWORD PTR [ebp-12]  # eax = j
	add	eax, edx # eax = ebp - 37 +j
	movzx	edx, BYTE PTR [eax] # edx = BYTE [ebp-37+j]
	lea	ecx, [ebp-46] # ecx = 
	mov	eax, DWORD PTR [ebp-12]  # eax = j
	add	eax, ecx # eax = ebp-46 + j 
	movzx	eax, BYTE PTR [eax] # eax = BYTE from [ebp-46+j]
	cmp	dl, al # compare BYTE [ebp-37+j] with BYTE from [ebp-46+j]  
	jne	L44 # We need to make DWORD[ebp-37]=DWORD[ebp-46] 
	add	DWORD PTR [ebp-12], 1 # j++
L39:
	cmp	DWORD PTR [ebp-12], 8 # loop  for 8 times 
	jle	L41
	mov	DWORD PTR [esp], OFFSET FLAT:LC17
	call	_puts
	jmp	L32
L43:
	nop
	jmp	L32
L44:
	nop
L32:
	leave
	ret
	.def	___main;	.scl	2;	.type	32;	.endef
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	push	ebp
	mov	ebp, esp 
	sub	esp, 16 # _main holds 4 local variables 
	call	___main # C/C++ initialization
	mov	DWORD PTR [esp+4], OFFSET FLAT:_handler 
	mov	DWORD PTR [esp], 8
	call	_signal # Signal(8,handler) 8 = SIGFPE its trigered by non valid arithmetic operation (divide by 0 for example) 
	mov	DWORD PTR [ebp-4], OFFSET FLAT:__dummy_ # Var 1 = pointer to __dummy
	mov	eax, DWORD PTR [ebp+12] # eax = arg2
	add	eax, 4 # eax = arg2+4
	mov	eax, DWORD PTR [eax] # eax = [eax] - so we need to set some address in second argument
	mov	DWORD PTR [esp], eax # pushing argument for atoi - converts char num into int num 
	call	_atoi # push [arg2+4] to atoi
	mov	DWORD PTR [ebp-8], eax # local var2 = result of atoi = int eax
	mov	eax, DWORD PTR [ebp+12] # eax = arg2
	mov	DWORD PTR [esp+4], eax # pushing second argument 
	mov	eax, DWORD PTR [ebp+8] # eax = arg1 
	mov	DWORD PTR [esp], eax # pushing first argument 
	call	_level1 # level1 uses only first argument
	mov	eax, DWORD PTR [ebp-8] # eax = local var2 = result of atoi = int eax
	mov	DWORD PTR [esp], eax # pass eax to level2
	call	_level2 # It uses argument for rand32 only
	mov	eax, DWORD PTR [ebp+12] # eax = arg2
	mov	eax, DWORD PTR [eax+8] # eax = [arg2+8]
	mov	DWORD PTR _arg, eax # storing [arg2+8] in _arg  which defines a memory block (4 bytes)
	mov	eax, DWORD PTR [ebp+12] # eax = arg2	
	add	eax, 4 # eax = arg2 + 4
	mov	eax, DWORD PTR [eax] # eax = [arg2+4]
	mov	DWORD PTR [esp], eax # push [arg2+4] to atoi
	call	_atoi
	mov	DWORD PTR [ebp-8], eax # [var2] = int [arg2+4]
	lea	eax, [ebp-8] # eax = var2 
	mov	DWORD PTR [esp], eax # push var2 to rand
	call	_rand_32
	cdq # sign extened content of eax into edx (probably it sets edx = 0)
	shr	edx, 24 # shift right  to 24 bits
	add	eax, edx  # eax + 0 
	movzx	eax, al # eax = al
	sub	eax, edx # eax = eax - edx (0)
	mov	edx, eax # edx = eax	 
	mov	eax, edx # eax = eax = edx 
	sar	eax, 31 # shift right 31 bits with preserving sign bit, LSB shifted to CF flag
	shr	eax, 27 # shift right 27 bits, LSB shifted to CF flag, its either 0 or F	
	add	edx, eax # eax + (F or 0)
	and	edx, 31 # edx = edx and 0000000000011111 => keeps 5 LSB bits
	sub	edx, eax #  edx - F or 0
	mov	eax, edx # eax = edx - F or 0
	mov	DWORD PTR _divider, eax # I think it tells to put eax at [80]
	mov	eax, 0
	leave
	ret
	.ident	"GCC: (MinGW.org GCC Build-2) 9.2.0"
	.def	_sqlite3_errmsg;	.scl	2;	.type	32;	.endef
	.def	_fprintf;	.scl	2;	.type	32;	.endef
	.def	_sqlite3_close;	.scl	2;	.type	32;	.endef
	.def	_exit;	.scl	2;	.type	32;	.endef
	.def	_strcmp;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_sqlite3_open;	.scl	2;	.type	32;	.endef
	.def	_strcat;	.scl	2;	.type	32;	.endef
	.def	_strncat;	.scl	2;	.type	32;	.endef
	.def	_sqlite3_exec;	.scl	2;	.type	32;	.endef
	.def	_fwrite;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_longjmp;	.scl	2;	.type	32;	.endef
	.def	__setjmp;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_signal;	.scl	2;	.type	32;	.endef
	.def	_atoi;	.scl	2;	.type	32;	.endef
