.intel_syntax noprefix
.globl	_main

_main:
	push	ebp
	mov	ebp, esp
	push	esi
	push	ebx
	and	esp, -16
	sub	esp, 64


			push 0x0       		# pushing null
			push 0x41797261		# pushing A,y,r,a
			push 0x7262694c		# pushing r,b,i,L
			push 0x64616f4c		# pushing d,a,o,L
			push esp            # push pointer for "LoadLibraryA"

			call FindFunction   # call FindFunction("LoadLibraryA")
			add esp, 0x14       # clear stack

			push 0x00006c6c		# pushing null,l,l
			push 0x642e7472		# pushing d,#,t,r
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

			push 0x00006674		# pushing null,f,t
			push 0x6e697270		# pushing n,i,r,p
			push esp            # push pointer for "printf"
			push ebx            # push module handle for msvcrt

			mov edi, eax		# edi = address of GetProcAddress
			call eax            # call GetProcAddress(msvcrt, "printf")
			add esp, 0x08       # clear stack (note arguments are cleared already)
			mov esi, eax		# esi = printf address

			push 0x00000066		# pushing null,f
			push 0x6e616373		# pushing n,a,c,s
			push esp            # push pointer for "scanf"
			push ebx            # push module handle for msvcrt

			call edi            # call GetProcAddress(msvcrt, "scanf")
			add esp, 0x08       # clear stack (note arguments are cleared already)
			mov ebx, eax		# ebx = scanf address

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
	mov edi, esp
	push eax
	push edi
	call ebx
	add esp, 0x10
	cmp	eax, -1
	jne	L6

	# "%02d %02d %02d %02d %02d\n\0"
	push 0x0000000A # null, \n
	push 0x64323025 # d, 2, 0, %
	push 0x20643230 # space, d, 2 ,0
	push 0x25206432 # %, space, d, 2
	push 0x30252064 # 0, %, space, d
	push 0x32302520 # 2, 0, %, space
	push 0x64323025 # d, 2, 0, %
	mov edi, esp

	mov	ebx, DWORD PTR [esp+88]
	push ebx
	mov	ebx, DWORD PTR [esp+88]
	push ebx
	mov	ebx, DWORD PTR [esp+88]
	push ebx
	mov	ebx, DWORD PTR [esp+88]
	push ebx
	mov	ebx, DWORD PTR [esp+88]
	push ebx

	push edi
	call esi
	add esp, 0x34

	mov	eax, 0
	lea	esp, [ebp-8]
	pop	ebx
	pop	esi
	pop	ebp
	ret

FindFunction:
