section	.text
global  kcharsD, _kcharsD

; zad 1D
kcharsD:
_kcharsD:
        push	ebp
        mov	    ebp, esp
        mov     ebx, [ebp+8]

first_digit:
        mov     cl, [ebx]
        inc     ebx
        test    cl, cl
        jz      fin ;digit not found
        cmp     cl, '9'
        ja      first_digit
        cmp     cl, '0'
        jb      first_digit
        and     ecx, 0xFF
        sub     ecx, '0'
        mov     edi, ebx
        sub     edi, 2


last_digit:
        mov    al, [ebx]
        inc    ebx
        test   al, al
        jz     cap
        cmp    al, '9'
        ja     last_digit
        cmp    al, '0'
        jb     last_digit
        mov    edi, ebx
        sub    edi, 2
        jmp    last_digit


cap:
        sub    edi, ecx

capitalize:
        mov     al, [edi + ecx]
        dec     ecx
        js      fin
        cmp     al, 'A'
        jb      capitalize
        cmp     al, 'Z'
        ja      capitalize
        add     al, ' '
        mov     [edi+ecx+1], al
        jmp     capitalize

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
