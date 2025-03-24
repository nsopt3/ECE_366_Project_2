# A verilog project for ECE 366

# Nathan Sopt, Jesus Garcia, Declan Hurless, and Ephren Manning

# March 24, 2025

# ----------------------------------------------- Project description / Guidelines -------------------------------------------

# Problem 1 (Designing a Factorial Function).

# In this problem set, we will design a MIPS program that will compute if the nth Fibonacci number is an odd number, i.e., IsFibonacciOdd(n). 

# If we apply a simple chain-of-thought, the key functions that we need to design are:

# (i) design a function Fibonacci(n) to compute n h Fibonacci number, 
# (ii) design a function IsOdd(m) to compute if a number m is odd, i.e., when m is divided by 2, the remainder is 1
# (iii) design a top level function that will first compute n th Fibonacci number and then use the computed number to check if it is odd.

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



#------------------------------------------------------------------------------------------------------------

# Pseudo-code of Odd number computation: (PART B)

# def odd(m)

#   remainder = 0
#   remainder = division(m,2)
#   if remainder == 0
#       return true
#   else
#       reutrn false


# START WRITING YOUR ASSEMBLY CODE HERE:



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