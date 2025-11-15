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

///////// 1.Explain the main differences between fixed-point and floating-point number representations.

Fixed-Point:The decimal point is in a fixed location.Like a ruler with permanent markings.
Floating-Point:The decimal point can float to represent very large or very small numbers.Like scientific notation(Exp:6.02 × 10²³).

Feature			Fixed-Point					Floating-Point
Precision		Absolute 					Relative
Range			Limited & Fixed 				Very Wide
Hardware		Simple & Fast 					Complex & Slower 
Best For		Embedded systems,DSP,low-power devices		Scientific computing,graphics,general-purpose software 

2.Convert -5.75 to its binary form in IEEE 754 single-precision format.

Main Statement:Convert -5.75 to IEEE 754 single-precision binary.
Key Steps:
	Sign:Negative→Sign bit=1
	Binary Conversion:
		5.75=101.11₂(5=101,0.75=0.11)
		Scientific notation:1.0111×2²
	Components:
		Sign:1
		Exponent:2+127=129=10000001₂
		Mantissa:.0111(drop leading 1)

3.Convert -25 to 8-bit two's complement binary.
Main Statement:
	Convert -25 to 8-bit two's complement binary.
Key Steps:
	+25 to binary:
		25=16+8+1
		25₁₀=00011001₂
Apply 2's complement:
	Invert:11100110
	Add 1:11100111
Final Result:
	11100111

4.Explain the difference between direct and complement codes with an example.

Main Statement:
	Direct Code: Simple sign-magnitude representation
	Complement Code: Uses 2's complement for negative numbers
Example for -5(8-bit):
	Direct Code:
		Sign bit(1)+magnitude(5)=10000101
	Complement Code:
		+5=00000101
		Invert:11111010
		Add 1:11111011

5.Describe how to convert a given two’s complement code back to decimal form.

Main Statement:
	To convert two's complement back to decimal:Check MSB→If negative,apply 2's complement→Convert to decimal→Apply sign.
Key Steps:
	Check MSB(Most Significant Bit):
		MSB=0:Positive number→Convert directly to decimal
		MSB=1:Negative number→Continue to step 2
For Negative Numbers:
	Invert all bits(0→1,1→0)
	Add 1 to the result
	Convert this positive binary to decimal
	Apply negative sign
Example:Convert 11100111 back to decimal
	MSB=1→Negative number
	Invert:00011000
	Add 1:00011001=25₁₀
	Apply sign:-25
Final Result:
	-25

6.Specify the range of signed numbers that can be represented with 1 byte (8 bits).

Main Statement:
	8-bit signed numbers range:-128 to +127
Key Details:
	Total combinations:2⁸=256 possible values
	Negative range:-128 to -1→128 numbers
	Positive range:0 to +127→128 numbers
Representation:
	Minimum:-128=10000000
	Maximum:+127=01111111
	Zero:0=00000000

7.Explain how overflow can be detected when adding two 16-bit numbers.

Main Statement:
	Overflow occurs when the result exceeds the 16-bit signed range(-32768 to +32767).
Detection Methods:
	1.For Signed Numbers(2's complement):
		Check Overflow Flag(OF)
		Rule:OF=1 if:
			Adding two positives gives negative result
			Adding two negatives gives positive result
	2. For Unsigned Numbers:
		Check Carry Flag(CF)
		CF=1 if result>65535
Example (8-bit for simplicity):
	  01111111(+127)
	+ 00000001(+1)
	= 10000000(-128)←OF=1(overflow!)

8.Describe the roles of mantissa and exponent in a floating-point number.

Key Roles:
	Mantissa (Significand):
		Contains the significant digits of the number
		Determines the precision/accuracy
		Represents the number between 1.0 and 2.0(normalized)
		More bits=higher precision
	Exponent:
		Determines the scale/magnitude of the number
		Moves the binary point left or right
		Controls the range of representable numbers
		Uses bias representation(Exp:+127 bias in single-precision)
Example:6.25=1.1001×2²
	Mantissa: .1001(significant digits)
	Exponent:2(scale factor)

9.What is the normalization of a fixed-point number and why is it important?

Main Statement:
	Normalization adjusts a fixed-point number to use the full precision of its format.
What is Normalization?:
	Shifting the number so its most significant bit is 1
	Eliminating leading zeros to maximize precision
	Similar to scientific notation:0.00101→1.01×2⁻³
Why Important:
	Maximizes Precision:Uses all available bits effectively
	Consistent Representation:Standard format for all numbers
	Prevents Precision Loss:Avoids losing significant bits in calculations
	Simplifies Comparisons:Normalized numbers are easier to compare
Example:
	Unnormalized:00010110(uses only 4 significant bits)
	Normalized:10110000(uses all 8 bits effectively)

10.Define the concept of bias in IEEE 754 format and calculate the bias value for an 8-bit exponent field.

Main Statement:
	Bias allows exponents to be stored as unsigned numbers by adding a constant offset.
Bias Calculation for 8-bit Exponent:
	Formula:Bias=2^(k-1)-1 where k=exponent bits
	Bias=2^(8-1)-1=2⁷-1=128-1=127
How It Works:
	Stored Exponent=Actual Exponent+127
	Actual Exponent=Stored Exponent-127
Examples:
	Actual exponent -5→Stored:-5+127=122
	Actual exponent +10→Stored:10+127=137

11.List the main parts of the CPU and briefly describe the function of each.

Main Statement:
	The CPU has three main components:ALU,Control Unit,and Registers.

Main Parts & Functions:
	ALU(Arithmetic Logic Unit)
		Performs mathematical calculations (add, subtract, etc.)
		Handles logical operations (AND, OR, NOT, XOR)
		The "calculator" of the CPU
	Control Unit(CU)
		Directs operations of the CPU
		Fetches,decodes,and executes instructions
		Manages data flow between CPU components
		The "traffic controller" of the CPU
	Registers
		Small,fast memory inside CPU
		Store data,addresses,and instructions temporarily
		Examples:Accumulator,Program Counter,Instruction Register
Additional Key Components:
	Cache Memory:Very fast memory for frequently used data
	Clock:Synchronizes all CPU operations
	Bus Interface Unit:Manages communication with system bus

12.What is the function of the ALU, and what types of operations does it perform?

Main Statement:
	The ALU(Arithmetic Logic Unit) is the CPU's computational core that performs all mathematical and logical operations.
Main Functions:
	Arithmetic Operations:
		Addition,Subtraction
		Multiplication,Division
		Increment,Decrement
	Logical Operations:
		AND,OR,NOT,XOR
		Bit shifting(LEFT,RIGHT)
		Bit rotation
		Comparisons
Key Features:
	Takes two inputs(operands) and produces one output
	Sets status flags(Zero,Carry,Overflow,Sign)
	Works with binary data
	Handles both integer and bit-wise operations

13.Explain the different roles of the Program Counter (PC) and the Stack Pointer (SP) registers.

Main Statement:
	PC tracks the next instruction | SP tracks the top of the stack
Program Counter(PC):
	Purpose:Points to the next instruction to be executed
	Behavior:Automatically increments after each instruction
	Modified by:Jumps,calls,branches,and interrupts
	Analogy:Bookmark in a program instruction book
Stack Pointer(SP):
	Purpose:Points to the top of the stack in memory
	Behavior:Decrements when pushing,increments when popping
	Modified by:PUSH,POP,CALL,RET instructions
	Analogy:Pointer to the top plate in a stack of plates

14.Differentiate between general-purpose and special-purpose registers.

Main Statement:
	General-purpose:Flexible use for data/addresses | Special-purpose: Dedicated specific functions
General-Purpose Registers:
	Purpose:Store data,addresses,or intermediate results
	Flexible:Can be used for various operations
	Examples:AX,BX,CX,DX(in x86)
	Usage:Arithmetic,data movement,addressing

Special-Purpose Registers:
	Purpose:Dedicated to specific CPU functions
	Fixed Role:Each has a unique,specialized task
	Examples:
		PC(Program Counter):Points to next instruction
		SP(Stack Pointer):Points to top of stack
		IR(Instruction Register):Holds current instruction
		Status Register:Stores condition flags

15.Describe the Accumulator-based machine model and give an example.

Main Statement:
	Accumulator-based machines use one primary register(Accumulator) for all arithmetic and logical operations.
Key Characteristics:
	One main register:Accumulator stores first operand and result
	Implicit operations:Most instructions work with the Accumulator
	Simpler design:Fewer registers,simpler instruction set
How It Works:
	Load data into Accumulator
	Perform operation using Accumulator and another operand
	Result stored back in Accumulator

16.Compare stack-based and register-based CPU architectures.

Main Statement:
	Stack-based uses memory stack for operations | Register-based uses CPU registers

Stack-Based Architecture:
	Operations:Work on top stack elements
	Instructions:PUSH,POP,ADD
	Example:5 3 +(push 5,push 3,add)
	Pros:Compact code,simple hardware
	Cons:Slower(memory access),harder to optimize
Register-Based Architecture:
	Operations:Work on specified registers
	Instructions:ADD R1,R2,R3
	Example:ADD R0,R1, R2(R0=R1+R2)
	Pros:Faster(register access),better performance
	Cons:Larger instructions,more complex hardware

17.Describe the phases of the Instruction Cycle (Fetch, Decode, Execute).

The Three Phases:
	Fetch
		PC → MAR: Program Counter sends address to Memory Address Register
		Memory → IR: Instruction fetched from memory into Instruction Register
		PC++: Program Counter increments to next instruction
	Decode
		Interpret:Control Unit decodes the instruction in IR
		Identify:Determines operation and operands needed
		Prepare:Sets up pathways for execution
	Execute
		Perform:ALU executes the actual operation
		Memory Access:Read/write data if needed
		Store Result:Save output to register or memory

18.List the main characteristics of a microprocessor.

Main Statement:
	Key characteristics that define microprocessor performance and capability.
Main Characteristics:
	Clock Speed - Operations per second(Hz,MHz,GHz)
	Word Size - Bits processed at once(8,16,32,64-bit)
	Instruction Set - CISC(complex) vs RISC(reduced)
	Cache Memory - Size and levels(L1,L2,L3)
	Number of Cores - Single-core vs multi-core
	Address Bus Width - Maximum addressable memory
	Data Bus Width - Bits transferred in one cycle
	Power Consumption - Thermal Design Power(TDP)
	Manufacturing Process - Nanometer technology(Exp:7nm,5nm)
Key Performance Factors:
	IPC(Instructions Per Cycle)
	Architecture(pipelining,superscalar)
	Register File Size
	Floating-Point Performance

19.Describe the levels of cache memory(L1,L2,L3) and their role between the CPU and RAM.

Main Statement:
	Cache memory hierarchy:L1(fastest/smallest)→L2→L3(slowest/largest)→RAM
Cache Levels:
	L1 Cache:
		Location:Inside CPU core(closest to ALU)
		Size:32-64 KB per core
		Speed:Fastest(1-4 cycle access)
		Role:Stores most frequently used data/instructions
	L2 Cache:
		Location:Usually per core(sometimes shared)
		Size:256KB-1MB per core
		Speed:Slower than L1(10-20 cycles)
		Role:Secondary cache for recent accesses
	L3 Cache:
		Location:Shared among all cores
		Size:8-32MB+total
		Speed:Slowest cache(20-40 cycles)
		Role:Shared pool for core-to-core data
Memory Hierarchy Speed:
	CPU→L1→L2→L3→RAM→Storage(Fastest & Smallest→Slowest & Largest)

20.List and explain the main differences between RAM and ROM.

Main Statement:
	RAM=Temporary read/write memory | ROM=Permanent read-only memory
Types:
	RAM:DRAM,SRAM,SDRAM
	ROM:Mask ROM,PROM,EPROM,EEPROM,Flash

21.Describe the working principle of a Stack(LIFO) and the instructions used to manage it.

Main Statement:
	Stack=LIFO(Last-In,First-Out) data structure managed with PUSH and POP instructions.
Working Principle:
	LIFO:Last item pushed is first item popped
	Stack Pointer(SP):Register that points to top of stack
	Stack Grows Downward:Memory addresses decrease as stack grows
Core Instructions:
	PUSH(Add to stack):
		Decrement SP
		Copy data to stack location pointed by SP
	POP(Remove from stack):
		Copy data from stack location pointed by SP
		Increment SP
Key Operations:
	Function calls:CALL(pushes return address),RET(pops return address)
	Temporary storage:Save/restore register values
	Parameter passing:Between functions

22.Compare DRAM and SRAM in terms of speed,cost,and structure.

Main Statement:
	SRAM=Fast/expensive | DRAM=Slower/cheap
SRAM(Static RAM):
	Very Fast(CPU cache)
	Expensive(more transistors)
	L1/L2/L3 Cache
	More power(always on)
	Low(large cells)	
	Not needed Refresh
DRAM(Dynamic RAM):
	Slower(Main memory)
	Cheap(simple cells)
	Less power(needs refresh)
	High(small cells)
	Required periodically Refresh
	Main System RAM

23.Explain the difference between address bus and data bus.

Main Statement:
	Address Bus=Where to go | Data Bus=What to transfer
Example:
	CPU reads memory location 0x1000:
		Address Bus:Sends 0x1000
		Data Bus:Returns data from that location
Calculation:
	Address Bus width=32 bits→2³²=4GB addressable memory
	Data Bus width=64 bits→transfers 8 bytes at once

24.What are cache hit and cache miss events in CPU operation?

Main Statement:
	Cache Hit=Data found in cache | Cache Miss=Data not in cache,need RAM
Cache Hit:
	Event:CPU finds requested data in cache memory
	Result:Fast access(1-10 CPU cycles)
	Performance:Optimal - no RAM access needed
Cache Miss:
	Event:CPU doesn't find data in cache
	Result:Slow access(must fetch from RAM=100+ cycles)
	Performance:Penalty - CPU stalls waiting for data
Types of Cache Misses:
	Compulsory Miss:First access to new data
	Capacity Miss:Cache too small for working set
	Conflict Miss:Data mapped to same cache line

25.Describe the memory hierarchy model and arrange its levels in order of access speed.

Main Statement:
	Memory hierarchy organizes storage from fastest/smallest to slowest/largest.
Levels by Access Speed(Fastest to Slowest):
	CPU Registers(1 cycle)
	L1 Cache(2-4 cycles)
	L2 Cache(10-20 cycles)
	L3 Cache(20-40 cycles)
	Main Memory(RAM)(100-300 cycles)
	SSD Storage(10,000-100,000 cycles)
	HDD Storage(1,000,000+ cycles)
	Network/Cloud Storage(Millions of cycles)
Key Principles:
	Faster→Smaller & More Expensive
	Slower→Larger & Cheaper
	Locality of Reference:CPU tries to keep frequently used data in higher levels

26.List the main components on a motherboard and describe the function of each.

Main Statement:
	The motherboard connects all computer components and enables communication between them.
Main Components & Functions:
	CPU Socket
		Holds the processor
		Provides power and data connection to CPU
	Chipset(Northbridge/Southbridge)
		Manages data flow between CPU,RAM,and peripherals
		Northbridge:High-speed connections(CPU,RAM,GPU)
		Southbridge:Slower connections(USB,SATA,audio)
	RAM Slots
		Hold memory modules
		Provide direct connection to CPU for fast data access
	Expansion Slots(PCIe)
		Add functionality(graphics cards,network cards,storage)
		PCIe x16 for graphics,PCIe x1 for other cards
	Storage Connectors(SATA,M.2)
		Connect hard drives and SSDs
		M.2 for NVMe high-speed storage
	Power Connectors
		Distribute power from PSU to components
		24-pin main power,4/8-pin CPU power
	BIOS/UEFI Chip
		Basic Input/Output System
		Initializes hardware during boot process
	Rear I/O Panel
E		xternal ports(USB,Ethernet,audio,video)
		Connection point for peripherals
	Internal Headers
		Front panel connectors(power button,LEDs)
		USB headers,fan connectors
	VRM(Voltage Regulator Module)
		Provides clean stable power to CPU
		Critical for CPU performance and stability

27.Explain the three main types of buses:data,address,and control.

Main Statement:
	Three bus types work together:Data(what),Address(where),Control(how)
1.Data Bus
	Function:Carries actual data between components
	Direction:Bidirectional(CPU↔Memory/I/O)
	Width:Determines word size(8,16,32,64-bit)
	Example:Transfers numbers,instructions,files
2. Address Bus
	Function:Carries memory addresses
	Direction:Unidirectional(CPU→Memory/I/O)
	Width:Determines addressable memory
	Example:"I want data from location 0x1000"
3. Control Bus
	Function:Carries signals and commands
	Direction:Mixed(bidirectional and unidirectional)
	Signals:Read/Write,Interrupt,Clock,Reset
	Example:"Read from memory" or "I/O device ready"

28.Differentiate between serial and parallel ports.

Main Statement:
	Serial=One bit at a time | Parallel=Multiple bits simultaneously
Serial Port:
	One bit at a time
	Fewer wires(2-9)
	Slower per clock
	Lower cost
	USB,Ethernet,SATA
Paralel Port:
	Multiple bits(8+) simultaneously
	Many wires(25-40)
	Faster per clock
	Short distances
	Higher cost
	Largely obsolete
Examples:
	Serial:USB,RS-232,SATA,Ethernet,PCIe
	Parallel:Old printers(LPT),IDE hard drives,SCSI

29.Explain the key difference between PCI and USB interfaces.

PCI=Internal component connection | USB=External peripheral connection

PCI:
	Internal
	Connect internal components
	Expansion slots on motherboard
	No
	Limited
	High bandwidth for performance
	Graphics cards,network cards,storage
USB:
	External
	Connect external peripherals
	External ports
	Yes
	Power + data
	Convenience & versatility
	Keyboards,mice,drives,phones
Modern Evolution:
	PCI→PCIe(faster serial version)
	USB 1.0→USB4(much faster speeds)

30.List the main differences between Von Neumann and Harvard architectures.

Main Statement:
	Von Neumann = Shared memory for instructions & data | Harvard = Separate memories
Von Neumann Architecture:
	Single memory for instructions and data
	Single bus for both instructions and data
	Bottleneck - can't fetch both simultaneously
	Simpler design
	Lower cost
	More flexible memory usage
Harvard Architecture:
	Separate memories for instructions and data
	Separate buses for instructions and data
	Faster - parallel instruction and data access
	More complex design
	Higher cost
	Less flexible
Modern Implementation:
	Pure Von Neumann:Most general-purpose computers
	Modified Harvard:Many modern processors(separate L1 caches)
	Pure Harvard:Microcontrollers(Arduino,PIC,ARM Cortex-M)

31.What does a processor’s Instruction Set Architecture(ISA) define?

Main Statement:
	ISA defines the interface between software and hardware - what the processor can understand and execute.
What ISA Defines:
	Instructions:
		Available operations(ADD,LOAD,STORE,JUMP)
		Instruction formats and encoding
	Data Types:
		Supported data sizes(byte,word,doubleword)
		Integer,floating-point,decimal formats
	Registers:
		Number and purpose of registers
		Register organization and accessibility
	Memory Addressing:
		How instructions access memory
		Addressing modes(immediate,direct,indirect)
	Input/Output:
		How CPU communicates with peripherals
		Memory-mapped vs. port-mapped I/O
	Exception Handling:
		Interrupts and trap mechanisms
		Error and exception management
Key ISA Types:
	CISC(Complex Instruction Set Computer):x86
	RISC(Reduced Instruction Set Computer):ARM,RISC-V

32.Describe the different addressing modes(Immediate,Direct,Indirect,Indexed,Register).

Main Statement:
	Addressing modes define how instructions locate their operands.

Main Addressing Modes:
	Immediate:
		Operand:Constant value within instruction
		Example:MOV AL,5(AL=5)
		Use:Loading constants
	Direct:
		Operand:Memory address specified directly
		Example:MOV AL,[1000h](AL=data at address 1000h)
		Use:Accessing fixed memory locations
	Indirect:
		Operand:Address stored in a register
		Example:MOV AL,[BX](AL=data at address in BX)
		Use:Pointers,array access
	Indexed:
		Operand:Base address+index register
		Example:MOV AL,[SI+100h](AL=data at SI+100h)
		Use:Array processing
	Register:
		Operand:Data in CPU register
		Example:MOV AL,BL(AL=BL)
		Use:Fast data manipulation

33.What is the function of the Control Unit (CU), and how does it interact with other CPU components?

Main Statement:
	The Control Unit(CU) is the CPU's "brain" that directs all operations and coordinates component interactions.

Main Functions:
	Instruction Management
		Fetches instructions from memory
		Decodes instructions to understand what to do
		Executes instructions by activating appropriate components
	Component Coordination
		Controls data flow between registers,ALU,and memory
		Manages timing using the system clock
		Generates control signals for all CPU operations
Interactions with Other Components:
	With Registers: Reads/writes data, manages Program Counter
	With ALU: Sends operation codes, activates arithmetic/logic functions
	With Memory: Sends read/write signals, manages address/data buses
	With I/O Devices: Controls data transfer to peripherals
Control Signals Examples:
	MemoryRead / MemoryWrite
	ALU_Operation(ADD,SUB,AND,OR)
	Register_Load / Register_Enable
Nazrin Aliyeva, [15.11.2025 05:13]
# 25. Explain the difference between address bus and data bus.

The address bus carries memory addresses from the CPU.
It tells the system where to read or write data.
The data bus carries actual data between CPU, memory, and devices.
The address bus is usually one-directional.
The data bus is typically bidirectional.
Both buses are essential for communication.
The width of the address bus determines maximum memory.
The width of the data bus affects how much data is moved at once.
They work together during memory operations.
They form part of the system bus architecture.

---

# 26. What are cache hit and cache miss events in CPU operation?

A cache hit occurs when requested data is found in the cache.
This allows the CPU to access data quickly.
Cache hits improve system performance significantly.
A cache miss occurs when data is not in the cache.
The CPU must then fetch data from RAM.
Fetching from RAM is much slower.
Cache misses decrease performance.
The CPU updates the cache after a miss.
Hit rate is important for CPU efficiency.
Good caching reduces memory access delays.

---

# 27. Describe the memory hierarchy model and arrange its levels in order of access speed.

The memory hierarchy organizes storage by speed and cost.
Faster memory is smaller and more expensive.
Slower memory is larger and cheaper.
At the top are CPU registers.
Below them are L1, L2, and L3 caches.
Next is RAM, which is slower than cache.
After RAM comes secondary storage like SSD or HDD.
At the bottom is tertiary storage such as tape or cloud.
The hierarchy balances speed and capacity.
Data moves between levels depending on usage.

---

# 31. List the main components on a motherboard and describe the function of each.

The motherboard holds all major computer components.
The CPU socket houses the processor.
RAM slots hold memory modules.
The chipset manages communication between CPU, memory, and devices.
Expansion slots support graphics and network cards.
Power connectors deliver electricity to components.
Storage connectors attach SSDs and HDDs.
I/O ports connect external devices.
The BIOS/UEFI chip stores firmware.
All components communicate through the motherboard’s circuits.

---

# 32. Explain the three main types of buses: data, address, and control.

The data bus transfers data between CPU, memory, and devices.
The address bus carries memory addresses for data access.
The control bus sends signals to manage operations.
Each bus has a different role in communication.
The data bus is bidirectional, carrying input and output.
The address bus is usually unidirectional.
The control bus carries read, write, and interrupt signals.
Together they form the system bus.
They ensure coordinated data exchange.
All CPU operations depend on these buses.

---

# 33. Differentiate between serial and parallel ports.

Serial ports send data one bit at a time.
Parallel ports send multiple bits simultaneously.
Serial communication is slower but can cover long distances.
Parallel communication is faster but limited to short distances.
Serial ports are used for modems and older devices.
Parallel ports were often used for printers.
Serial ports require fewer wires.
Parallel ports use many wires in parallel.
Both types allow external device connection.
Their difference is mainly in data transfer method.

---

# 34. Explain the key difference between PCI and USB interfaces.

PCI is an internal hardware interface.
It connects components like graphics cards directly to the motherboard.
USB is an external interface for peripheral devices.
USB supports hot-plugging, PCI does not.
PCI offers higher internal bandwidth.
USB is more flexible and widely used.
PCI devices require installation inside the computer.
USB devices connect easily from outside.
PCI is used for performance-critical tasks.
USB focuses on convenience and compatibility.

---

# 35. List the main differences between Von Neumann and Harvard architectures.

Von Neumann uses one memory for instructions and data.
Harvard uses separate memories for instructions and data.

Nazrin Aliyeva, [15.11.2025 05:13]
Von Neumann may suffer from bottlenecks.
Harvard allows simultaneous access to code and data.
Von Neumann architecture is simpler.
Harvard architecture is faster for embedded systems.
Von Neumann systems use a single bus.
Harvard systems use separate buses.
Both architectures affect CPU design.
Each has advantages depending on application.

---

# 36. What does a processor’s Instruction Set Architecture (ISA) define?

The ISA defines all instructions a CPU can execute.
It specifies instruction formats and opcodes.
It defines available registers and data types.
Addressing modes are also part of the ISA.
The ISA shapes how software communicates with hardware.
Programs must follow the ISA to run on a processor.
Different CPUs may support different ISAs.
ISA affects performance and system design.
It is the interface between hardware and software.
RISC and CISC are two common ISA types.

---

# 37. Describe the different addressing modes (Immediate, Direct, Indirect, Indexed, Register).

Immediate mode uses a constant value inside the instruction.
Direct mode specifies a memory address directly.
Indirect mode uses a register that points to a memory address.
Indexed mode adds an offset to a base address.
Register mode uses values inside CPU registers.
Each mode gives different flexibility for programmers.
Immediate values are fast but limited.
Direct and indirect modes access memory.
Indexed mode is useful for arrays.
Register mode is the fastest for data access.

---

# 38. What is the function of the Control Unit (CU), and how does it interact with other CPU components?

The Control Unit manages and coordinates all CPU operations.
It fetches instructions from memory using the PC.
The CU decodes instructions to understand required actions.
It sends control signals to the ALU, registers, and memory.
The CU ensures data flows correctly through the system.
It controls timing and sequencing of operations.
The CU activates the correct components for each instruction.
It works closely with the ALU during execution.
Without the CU, the CPU would not function correctly.
The CU acts as the brain that directs all processing tasks.
