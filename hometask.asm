;TASK-2
;sum of negative number
include irvine32.inc 
.data
array SWORD -3, -6, -1, -10, 10, 30, 40, 4
msg1 db "sum of neagtive num is: ",0
msg2 db "total negative numbers are: ",0
sum dword 0
count dword 0
.code
main proc
call clrscr
mov esi,offset array       ;move offset of array to esi (pointer)
mov ecx,LENGTHOF array
sumloop: 
   mov ax,word ptr [esi]   ;move current elemet of array to ax (ax have current element t0 process)
   test ax,1h              ;test ax elemet (if sign bit is 1,num is negative)
   jz skip                 ;jump to lbel if number is negative
   movsx eax,ax            ;sign-extension 
   add sum,eax             ;add the negative numbers to sum
   inc count               ;inc counter of negative number
skip:                      ;label if number is positive
   add esi,2               ;jump to next elemet of array
   loop sumloop            ;looping
mov edx,offset msg1        ;display message
call writestring
mov eax,sum                ;display sum
call writeint
call crlf
mov edx,offset msg2
call writestring
mov eax,count              ;display counter
call writeint
exit
main endp
end main