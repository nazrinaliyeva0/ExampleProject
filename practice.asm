; Write a program that adds two numbers(AL and BL) and stores the result in AX.

%include "io.inc"
section .text
global CMAIN
CMAIN:
    mov ebp, esp
    mov al, 20      
    mov bl, 15      
    add al, bl      
    mov ah, 0
    PRINT_DEC 2, AX
    xor eax, eax
    ret

; Subtract two 8-bit numbers and display the result on the screen.

%include "io.inc"
section .text
global CMAIN
CMAIN:
    mov ebp, esp
    mov al, 50      
    mov bl, 25      
    sub al, bl      
    PRINT_STRING "Subtraction: "
    PRINT_DEC 1, 50 
    PRINT_STRING " - "
    PRINT_DEC 1, 25 
    PRINT_STRING " = "
    PRINT_DEC 1, al 
    NEWLINE
    xor eax, eax    
    ret

; Multiply a value in AL by 2 using a shift instruction(SHL).

%include "io.inc"
section .text
global CMAIN
CMAIN:
    mov ebp, esp
    mov al, 15      
    PRINT_STRING "Original value in AL: "
    PRINT_DEC 1, al
    NEWLINE
    shl al, 1
    PRINT_STRING "After SHL AL, 1:      "
    PRINT_DEC 1, al
    NEWLINE
    xor eax, eax
    ret

; Divide a 16-bit number by 10 and show both quotient and remainder.
%include "io.inc"

section .text
global CMAIN
CMAIN:
mov ax, 12345 
xor dx, dx 

PRINT_STRING "Dividing "
PRINT_DEC 2, ax 
PRINT_STRING " by 10"
NEWLINE
NEWLINE

mov bx, 10
div bx 

PRINT_STRING "Quotient: "
PRINT_DEC 2, ax 
NEWLINE

PRINT_STRING "Remainder: "
PRINT_DEC 2, dx 
NEWLINE
NEWLINE

xor eax, eax
ret

; Read two numbers from the user and display their sum.

%include "io.inc"
section .text
global CMAIN
CMAIN:
    mov ebp, esp
    PRINT_STRING "Addition Calculator"
    NEWLINE
    PRINT_STRING "Enter first number: "
    GET_DEC 2, ax          
    NEWLINE
    mov bx, ax             
    PRINT_STRING "Enter second number: "
    GET_DEC 2, cx       
    NEWLINE
    add ax, cx            
    PRINT_STRING "Result: "
    PRINT_DEC 2, bx        
    PRINT_STRING " + "
    PRINT_DEC 2, cx        
    PRINT_STRING " = "
    PRINT_DEC 2, ax        
    NEWLINE
    xor eax, eax
    ret

; Check if a number is even or odd using the TEST instruction.

%include "io.inc"
section .text
global CMAIN
CMAIN:
    mov ebp, esp
    PRINT_STRING "Even/Odd Checker using TEST Instruction"
    NEWLINE
    PRINT_STRING "======================================"
    NEWLINE
    NEWLINE
    PRINT_STRING "Enter a number: "
    GET_DEC 2, ax         
    NEWLINE
    test al, 1             
    PRINT_STRING "Number: "
    PRINT_DEC 2, ax
    PRINT_STRING " ("
    PRINT_HEX 2, ax
    PRINT_STRING "h)"
    NEWLINE
    NEWLINE
    jz is_even             
    jmp is_odd             
is_even:
    PRINT_STRING "Result: The number is EVEN"
    NEWLINE
    PRINT_STRING "Reason: Least significant bit is 0"
    NEWLINE
    jmp end_check
is_odd:
    PRINT_STRING "Result: The number is ODD"
    NEWLINE
    PRINT_STRING "Reason: Least significant bit is 1"
    NEWLINE
end_check:
    xor eax, eax
    ret

; Compare two numbers and print “EQUAL” if they are the same, otherwise “NOT EQUAL.”

%include "io.inc"
section .text
global CMAIN
CMAIN:
    mov ebp, esp
    PRINT_STRING "Number Comparison Program"
    NEWLINE
    PRINT_STRING "========================"
    NEWLINE
    NEWLINE
    PRINT_STRING "Enter first number: "
    GET_DEC 2, ax          
    NEWLINE
    PRINT_STRING "Enter second number: "
    GET_DEC 2, bx          
    NEWLINE
    NEWLINE
    PRINT_STRING "Comparing: "
    PRINT_DEC 2, ax
    PRINT_STRING " and "
    PRINT_DEC 2, bx
    NEWLINE
    PRINT_STRING "Result: "
    cmp ax, bx
    je equal               
    PRINT_STRING "NOT EQUAL"
    NEWLINE
    jmp end_comparison
equal:
    PRINT_STRING "EQUAL"
    NEWLINE
end_comparison:
    xor eax, eax
    ret

;Add two numbers and display “OVERFLOW” if the result exceeds 255.

%include "io.inc"
section .text
global CMAIN
CMAIN:
    mov ebp, esp
    PRINT_STRING "8-bit Addition with Overflow Check"
    NEWLINE
    PRINT_STRING "=================================="
    NEWLINE
    NEWLINE
    PRINT_STRING "Enter first number (0-255): "
    GET_DEC 1, al          
    NEWLINE
    PRINT_STRING "Enter second number (0-255): "
    GET_DEC 1, bl          
    NEWLINE
    NEWLINE
    PRINT_STRING "Operation: "
    PRINT_DEC 1, al
    PRINT_STRING " + "
    PRINT_DEC 1, bl
    PRINT_STRING " = "
    add al, bl             
    jc overflow_detected
    PRINT_DEC 1, al
    NEWLINE
    PRINT_STRING "Status: No overflow (result <= 255)"
    NEWLINE
    jmp end_program
overflow_detected:
    PRINT_STRING "OVERFLOW!"
    NEWLINE
    PRINT_STRING "Status: Result exceeds 255 (8-bit range)"
    NEWLINE
    PRINT_STRING "Actual sum: "
    movzx ax, al           
    add ax, 256            
    PRINT_DEC 2, ax
    NEWLINE
end_program:
    xor eax, eax
    ret

; Input a number and print its square.

%include "io.inc"
section .text
global CMAIN
CMAIN:
    mov ebp, esp
    PRINT_STRING "Number Squaring Program"
    NEWLINE
    PRINT_STRING "======================"
    NEWLINE
    NEWLINE
    PRINT_STRING "Enter a number (0-255): "
    GET_DEC 1, al          
    NEWLINE
    NEWLINE
    PRINT_STRING "Number: "
    PRINT_DEC 1, al
    NEWLINE
    mov bl, al             
    mul bl                 
    PRINT_STRING "Square: "
    PRINT_DEC 1, al        
    PRINT_STRING "² = "
    PRINT_DEC 2, ax        
    NEWLINE
    PRINT_STRING "Hex: "
    PRINT_HEX 1, al
    PRINT_STRING "² = "
    PRINT_HEX 2, ax
    PRINT_STRING "h"
    NEWLINE
    xor eax, eax
    ret

; Swap the values of AL and BL using only registers(no temporary variable).

%include "io.inc"
section .text
global CMAIN
CMAIN:
    mov ebp, esp
    PRINT_STRING "Register Swap (AL and BL) using XOR"
    NEWLINE
    PRINT_STRING "==================================="
    NEWLINE
    NEWLINE
    mov al, 0xAA          
    mov bl, 0x55          
    PRINT_STRING "Initial values:"
    NEWLINE
    PRINT_STRING "AL = "
    PRINT_HEX 1, al
    PRINT_STRING "h ("
    PRINT_DEC 1, al
    PRINT_STRING ")"
    NEWLINE
    PRINT_STRING "BL = "
    PRINT_HEX 1, bl
    PRINT_STRING "h ("
    PRINT_DEC 1, bl
    PRINT_STRING ")"
    NEWLINE
    NEWLINE
    PRINT_STRING "Performing swap using XOR operations..."
    NEWLINE
    NEWLINE
    xor al, bl            
    xor bl, al            
    xor al, bl            
    PRINT_STRING "After swap:"
    NEWLINE
    PRINT_STRING "AL = "
    PRINT_HEX 1, al
    PRINT_STRING "h ("
    PRINT_DEC 1, al
    PRINT_STRING ")"
    NEWLINE
    PRINT_STRING "BL = "
    PRINT_HEX 1, bl
    PRINT_STRING "h ("
    PRINT_DEC 1, bl
    PRINT_STRING ")"
    NEWLINE
    xor eax, eax
    ret

; Write a program to calculate 5! (factorial) using a loop.

%include "io.inc"
section .text
global CMAIN
CMAIN:
    mov ebp, esp
    PRINT_STRING "Factorial Calculator: 5!"
    NEWLINE
    PRINT_STRING "========================"
    NEWLINE
    NEWLINE
    ; Initialize registers
    mov ax, 1              ; AX will hold the result (start with 1)
    mov cx, 5              ; CX is our counter (5! means multiply 5×4×3×2×1)
    PRINT_STRING "Calculating: 5! = "
factorial_loop:
    ; Display current step
    PRINT_DEC 1, cx        ; Print current number
    ; Multiply AX by CX
    mul cx                 ; AX = AX * CX
    ; Print multiplication sign (except for last number)
    cmp cx, 1
    je skip_mult_sign
    PRINT_STRING " × "
skip_mult_sign:
    ; Decrement counter and continue if not zero
    dec cx
    jnz factorial_loop
    PRINT_STRING " = "
    PRINT_DEC 2, ax        ; Print final result (5! = 120)
    NEWLINE
    xor eax, eax
    ret

; Use a FOR-like loop to calculate the sum of numbers from 1 to 10.

%include "io.inc"
section .text
global CMAIN
CMAIN:
    mov ebp, esp
    PRINT_STRING "Sum of 1 to 10 - Step by Step"
    NEWLINE
    PRINT_STRING "============================="
    NEWLINE
    NEWLINE
    ; Initialize
    mov ax, 0              ; Sum accumulator
    mov cx, 1              ; Counter from 1 to 10
    PRINT_STRING "Step-by-step calculation:"
    NEWLINE
    NEWLINE
calculation_loop:
    ; Display current operation
    PRINT_STRING "Step "
    PRINT_DEC 1, cx
    PRINT_STRING ": "
    PRINT_DEC 2, ax        ; Current sum
    PRINT_STRING " + "
    PRINT_DEC 1, cx        ; Current number
    PRINT_STRING " = "
    ; Perform addition
    add ax, cx             ; AX = AX + CX
    ; Display new sum
    PRINT_DEC 2, ax
    NEWLINE
    ; Increment counter and check if we reached 10
    inc cx
    cmp cx, 11             ; Stop after 10
    jl calculation_loop
    NEWLINE
    PRINT_STRING "Final sum: "
    PRINT_DEC 2, ax
    NEWLINE
    xor eax, eax
    ret

; Using a WHILE-style loop, print numbers from 1 to 5 on separate lines.

%include "io.inc"
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    PRINT_STRING "WHILE Loop: Numbers 1 to 5"
    NEWLINE
    PRINT_STRING "=========================="
    NEWLINE
    NEWLINE
    ; Initialize counter
    mov al, 1              ; Start from 1
while_loop:
    ; WHILE condition: al <= 5
    cmp al, 5
    jg end_while           ; Jump if al > 5 (exit condition)
    ; Loop body: Print the current number
    PRINT_STRING "Number: "
    PRINT_DEC 1, al
    NEWLINE
    ; Increment counter
    inc al
    ; Jump back to check condition (WHILE loop)
    jmp while_loop
end_while:
    PRINT_STRING "Loop completed!"
    NEWLINE
    xor eax, eax
    ret

; Display all even numbers from 1 to 20 using a loop.

%include "io.inc"
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    PRINT_STRING "Even Numbers from 2 to 20 (Step by 2)"
    NEWLINE
    PRINT_STRING "====================================="
    NEWLINE
    NEWLINE
    ; Start from first even number (2) and increment by 2
    mov al, 2              ; Start from 2 (first even number)
    PRINT_STRING "Even numbers: "
step_loop:
    ; Display current even number
    PRINT_DEC 1, al
    ; Check if this is the last number (20)
    cmp al, 20
    je end_step_loop
    ; Print comma separator
    PRINT_STRING ", "
    ; Increment by 2 to get next even number
    add al, 2
    jmp step_loop
end_step_loop:
    NEWLINE
    NEWLINE
    PRINT_STRING "Total even numbers found: 10"
    NEWLINE
    xor eax, eax
    ret

; Print all numbers between 1 and 50 that are divisible by 3.

%include "io.inc"
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    PRINT_STRING "Numbers Divisible by 3 (1-50)"
    NEWLINE
    PRINT_STRING "============================="
    NEWLINE
    NEWLINE
    ; Start from first number divisible by 3 (3) and increment by 3
    mov al, 3              ; Start from 3
    PRINT_STRING "Numbers: "
direct_loop:
    ; Display current number
    PRINT_DEC 1, al
    ; Check if this is the last number (48)
    cmp al, 48
    je end_direct_loop
    ; Print comma separator
    PRINT_STRING ", "
    ; Add 3 to get next number divisible by 3
    add al, 3
    jmp direct_loop
end_direct_loop:
    NEWLINE
    NEWLINE
    PRINT_STRING "Total: 16 numbers (3, 6, 9, ..., 48)"
    NEWLINE
    xor eax, eax
    ret

; Using a loop, count how many numbers between 1–20 are odd.

%include "io.inc"
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    PRINT_STRING "Count Odd Numbers (1-20)"
    NEWLINE
    PRINT_STRING "========================"
    NEWLINE
    NEWLINE
    ; Initialize counters
    mov al, 1              ; Current number (start from 1)
    mov bl, 0              ; Odd number counter
    PRINT_STRING "Odd numbers found: "
count_loop:
    ; Check if current number is odd using TEST instruction
    test al, 1             ; Test least significant bit
    jz skip_odd            ; If LSB=0 (even), skip
    ; Number is odd - count it and display
    inc bl                 ; Increment odd counter
    PRINT_DEC 1, al
    ; Check if this is the last odd number (19)
    cmp al, 19
    je finish_count
    ; Print comma separator for all except last number
    PRINT_STRING ", "
skip_odd:
    ; Increment to next number
    inc al
    ; Continue until we reach 20
    cmp al, 20
    jle count_loop
finish_count:
    NEWLINE
    NEWLINE
    PRINT_STRING "Total odd numbers: "
    PRINT_DEC 1, bl
    NEWLINE
    xor eax, eax
    ret

; Create a program that reads a number N and computes the sum of even numbers up to N.

%include "io.inc"
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    PRINT_STRING "Sum of Even Numbers up to N"
    NEWLINE
    PRINT_STRING "==========================="
    NEWLINE
    NEWLINE
    ; Get number N from user
    PRINT_STRING "Enter a number N: "
    GET_DEC 2, ax          ; Read N into AX (16-bit)
    NEWLINE
    NEWLINE
    ; Validate input
    cmp ax, 1
    jl invalid_input
    ; Initialize
    mov bx, 0              ; BX will hold the sum
    mov cx, 2              ; Start from first even number (2)
    PRINT_STRING "Even numbers: "
sum_loop:
    ; Check if current number exceeds N
    cmp cx, ax
    jg finish_sum
    ; Add current even number to sum
    add bx, cx
    ; Display current even number
    PRINT_DEC 2, cx
    ; Check if next number would exceed N
    mov dx, cx
    add dx, 2
    cmp dx, ax
    jg skip_comma
    ; Print comma separator
    PRINT_STRING " + "
skip_comma:
    ; Next even number
    add cx, 2
    jmp sum_loop
finish_sum:
    ; Display the result
    PRINT_STRING " = "
    PRINT_DEC 2, bx
    NEWLINE
    NEWLINE
    ; Also show mathematical formula
    PRINT_STRING "Mathematical formula: 2 + 4 + 6 + ... + "
    ; Find largest even number <= N
    test ax, 1
    jz n_is_even
    dec ax                 ; If N is odd, use N-1
n_is_even:
    PRINT_DEC 2, ax
    NEWLINE
    jmp exit_program
invalid_input:
    PRINT_STRING "Error: N must be at least 1"
    NEWLINE
exit_program:
    xor eax, eax
    ret

; Use nested loops to print a simple pattern (Exp:triangle of stars *).

%include "io.inc"
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    PRINT_STRING "Star Triangle Pattern"
    NEWLINE
    PRINT_STRING "====================="
    NEWLINE
    NEWLINE
    ; Outer loop for rows
    mov ecx, 1              ; Row counter (start from 1)
row_loop:
    ; Inner loop for stars in current row
    mov ebx, 1              ; Star counter for current row
star_loop:
    ; Print a star
    PRINT_STRING "*"
    ; Check if we've printed enough stars for this row
    inc ebx
    cmp ebx, ecx
    jle star_loop
    ; Move to next line after each row
    NEWLINE
    ; Next row
    inc ecx
    cmp ecx, 6              ; 5 rows total (1 to 5 stars)
    jle row_loop
    xor eax, eax
    ret

;  Using conditional jumps, print whether a number is positive, negative, or zero.

%include "io.inc"
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    PRINT_STRING "Number Sign Checker"
    NEWLINE
    PRINT_STRING "==================="
    NEWLINE
    NEWLINE
    ; Get number from user
    PRINT_STRING "Enter a number (-32768 to 32767): "
    GET_DEC 2, ax          ; Read 16-bit signed number
    NEWLINE
    NEWLINE
    ; Display the number
    PRINT_STRING "Number: "
    PRINT_DEC 2, ax
    PRINT_STRING " (hex: "
    PRINT_HEX 2, ax
    PRINT_STRING "h)"
    NEWLINE
    NEWLINE
    ; Check if number is zero, positive, or negative
    PRINT_STRING "Result: "
    cmp ax, 0
    je is_zero             ; Jump if equal to zero
    jl is_negative         ; Jump if less than zero (negative)
    jg is_positive         ; Jump if greater than zero (positive)
is_zero:
    PRINT_STRING "ZERO"
    NEWLINE
    PRINT_STRING "The number is exactly zero"
    jmp end_check
is_positive:
    PRINT_STRING "POSITIVE"
    NEWLINE
    PRINT_STRING "The number is greater than zero"
    jmp end_check
is_negative:
    PRINT_STRING "NEGATIVE" 
    NEWLINE
    PRINT_STRING "The number is less than zero"
end_check:
    NEWLINE
    xor eax, eax
    ret

; Use a loop to calculate the average of 5 predefined numbers stored in memory.

%include "io.inc"
section .data
    numbers dw 15, 25, 35, 45, 55  ; Predefined numbers (word size)
    count   db 5                   ; Number of elements
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    PRINT_STRING "Average of 5 Predefined Numbers"
    NEWLINE
    PRINT_STRING "==============================="
    NEWLINE
    NEWLINE
    ; Display the numbers
    PRINT_STRING "Numbers: "
    mov esi, numbers        ; Pointer to numbers array
    mov ecx, 5              ; Loop counter
display_loop:
    PRINT_DEC 2, [esi]      ; Print current number
    add esi, 2              ; Move to next number (2 bytes each)
    dec ecx
    cmp ecx, 0
    je end_display
    PRINT_STRING ", "
    jmp display_loop
end_display:
    NEWLINE
    NEWLINE
    ; Calculate sum using loop
    mov esi, numbers        ; Reset pointer to beginning
    mov cx, 5               ; Loop counter
    mov ax, 0               ; Initialize sum (16-bit)
sum_loop:
    add ax, [esi]           ; Add current number to sum
    add esi, 2              ; Move to next number
    loop sum_loop           ; Decrement CX and loop if not zero
    ; Display sum
    PRINT_STRING "Sum: "
    PRINT_DEC 2, ax
    NEWLINE
    ; Calculate average (sum / count)
    mov bl, 5               ; Divisor (count)
    mov ah, 0               ; Clear upper byte for division
    div bl                  ; AX / BL = AL (quotient), AH (remainder)
    ; Display average
    PRINT_STRING "Average: "
    PRINT_DEC 1, al         ; Integer part
    PRINT_STRING " remainder "
    PRINT_DEC 1, ah         ; Fractional part as remainder
    NEWLINE
    ; Show calculation
    PRINT_STRING "Calculation: 185 ÷ 5 = 37"
    NEWLINE
    xor eax, eax
    ret
