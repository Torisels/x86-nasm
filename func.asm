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



;============================================
; THE STACK
;============================================
;
; larger addresses
;
;  |                               |
;  | ...                           |
;  ---------------------------------
;  | function parameter - char *a  | EBP+8
;  ---------------------------------
;  | return address                | EBP+4
;  ---------------------------------
;  | saved caller's ebp            | EBP, ESP
;  ---------------------------------
;  | ... here local variables      | EBP-x
;  |     when needed               |
;
; \/                              \/
; \/ the stack grows in this      \/
; \/ direction                    \/
;
; lower addresses
;
;
;============================================
;remlastnum:
;_remlastnum:
;        push	ebp
;        mov	    ebp, esp
;        mov	    eax, DWORD [ebp+8]	;address of *a to eax
;
;count_loop:
;	    mov     dl, [eax]           ;current char  abc\0
;	    inc     eax
;	    test    dl, dl
;	    jnz     count_loop
;
;end_count_loop:
;        sub     eax, 2
;
;remove_loop:
;        mov     dl, [eax]
;        dec     eax
;        cmp     dl, '9'
;        ja      end
;        cmp     dl, '0'
;        jae     remove_loop
;
;end:
;        mov     BYTE [eax + 2], 0
;        mov     eax, DWORD [ebp+8]
;	    pop	    ebp
;	    ret
;


;
;section	.text
;global  _removerng, _remnth, _leavelastndig
;
;
;_removerng:
;
;        push	ebp
;        mov	ebp, esp
;
;        mov	eax, DWORD [ebp+8]	;address of *a to eax
;        mov cl, [ebp+12]
;        mov ch, [ebp+16]
;        mov ebx, eax
;
;loop:
;	    mov     dl, [eax]       ;current char
;	    inc     eax
;	    test    dl, dl
;	    jz      fin
;	    cmp     dl, cl
;	    jb      copy
;	    cmp     dl, ch
;	    ja      copy
;	    jmp     loop
;copy:
;        mov BYTE [ebx], dl
;        inc     ebx
;        jmp loop
;fin:
;        mov     BYTE [ebx], 0
;        mov	    eax, [EBP+8]
;	    pop	    ebp
;	    ret
;
;
;
;;===========================
;_remnth:
;        push	ebp
;        mov	ebp, esp
;
;        mov	eax, DWORD [ebp+8]	;address of *a to eax
;        mov ebx, eax
;        mov DWORD ecx, 1
;
;loopi:
;	    mov     dl, [eax]       ;current char
;	    inc     eax
;	    test    dl, dl
;        jz      fin2
;
;	    cmp     ecx, [ebp+12]
;	    jb      next
;	    mov     DWORD ecx, 1
;	    jmp loopi
;next:
;	    mov     [ebx], dl
;        inc     ebx
;        inc     ecx
;        jmp     loopi
;
;
;fin2:
;        mov     BYTE [ebx], 0
;        mov	    eax, [EBP+8]
;	    pop	    ebp
;	    ret
;;================================================
_leavelastndig:

        push    ebp
        mov	    ebp, esp
        mov	    eax, DWORD [ebp+8]	;address of *a to eax
        mov     ebx, DWORD [ebp+12]

len:
	    mov     dl, [eax]       ;current char
	    inc     eax
	    test    dl, dl
        jnz     len


	   dec      eax

digit_loop:
        mov     dl, [eax]
        dec     eax
        cmp     dl, '0'
        jb      digit_loop
        cmp     dl, '9'
        ja      digit_loop
        dec     ebx
        jnz     digit_loop



        inc     eax
        mov     ebx, eax
        mov     ecx, eax


final_loop:
         mov    dl, [ecx]
         inc    ecx
         test   dl, dl
         jz     exit

         cmp     dl, '0'
	     jb      final_loop
	     cmp     dl, '9'
	     ja      final_loop

	     mov   BYTE [ebx], dl
	     inc   ebx
	     jmp   final_loop

exit:
        mov     BYTE [ebx], 0

	    pop	    ebp
	    ret



