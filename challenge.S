.LC0:
        .string "\n"
.LC1:
        .string "road"
.LC2:
        .string "settlement"
.LC3:
        .string "city"
.LC4:
        .string "development"
.LC5:
        .string "%02d "
main:
        lea     ecx, [esp+4]
        and     esp, -16
        push    DWORD PTR [ecx-4]
        push    ebp
        mov     ebp, esp
        push    ecx
        sub     esp, 116
        mov     DWORD PTR [ebp-16], 0 # get_proc_addr_ptr
        mov     DWORD PTR [ebp-20], 0 # strcspn_ptr
        mov     DWORD PTR [ebp-24], 0 # fgets_ptr
        mov     DWORD PTR [ebp-28], 0 # strcmp_ptr
        mov     DWORD PTR [ebp-32], 0 # printf_ptr
        mov     DWORD PTR [ebp-36], 0 # putchar_ptr


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
                        mov     DWORD PTR [ebp-16], eax # initialize get_proc_addr_ptr

                        # PRINTF
                        push 0x00006674		# pushing null,f,t
                        push 0x6e697270		# pushing n,i,r,p
                        push esp            # push pointer for "printf"
                        push ebx            # push module handle for msvcrt

                        call eax            # call GetProcAddress(msvcrt, "printf")
                        add esp, 0x08       # clear stack (note arguments are cleared already)
                        mov     DWORD PTR [ebp-32], eax # initialize printf_ptr

                        # STRCMP
                        push 0x0000706D		# pushing null,p,m
                        push 0x63727473		# pushing c,r,t,s
                        push esp            # push pointer for "strcmp"
                        push ebx            # push module handle for msvcrt

                        mov eax, DWORD PTR [ebp-16] # get_proc_addr_ptr
                        call eax            # call GetProcAddress(msvcrt, "strcmp")
                        add esp, 0x08       # clear stack (note arguments are cleared already)
                        mov     DWORD PTR [ebp-28], eax # initialize strcmp_ptr

                        # strcspn
                        push 0x006E7073		# pushing null,n,p,s
                        push 0x63727473		# pushing c,r,t,s
                        push esp            # push pointer for "strcspn"
                        push ebx            # push module handle for msvcrt

                        mov eax, DWORD PTR [ebp-16] # get_proc_addr_ptr
                        call eax            # call GetProcAddress(msvcrt, "strcmp")
                        add esp, 0x08       # clear stack (note arguments are cleared already)
                        mov     DWORD PTR [ebp-20], eax # initialize strcspn_ptr

                        # fgets
                        push 0x00000073		# pushing null,s
                        push 0x74656766		# pushing t,e,g,f
                        push esp            # push pointer for "fgets"
                        push ebx            # push module handle for msvcrt

                        mov eax, DWORD PTR [ebp-16] # get_proc_addr_ptr
                        call eax            # call GetProcAddress(msvcrt, "strcmp")
                        add esp, 0x08       # clear stack (note arguments are cleared already)
                        mov     DWORD PTR [ebp-24], eax # initialize fgets_ptr

                        # putchar
                        push 0x00726168		# pushing null,r,a,h
                        push 0x63747570		# pushing c,t,u,p
                        push esp            # push pointer for "putchar"
                        push ebx            # push module handle for msvcrt

                        mov eax, DWORD PTR [ebp-16] # get_proc_addr_ptr
                        call eax            # call GetProcAddress(msvcrt, "strcmp")
                        add esp, 0x08       # clear stack (note arguments are cleared already)
                        mov     DWORD PTR [ebp-36], eax # initialize fgets_ptr


        mov     DWORD PTR [ebp-108], 0
        mov     DWORD PTR [ebp-104], 0
        mov     DWORD PTR [ebp-100], 0
        mov     DWORD PTR [ebp-96], 0
        mov     DWORD PTR [ebp-92], 0
.L7:
        mov     eax, DWORD PTR stdin
        sub     esp, 4
        push    eax
        push    50
        lea     eax, [ebp-86]
        push    eax
        mov     eax, DWORD PTR [ebp-24]
        call    eax # fgets
        add     esp, 16
        test    eax, eax
        setne   al
        test    al, al
        je      .L2
        sub     esp, 8
        push    OFFSET FLAT:.LC0
        lea     eax, [ebp-86]
        push    eax
        mov     eax, DWORD PTR [ebp-20]
        call    eax # strcspn
        add     esp, 16
        mov     BYTE PTR [ebp-86+eax], 0
        sub     esp, 8
        push    OFFSET FLAT:.LC1
        lea     eax, [ebp-86]
        push    eax
        mov     eax, DWORD PTR [ebp-28]
        call    eax #strcmp
        add     esp, 16
        test    eax, eax
        jne     .L3
        mov     eax, DWORD PTR [ebp-108]
        add     eax, 1
        mov     DWORD PTR [ebp-108], eax
        mov     eax, DWORD PTR [ebp-104]
        add     eax, 1
        mov     DWORD PTR [ebp-104], eax
.L3:
        sub     esp, 8
        push    OFFSET FLAT:.LC2
        lea     eax, [ebp-86]
        push    eax
        mov     eax, DWORD PTR [ebp-28]
        call    eax #strcmp
        add     esp, 16
        test    eax, eax
        jne     .L4
        mov     eax, DWORD PTR [ebp-108]
        add     eax, 1
        mov     DWORD PTR [ebp-108], eax
        mov     eax, DWORD PTR [ebp-104]
        add     eax, 1
        mov     DWORD PTR [ebp-104], eax
        mov     eax, DWORD PTR [ebp-100]
        add     eax, 1
        mov     DWORD PTR [ebp-100], eax
        mov     eax, DWORD PTR [ebp-96]
        add     eax, 1
        mov     DWORD PTR [ebp-96], eax
.L4:
        sub     esp, 8
        push    OFFSET FLAT:.LC3
        lea     eax, [ebp-86]
        push    eax
        mov     eax, DWORD PTR [ebp-28]
        call    eax #strcmp
        add     esp, 16
        test    eax, eax
        jne     .L5
        mov     eax, DWORD PTR [ebp-96]
        add     eax, 2
        mov     DWORD PTR [ebp-96], eax
        mov     eax, DWORD PTR [ebp-92]
        add     eax, 3
        mov     DWORD PTR [ebp-92], eax
.L5:
        sub     esp, 8
        push    OFFSET FLAT:.LC4
        lea     eax, [ebp-86]
        push    eax
        mov     eax, DWORD PTR [ebp-28]
        call    eax #strcmp
        add     esp, 16
        test    eax, eax
        jne     .L7
        mov     eax, DWORD PTR [ebp-100]
        add     eax, 1
        mov     DWORD PTR [ebp-100], eax
        mov     eax, DWORD PTR [ebp-96]
        add     eax, 1
        mov     DWORD PTR [ebp-96], eax
        mov     eax, DWORD PTR [ebp-92]
        add     eax, 1
        mov     DWORD PTR [ebp-92], eax
        jmp     .L7
.L2:
        mov     DWORD PTR [ebp-12], 0
.L9:
        cmp     DWORD PTR [ebp-12], 4
        jg      .L8
        mov     eax, DWORD PTR [ebp-12]
        mov     eax, DWORD PTR [ebp-108+eax*4]
        sub     esp, 8
        push    eax
        push    OFFSET FLAT:.LC5
        mov     eax, DWORD PTR [ebp-32]
        call    eax # printf
        add     esp, 16
        add     DWORD PTR [ebp-12], 1
        jmp     .L9
.L8:
        sub     esp, 12
        push    10
        mov     eax, DWORD PTR [ebp-36]
        call    eax # putchar
        add     esp, 16
        mov     eax, 0
        mov     ecx, DWORD PTR [ebp-4]
        leave
        lea     esp, [ecx-4]
        ret