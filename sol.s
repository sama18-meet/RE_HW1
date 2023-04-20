	.file	"sol.c"
	.intel_syntax noprefix
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB13:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	and	esp, -16
	add	esp, -128
	call	___main
	mov	DWORD PTR [esp+120], 0 # get_proc_addr_ptr
	mov	DWORD PTR [esp+116], 0 # strcspn_ptr
	mov	DWORD PTR [esp+112], 0 # fgets_ptr
	mov	DWORD PTR [esp+108], 0 # strcmp_ptr
	mov	DWORD PTR [esp+104], 0 # printf_ptr
	mov	DWORD PTR [esp+100], 0 # putchar_ptr



                        push 0x0       		# pushing null
                        push 0x41797261		# pushing A,y,r,a
                        push 0x7262694c		# pushing r,b,i,L
                        push 0x64616f4c		# pushing d,a,o,L
                        push esp            # push pointer for "LoadLibraryA"

                        call FindFunction   # call FindFunction("LoadLibraryA")
                        add esp, 0x14       # clear stack

                        push 0x00006c6c		# pushing null,l,l
                        push 0x642e7472		# pushing d,.,t,r
                        push 0x6376736d		# pushing c,v,s,m
                        push esp

                        call eax            # call LoadLibrary("msvcrt.dll")
                        add esp, 0x0c       # clear stack (note arguments are cleared already)

                        push eax            # store module handle for msvcrt
                        push 0x00007373		# pushing null,s,s
                        push 0x65726464		# pushing e,r,d,d
                        push 0x41636f72		# pushing A,c,o,r
                        push 0x50746547		# pushing P,t,e,G
                        push esp            # push pointer for "GetProcAddress"

                        call FindFunction   # call FindFunction("GetProcAddress")
                        add esp, 0x14       # clear stack
                        pop ebx             # restore module handle for msvcrt
                        mov     DWORD PTR [esp+120], eax # initialize get_proc_addr_ptr

                        # PRINTF
                        push 0x00006674		# pushing null,f,t
                        push 0x6e697270		# pushing n,i,r,p
                        push esp            # push pointer for "printf"
                        push ebx            # push module handle for msvcrt

                        call eax            # call GetProcAddress(msvcrt, "printf")
                        add esp, 0x08       # clear stack (note arguments are cleared already)
                        mov     DWORD PTR [esp+104], eax # initialize printf_ptr

                        # STRCMP
                        push 0x0000706D		# pushing null,p,m
                        push 0x63727473		# pushing c,r,t,s
                        push esp            # push pointer for "strcmp"
                        push ebx            # push module handle for msvcrt

                        mov eax, DWORD PTR [esp+120] # get_proc_addr_ptr
                        call eax            # call GetProcAddress(msvcrt, "strcmp")
                        add esp, 0x08       # clear stack (note arguments are cleared already)
                        mov     DWORD PTR [esp+108], eax # initialize strcmp_ptr

                        # strcspn
                        push 0x006E7073		# pushing null,n,p,s
                        push 0x63727473		# pushing c,r,t,s
                        push esp            # push pointer for "strcspn"
                        push ebx            # push module handle for msvcrt

                        mov eax, DWORD PTR [esp+120] # get_proc_addr_ptr
                        call eax            # call GetProcAddress(msvcrt, "strcmp")
                        add esp, 0x08       # clear stack (note arguments are cleared already)
                        mov     DWORD PTR [esp+116], eax # initialize strcspn_ptr

                        # fgets
                        push 0x00000073		# pushing null,s
                        push 0x74656766		# pushing t,e,g,f
                        push esp            # push pointer for "fgets"
                        push ebx            # push module handle for msvcrt

                        mov eax, DWORD PTR [esp+120] # get_proc_addr_ptr
                        call eax            # call GetProcAddress(msvcrt, "strcmp")
                        add esp, 0x08       # clear stack (note arguments are cleared already)
                        mov     DWORD PTR [esp+112], eax # initialize fgets_ptr

                        # putchar
                        push 0x00726168		# pushing null,r,a,h
                        push 0x63747570		# pushing c,t,u,p
                        push esp            # push pointer for "putchar"
                        push ebx            # push module handle for msvcrt

                        mov eax, DWORD PTR [esp+120] # get_proc_addr_ptr
                        call eax            # call GetProcAddress(msvcrt, "strcmp")
                        add esp, 0x08       # clear stack (note arguments are cleared already)
                        mov     DWORD PTR [esp+100], eax # initialize putchar




	mov	DWORD PTR [esp+28], 0
	mov	DWORD PTR [esp+32], 0
	mov	DWORD PTR [esp+36], 0
	mov	DWORD PTR [esp+40], 0
	mov	DWORD PTR [esp+44], 0
	jmp	L2
L6:
	push 0x0032315C		# pushing \,1,2,\0
	lea	eax, [esp+50]
	push eax
	mov eax, DWORD PTR [esp+116]
	call	eax # strcspn
	sub esp, 8


	mov	BYTE PTR [esp+50+eax], 0
	push 0x00000000		# null
	push 0x64616F72		# d,a,o,r
	lea	eax, [esp+50]
	push eax
	mov eax, DWORD PTR [esp+108]
	call	eax # strcmp
	sub esp, 12
	test	eax, eax
	jne	L3
	mov	eax, DWORD PTR [esp+28]
	add	eax, 1
	mov	DWORD PTR [esp+28], eax
	mov	eax, DWORD PTR [esp+32]
	add	eax, 1
	mov	DWORD PTR [esp+32], eax
L3:
	push 0x0000746E # null,t,n
	push 0x656D656C # e,m,e,l
	push 0x74746573 # t,t,e,s
	lea	eax, [esp+50]
	push eax
	mov eax, DWORD PTR [esp+108]
	call	eax # strcmp
	sub esp, 16
	test	eax, eax
	jne	L4
	mov	eax, DWORD PTR [esp+28]
	add	eax, 1
	mov	DWORD PTR [esp+28], eax
	mov	eax, DWORD PTR [esp+32]
	add	eax, 1
	mov	DWORD PTR [esp+32], eax
	mov	eax, DWORD PTR [esp+36]
	add	eax, 1
	mov	DWORD PTR [esp+36], eax
	mov	eax, DWORD PTR [esp+40]
	add	eax, 1
	mov	DWORD PTR [esp+40], eax
L4:
	push 0x00000000 # null
	push 0x79746963 # y,t,i,c
	lea	eax, [esp+50]
	push eax
	mov eax, DWORD PTR [esp+108]
	call	eax # strcmp
	sub esp, 12
	test	eax, eax
	jne	L5
	mov	eax, DWORD PTR [esp+40]
	add	eax, 2
	mov	DWORD PTR [esp+40], eax
	mov	eax, DWORD PTR [esp+44]
	add	eax, 3
	mov	DWORD PTR [esp+44], eax
L5:
	push 0x00746E65 # null,t,n,e
	push 0x6D706F6C # m,p,o,l
	push 0x65766564 # e,v,e,d
	lea	eax, [esp+50]
	push eax
	mov eax, DWORD PTR [esp+108]
	call	eax # strcmp
	sub esp, 16
	test	eax, eax
	jne	L2
	mov	eax, DWORD PTR [esp+36]
	add	eax, 1
	mov	DWORD PTR [esp+36], eax
	mov	eax, DWORD PTR [esp+40]
	add	eax, 1
	mov	DWORD PTR [esp+40], eax
	mov	eax, DWORD PTR [esp+44]
	add	eax, 1
	mov	DWORD PTR [esp+44], eax
L2:
	mov	eax, DWORD PTR __imp___iob
	mov	DWORD PTR [esp+8], eax
	mov	DWORD PTR [esp+4], 50
	lea	eax, [esp+50]
	mov	DWORD PTR [esp], eax
	mov eax, DWORD PTR [esp+112]
	call	eax # fgets
	test	eax, eax
	jne	L6
	mov	DWORD PTR [esp+124], 0
	jmp	L7
L8:
	mov	eax, DWORD PTR [esp+124]
	mov	eax, DWORD PTR [esp+28+eax*4]
	mov	DWORD PTR [esp+4], eax
	push 0x00000020 # null, space
	push 0x64323025 # d,2,0,%
	mov eax, DWORD PTR [esp+104]
	call	eax # printf
	sub esp, 8
	add	DWORD PTR [esp+124], 1
L7:
	cmp	DWORD PTR [esp+124], 4
	jle	L8
	mov	DWORD PTR [esp], 10
	mov eax, DWORD PTR [esp+100]
	call	eax # putchar
	mov	eax, 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc

FindFunction:

LFE13:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_strcspn;	.scl	2;	.type	32;	.endef
	.def	_strcmp;	.scl	2;	.type	32;	.endef
	.def	_fgets;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef

