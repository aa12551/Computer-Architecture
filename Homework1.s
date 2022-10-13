.data
nums1:     .word 22,3,9,2,54
nums2:     .word 18,7,69,32,5,8,2
nums3:     .word 3,2,5
numsSize1: .word 5
numsSize2: .word 7
numsSize3: .word 3
returnpointer: .word 0x100
.text

main:
    la a0,nums3                 # a0 is the array pointer
    lw a1,numsSize3             # a1 is the array size
    jal sortArrayByParity   
    li t0,0                     # clean the register
    mv t1,a1                    # a1 is the array size
    mv t2,a0                    # a0 is the array pointer which is sort by parity 
print_loop:
    bge t0,t1,exit              # if print all of the element, exit
    lw a0,0(t2)                 # load the array element
    jal printf                  # print a0 to console
    addi t0,t0,1                # print loop count++
    addi t2,t2,4                # point to next element
    j print_loop
sortArrayByParity:
    mv s1,a0                    # save s1 the array pointer
    mv s2,a1                    # save s2 the array size
    lw a0,returnpointer         # a0 is the address of head (the return address of array)
    slli t0,s2,2                # array size * sizeof(int)
    add t1,a0,t0                # t1 is the address of back
    mv t0,a0                    # t0 is the address of head
loop:
    bge t3,s2,done              # t3 : for loop count
    lw t4,0(s1)                 # t4 : load the array element
    addi s1,s1,4                # point to the next element in nums array
    andi t2,t4,1                # if t2 = 1, that the number is even
    beq t2,x0,else
then:                           # if the number is odd, run then
    addi t1,t1,-4               # point to the previous element 
    sw t4,0(t1)                 # put the even number head of the array
    j end
else:                           # if the number is odd, run else
    sw t4,0(t0)                 # put even number in the head 
    addi t0,t0,4                # point to the next element
end:
    add t2,x0,x0                # clean the space
    addi t3,t3,1                # for loop count++
    j loop                      
done:
    jr ra
printf:
    li a7,1             # print int
    ecall
    li a0, 9            # tab
    li a7, 11           # print char
    ecall
    jr ra
exit:
    li a7, 10           # end the program
    ecall


    
    
    
    
    
    

    
   