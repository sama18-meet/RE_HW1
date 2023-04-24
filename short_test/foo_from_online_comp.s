.intel_syntax noprefix
.global main

.LC0:
        .string "road"
.LC1:
        .string "%s"
main:
        lea     ecx, [esp+4]
        and     esp, -16
        push    DWORD PTR [ecx-4]
        push    ebp
        mov     ebp, esp
        push    ecx
        sub     esp, 20
        mov     DWORD PTR [ebp-12], OFFSET FLAT:.LC0
        sub     esp, 8
        lea     eax, [ebp-17]
        push    eax
        push    OFFSET FLAT:.LC1
        call    __isoc99_scanf
        add     esp, 16
        sub     esp, 8
        lea     eax, [ebp-17]
        push    eax
        push    OFFSET FLAT:.LC1
        call    printf
        add     esp, 16
        mov     eax, 0
        mov     ecx, DWORD PTR [ebp-4]
        leave
        lea     esp, [ecx-4]
        ret
		