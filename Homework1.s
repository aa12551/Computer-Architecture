.data
nums:     .word 22,3,9,2,54
numsSize: .word 5
.text

main:
    la a0,nums                 # a0 is the array pointer
    lw a1,numsSize             # a1 is the array size
    addi sp,sp,-4              # create a space
    sw ra,0(sp)                # save the return address to main
    jal sortArrayByParity
    lw ra,0(sp)                # load the return address to main
    addi sp,sp,4               # release the space    
    j exit
    
sortArrayByParity:
    addi t6,t6,0x100           # t6 is the address of head (the return address of array)
    addi s1,s1,4               # s1 is the byte of word
    mul s3,s1,s2               # to get the back address
    add t5,t6,s3               # t5 is the address of back
    add s0,a0,x0               # s0 is a address to access the element of array
    addi t3,t3,1               # 1 is the number to find odd or even
    loop:
        bge t0,a1,done         # t0 : for loop count
        lw t1,0(s0)            # t1 : load the array element
        addi s0,s0,4           # point to the next element in nums array
        and t2,t1,t3           # if t2 = 1, that the number is even
        beq t2,x0,else
        then:                  # if the number is even, run then
            addi t5,t5,-4      # point to the previous element 
            sw t1,0(t5)        # put the even number back of the array
            addi t0,t0,1       # for loop count++
            add t2,x0,x0       # clean the space
            j end
        else:                  # if the number is odd, run else
            sw t1,0(t6)        # put odd number in the back 
            addi t6,t6,4       # point to the next element
            addi t0,t0,1       # for loop count++
            add t2,x0,x0       # clean the space
            j end
        end:
            j loop
    done:
       jr ra
       
exit:
    addi a3,a3,1


    
    
    
    
    
    

    
   