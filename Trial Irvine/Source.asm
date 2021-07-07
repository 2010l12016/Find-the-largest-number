include irvine32.inc

.data
number  byte "How many number do you want to compare (1-10)? ",0
input   byte "Input ",0  ; Input 1: 30
postfix byte ": ",0
result  byte "The greatest number is ",0
again   byte "Try again (Y/N)? ",0

;string byte 20 dup(?)
;value  dword 10A45Bh

.code
main proc

Start:
    ; readString    ;
    ; readDec       ; EAX = input value
    ; readInt
    ; readChar
    ; readHex
    ; readBin

    ; writeString
    ; writeDec      ; EAX is output value
    ; writeInt
    ; writeChar
    ; writeHex
    ; writeHexB
    ; writeBin
    ; writeBinB

comment *
    mov edx, offset number
    call writeString

    mov edx, offset string
    mov ecx, sizeof string
    call readString ; EAX = number of character

    call writeString

    call readDec    ; EAX = input value

    ; mov eax, ?
    mov eax, value
    mov ebx, sizeof value
    call writeHexB

    call crlf
    call crlf
*
    
    mov edx, offset number
    call writeString

    call readDec

comment &

if (eax < 1) {
    mov ecx, 1
}
elseif (eax > 10) {
    mov ecx, 10
}
else {
    mov ecx, eax
}

&
    cmp eax, 1
    jb BelowOne
    cmp eax, 10
    ja AboveTen 
    jmp Default    ; eax = [1, 10]

BelowOne:
    mov ecx, 1
    jmp MoveOn    
AboveTen:
    mov ecx, 10
    jmp MoveOn
Default:
    mov ecx, eax
MoveOn:
    
    mov ebx, 0   ; EBX is the smallest number
    mov esi, ecx ; EAX = ESI - ECX + 1
L1:
    mov edx, offset input
    call writeString
    mov eax, esi
    sub eax, ecx
    inc eax
    call writeDec
    mov edx, offset postfix
    call writeString

    call readDec    ; EAX = input value

    cmp ebx, eax    ; EBX became the biggest number
    ja Continue
    mov ebx, eax

Continue:

    loop L1   ; dec eac -> jecxnz L1

    mov edx, offset result
    call writeString

    mov eax, ebx
    call writeDec

    call crlf

    mov edx, offset again
    call writeString

    call readChar

    call crlf
    call crlf

    cmp al, 'y'
    je Start
    cmp al, 'Y'
    je Start

    exit
main endp
end main