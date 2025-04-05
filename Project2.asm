# A verilog project for ECE 366

# Nathan Sopt, Jesus Garcia, Declan Hurless, and Ephren Manning

# March 24, 2025

# ----------------------------------------------- Project description / Guidelines -------------------------------------------

# Problem 1 (Designing a Factorial Function).

# In this problem set, we will design a MIPS program that will compute if the nth Fibonacci number is an odd number, i.e., IsFibonacciOdd(n). 

# If we apply a simple chain-of-thought, the key functions that we need to design are:

# (a) design a function Fibonacci(n) to compute n h Fibonacci number, 
# (b) design a function IsOdd(m) to compute if a number m is odd, i.e., when m is divided by 2, the remainder is 1
# (c) design a top level function that will first compute n th Fibonacci number and then use the computed number to check if it is odd.

# (a) Design a MIPS program that will implement Fibonacci(n) of Figure 1. [Points : 50]

# (b) Design a MIPS program that will implement Odd(m) of Figure 2 (AKA The odd number computation part). 
# Please use division by repeated subtraction to implement m%2 (reads m modulo 2 and computes the remainder of
# the division m/2). Usage of MIPS DIV instruction will yield a zero (0) point. 
# Use the function of Figure 3 to implement the division by subtraction. 
# [Points : 20]

# (c) Design a MIPS Program IsFibonacciOdd(n) using the programs from Part (a) and Part (b).
# [Points : 30]

# You can use any number of registers for computation. Assume that the number ’n’ is stored in
# memory. Retrieve it, do the computation and store the result in a different memory location. The
# result should be a ‘1’ if True and ‘0’ if False.

# ----------------------------------------------- Code for project -------------------------------------------

# Pseudo-code of Fibonacci computation: (PART A)

# def fibonacci(n)

#     if n<=1 1:
#         return n
#     a = 0
#     b = 0
    
#     for i in range (n-1)
#         temp = b		
#         b = a + b 
#         a = temp
#     return b


# START WRITING YOUR ASSEMBLY CODE HERE:

#Result stored in $t7!

.data
    n: .word 11         # Change this value to compute Fibonacci(n)

.text
    main:
        # Load n from memory
        LW   $t0, n($zero)  # t0 = n

        # Base cases
        BLEZ $t0, store_zero
        ADDI $t1, $zero, 0   # a = 0
        ADDI $t2, $zero, 1   # b = 1

        # Check if n == 1
        BEQ  $t0, $t2, store_one    # If n == 1, store 1

        ADDI $t3, $t0, -1    # t3 = n - 1 (loop counter)
    
    loop:
        BEQ  $t3, $zero, done  # if counter == 0, exit loop

        ADD  $t4, $t1, $t2   # temp = a + b
        ADD  $t1, $t2, $zero # a = b
        ADD  $t2, $t4, $zero # b = temp

        ADDI $t3, $t3, -1    # decrement counter
        BEQ  $zero, $zero, loop

    done:
        # Store result in register $t10
        ADD  $t7, $t2, $zero
        BEQ  $zero, $zero, end

    store_zero:
        ADD  $t7, $zero, $zero  # Store 0 in $t10
        BEQ  $zero, $zero, end

    store_one:
        ADDI $t7, $zero, 1  # Store 1 in $t10
        BEQ  $zero, $zero, end

    end:
	nop

#------------------------------------------------------------------------------------------------------------

# Pseudo-code of Odd number computation: (PART B)

# def odd(m)

#   remainder = 0
#   remainder = division(m,2)
#   if remainder == 0
#       return true
#   else
#       reutrn false

# Pseudo-code of division by subtraction: (PART B)

# def division(x,y): 
#   quotient = 0 
#   while x > y:
#       # Repeat subtractions
#       x=x−y
#       quotient = quotient + 1 # update count of subtractions 
# return x


# START WRITING YOUR ASSEMBLY CODE HERE:

.data
    m:  .word 11    # Static value for m, change this value to whatever you want

.text
    main:
        LW $t0, m($zero)    # Load the value of m into $t0

        # Call the division by subtraction function from below:
        MOVE $a0, $t0   # x = m
        LI   $a1, 2     # y = 2
        JAL  division   # result (remainder) returned in $v0

        # Store the result (1 for odd, 0 for even) in $t4

        # Check if remainder is 0 or 1
        BEQ $v0, $zero, even    # If remainder is 0, it's even

    odd:
        LI $t4, 1   # Store 1 in $t4 (Odd number)
        J end   # Jump straight to the end of the program if the number is odd

    even:
        LI $t4, 0   # Store 0 in $t4 (Even number)

    end:
        # $t4 should now hold the resulting value
        nop                

    # --------------------------------------------------------------------------------

    # This next part is for doing division by subtraction: division(x, y)

    # --------------------------------------------------------------------------------

    # Input:  
    #   $a0 = x
    #   $a1 = y

    # Output:
    #   $v0 = x % y (remainder)

    division:
        MOVE $t1, $a0   # x gets stored into $t1
        MOVE $t2, $a1   # y gets stored into $t2

    division_loop:
        BLT $t1, $t2, division_completed  # if x < y, stop loop
        SUB $t1, $t1, $t2                 # x = x - y
        J division_loop                   # Keep looping the division loop until division is done

    division_completed:
        MOVE $v0, $t1   # remainder = x
        JR $ra          # Return back to where the division function was first called

#------------------------------------------------------------------------------------------------------------

# Pseudo-code of Division by repeated subtractions (DRS) (PART C)

# def division(x,y):
#   quotient = 0
#   while X > y:
#       repeat subtractions:
#       x = x - y
#       quotient - quotient + 1 (update the number of subtractions)
#   return x


# START WRITING YOUR ASSEMBLY CODE HERE:



#------------------------------------------------------------------------------------------------------------