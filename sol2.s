.intel_syntax noprefix
.global main

.LC0:
        .string "road"
if_road:
        push    ebp
        mov     ebp, esp
        sub     esp, 16
        mov     DWORD PTR [ebp-8], OFFSET FLAT:.LC0
        mov     DWORD PTR [ebp-4], 0
        jmp     .L2
.L5:
        mov     edx, DWORD PTR [ebp-4]
        mov     eax, DWORD PTR [ebp+8]
        add     eax, edx
        movzx   edx, BYTE PTR [eax]
        mov     ecx, DWORD PTR [ebp-4]
        mov     eax, DWORD PTR [ebp-8]
        add     eax, ecx
        movzx   eax, BYTE PTR [eax]
        cmp     dl, al
        je      .L3
        mov     eax, 0
        jmp     .L4
.L3:
        add     DWORD PTR [ebp-4], 1
.L2:
        mov     edx, DWORD PTR [ebp-4]
        mov     eax, DWORD PTR [ebp+8]
        add     eax, edx
        movzx   eax, BYTE PTR [eax]
        test    al, al
        jne     .L5
        mov     edx, DWORD PTR [ebp-4]
        mov     eax, DWORD PTR [ebp-8]
        add     eax, edx
        movzx   eax, BYTE PTR [eax]
        test    al, al
        jne     .L6
        mov     eax, 1
        jmp     .L4
.L6:
        mov     eax, 0
.L4:
        leave
        ret
.LC1:
        .string "city"
if_city:
        push    ebp
        mov     ebp, esp
        sub     esp, 16
        mov     DWORD PTR [ebp-8], OFFSET FLAT:.LC1
        mov     DWORD PTR [ebp-4], 0
        jmp     .L8
.L11:
        mov     edx, DWORD PTR [ebp-4]
        mov     eax, DWORD PTR [ebp+8]
        add     eax, edx
        movzx   edx, BYTE PTR [eax]
        mov     ecx, DWORD PTR [ebp-4]
        mov     eax, DWORD PTR [ebp-8]
        add     eax, ecx
        movzx   eax, BYTE PTR [eax]
        cmp     dl, al
        je      .L9
        mov     eax, 0
        jmp     .L10
.L9:
        add     DWORD PTR [ebp-4], 1
.L8:
        mov     edx, DWORD PTR [ebp-4]
        mov     eax, DWORD PTR [ebp+8]
        add     eax, edx
        movzx   eax, BYTE PTR [eax]
        test    al, al
        jne     .L11
        mov     edx, DWORD PTR [ebp-4]
        mov     eax, DWORD PTR [ebp-8]
        add     eax, edx
        movzx   eax, BYTE PTR [eax]
        test    al, al
        jne     .L12
        mov     eax, 1
        jmp     .L10
.L12:
        mov     eax, 0
.L10:
        leave
        ret
.LC2:
        .string "settlement"
if_settlement:
        push    ebp
        mov     ebp, esp
        sub     esp, 16
        mov     DWORD PTR [ebp-8], OFFSET FLAT:.LC2
        mov     DWORD PTR [ebp-4], 0
        jmp     .L14
.L17:
        mov     edx, DWORD PTR [ebp-4]
        mov     eax, DWORD PTR [ebp+8]
        add     eax, edx
        movzx   edx, BYTE PTR [eax]
        mov     ecx, DWORD PTR [ebp-4]
        mov     eax, DWORD PTR [ebp-8]
        add     eax, ecx
        movzx   eax, BYTE PTR [eax]
        cmp     dl, al
        je      .L15
        mov     eax, 0
        jmp     .L16
.L15:
        add     DWORD PTR [ebp-4], 1
.L14:
        mov     edx, DWORD PTR [ebp-4]
        mov     eax, DWORD PTR [ebp+8]
        add     eax, edx
        movzx   eax, BYTE PTR [eax]
        test    al, al
        jne     .L17
        mov     edx, DWORD PTR [ebp-4]
        mov     eax, DWORD PTR [ebp-8]
        add     eax, edx
        movzx   eax, BYTE PTR [eax]
        test    al, al
        jne     .L18
        mov     eax, 1
        jmp     .L16
.L18:
        mov     eax, 0
.L16:
        leave
        ret
.LC3:
        .string "development"
if_development:
        push    ebp
        mov     ebp, esp
        sub     esp, 16
        mov     DWORD PTR [ebp-8], OFFSET FLAT:.LC3
        mov     DWORD PTR [ebp-4], 0
        jmp     .L20
.L23:
        mov     edx, DWORD PTR [ebp-4]
        mov     eax, DWORD PTR [ebp+8]
        add     eax, edx
        movzx   edx, BYTE PTR [eax]
        mov     ecx, DWORD PTR [ebp-4]
        mov     eax, DWORD PTR [ebp-8]
        add     eax, ecx
        movzx   eax, BYTE PTR [eax]
        cmp     dl, al
        je      .L21
        mov     eax, 0
        jmp     .L22
.L21:
        add     DWORD PTR [ebp-4], 1
.L20:
        mov     edx, DWORD PTR [ebp-4]
        mov     eax, DWORD PTR [ebp+8]
        add     eax, edx
        movzx   eax, BYTE PTR [eax]
        test    al, al
        jne     .L23
        mov     edx, DWORD PTR [ebp-4]
        mov     eax, DWORD PTR [ebp-8]
        add     eax, edx
        movzx   eax, BYTE PTR [eax]
        test    al, al
        jne     .L24
        mov     eax, 1
        jmp     .L22
.L24:
        mov     eax, 0
.L22:
        leave
        ret
main:
        lea     ecx, [esp+4]
        and     esp, -16
        push    DWORD PTR [ecx-4]
        push    ebp
        mov     ebp, esp
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

        push ebx  # store module handle for msvcrt
        push eax  # store module handle for GetProcAddress
        push	0x00000066	# null,f
        push	0x6e616373	# n,a,c,s
        push esp            # push pointer for "scanf"
        push ebx            # push module handle for msvcrt

        call eax            # call GetProcAddress(msvcrt, "scanf")
        add esp, 0x08       # clear stack (note arguments are cleared already)
        pop ebx  # restore module handle for msvcrt
        pop edx  # restore module handle for GetProcAddress

        push eax # store module handler for scanf
        push 0x00006674		# pushing null,f,t
        push 0x6e697270		# pushing n,i,r,p
        push esp            # push pointer for "printf"
        push ebx            # push module handle for msvcrt

        call edx            # call GetProcAddress(msvcrt, "printf")
        add esp, 0x08       # clear stack (note arguments are cleared already)
        pop edx

        push    ecx
        sub     esp, 68
        mov     DWORD PTR [ebp-20], edx # Store module handle for scanf
        mov     DWORD PTR [ebp-24], eax # Store module handle for printf

        pxor    xmm0, xmm0 # xmm0 - 128 bit register in x86 architecture
        movups  XMMWORD PTR [ebp-60], xmm0 # DWORD PTR [ebp-60] = resourses[0]
        movd    DWORD PTR [ebp-44], xmm0 # DWORD PTR [ebp-44] = resourses[4]

        sub     esp, 8 # not sure why
        lea     eax, [ebp-37]
        push    eax # push user_input (not sure)
        push	0x00007325	# null,s,%
        push	esp
        mov     edx, DWORD PTR [ebp-20]
        call    edx # scanf(%s,user_input)
        add     esp, 20 
        mov     DWORD PTR [ebp-12], eax # DWORD PTR [ebp-12] = flag
        jmp     .L26
.L32:
        movzx   eax, BYTE PTR [ebp-45]
        cmp     al, 10
        je      .L27
        movzx   eax, BYTE PTR [ebp-45]
        test    al, al
        je      .L27
        sub     esp, 12
        lea     eax, [ebp-45]
        push    eax
        call    if_road
        add     esp, 16
        test    eax, eax
        je      .L28
        mov     eax, DWORD PTR [ebp-68]
        add     eax, 1
        mov     DWORD PTR [ebp-68], eax
        mov     eax, DWORD PTR [ebp-64]
        add     eax, 1
        mov     DWORD PTR [ebp-64], eax
.L28:
        sub     esp, 12
        lea     eax, [ebp-45]
        push    eax
        call    if_settlement
        add     esp, 16
        test    eax, eax
        je      .L29
        mov     eax, DWORD PTR [ebp-68]
        add     eax, 1
        mov     DWORD PTR [ebp-68], eax
        mov     eax, DWORD PTR [ebp-64]
        add     eax, 1
        mov     DWORD PTR [ebp-64], eax
        mov     eax, DWORD PTR [ebp-60]
        add     eax, 1
        mov     DWORD PTR [ebp-60], eax
        mov     eax, DWORD PTR [ebp-56]
        add     eax, 1
        mov     DWORD PTR [ebp-56], eax
.L29:
        sub     esp, 12
        lea     eax, [ebp-45]
        push    eax
        call    if_city
        add     esp, 16
        test    eax, eax
        je      .L30
        mov     eax, DWORD PTR [ebp-56]
        add     eax, 2
        mov     DWORD PTR [ebp-56], eax
        mov     eax, DWORD PTR [ebp-52]
        add     eax, 3
        mov     DWORD PTR [ebp-52], eax
.L30:
        sub     esp, 12
        lea     eax, [ebp-45]
        push    eax
        call    if_development
        add     esp, 16
        test    eax, eax
        je      .L31
        mov     eax, DWORD PTR [ebp-60]
        add     eax, 1
        mov     DWORD PTR [ebp-60], eax
        mov     eax, DWORD PTR [ebp-56]
        add     eax, 1
        mov     DWORD PTR [ebp-56], eax
        mov     eax, DWORD PTR [ebp-52]
        add     eax, 1
        mov     DWORD PTR [ebp-52], eax
.L31:
        lea     eax, [ebp-37]
        push    eax # push user_input (not sure)
        push	0x00007325	# null,s,%
        push	esp
        mov     edx, DWORD PTR [ebp-20]
        call    edx # scanf(%s,user_input)
        add     esp, 0x0c 
        mov     DWORD PTR [ebp-12], eax # DWORD PTR [ebp-12] = flag
.L26:
        cmp     DWORD PTR [ebp-12], -1
        je      .L27
        cmp     DWORD PTR [ebp-12], 0
        jne     .L32
.L27:
        mov     DWORD PTR [ebp-16], 0 # i = 0
        jmp     .L33
.L34:
        mov     eax, DWORD PTR [ebp-16] # eax = i
        mov     eax, DWORD PTR [ebp-68+eax*4]# eax = resources[i]
        sub     esp, 8  # not sure we need this 
        push    eax
        push	0x00000020	# null,<space> 
        push	0x64323025	# d,2,0,%
        push	esp
        mov     edx, DWORD PTR [ebp-24] # load module handle for printf
        call    edx # Using here printf for simplicity
        add     esp, 24
        add     DWORD PTR [ebp-16], 1 # i++
.L33:
        cmp     DWORD PTR [ebp-16], 4
        jle     .L34
        sub     esp, 12 # not sure we need this 
        push	0x0000000A # null,/n
        push	esp
        mov     edx, DWORD PTR [ebp-24] # load module handle for printf
        call    edx # Using here printf for simplicity
        add     esp, 20
        mov     eax, 0
        mov     ecx, DWORD PTR [ebp-4]
        leave
        lea     esp, [ecx-4]
        ret


