section	.text
global  occurenceA, _occurenceA

; zad 2A
occurenceA:
_occurenceA:
        push	ebp
        mov	    ebp, esp
        mov     ebx, [ebp+8]

        mov     cl, ' '
        xor     edi, edi
        xor     esi, esi
        xor     dl, dl

outer_loop:
        xor     esi, esi
        mov     ebx, [ebp+8]
inner_loop:
        mov     al, [ebx]
        inc     ebx
        test    al, al
        jz      fin_inner
        cmp     al, cl
        jne     inner_loop
        inc     esi
        jmp     inner_loop
fin_inner:
        cmp     esi, edi
        jl      then
        mov     dl, cl
        mov     edi, esi
then:
        inc     cl
        cmp     cl, 127
        jl      outer_loop


        mov     ebx, [ebp+8]
fill_loop:
        mov     al, [ebx]
        inc     ebx
        test    al, al
        jz      fin
        cmp     al, dl
        jne     fill_loop
        mov     al, '*'
        mov     [ebx-1], al
        jmp     fill_loop

fin:
        mov     eax, [ebp+8]
	    pop	    ebp
	    ret