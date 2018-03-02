
section .data 

    msg db "Please enter the first digit ", 0xA,0xD ; display message to get the first digit
    len equ $- msg ; length of the message

section .bss

    num1 resb 2 ; uninitialized data
    num2 resb 2 
    result resb 1    

section .text 

    msg2 db "Please enter the second digit", 0xA,0xD ; display message to get the second digit
    len2 equ $- msg2 ; length of the message

    msg3 db "The sum is: " ; display the result
    len3 equ $- msg3 ; length of the message

global _start 

 _start: 
	
    mov eax, SYS_WRITE         ; display the first message
    mov ebx, STDOUT         
    mov ecx, msg         
    mov edx, len 
    int 0x80                

    mov eax, SYS_READ 			; get the user input from the keyboard
    mov ebx, STDIN  
    mov ecx, num1 
    mov edx, 2
    int 0x80            

    mov eax, SYS_WRITE        	; display the second message
    mov ebx, STDOUT         
    mov ecx, msg2          
    mov edx, len2         
    int 0x80

    mov eax, SYS_READ  			; get the user input from the keyboard
    mov ebx, STDIN  
    mov ecx, num2 
    mov edx, 2
    int 0x80        

    mov eax, SYS_WRITE         ; display the result
    mov ebx, STDOUT         
    mov ecx, msg3          
    mov edx, len3         
    int 0x80

    
    mov eax, [num1]				; move num1 into the eax register
    sub eax, '0'				; subtract 0 to eax to convert ASCII code to decimal
   
    mov ebx, [num2]				; move num2 into the ebx register
    sub ebx, '0'				; subtract 0 to ebx to conver ASCII code to decimal

    
    add eax, ebx				; add ebx into eax to get the sum
   
    add eax, '0'				; add 0 to the eax register to conver decimal back to ASCII

    
    mov [result], eax			; move the sum of both numbers back into the result

    
    mov eax, SYS_WRITE        	; display the result
    mov ebx, STDOUT
    mov ecx, result         
    mov edx, 1        
    int 0x80


exit:    
    mov eax, SYS_EXIT   
    xor ebx, ebx 
    int 0x80
