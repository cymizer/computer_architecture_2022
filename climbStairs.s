.data
mem: .word 1,2,0,0,0 #5
	.word 0,0,0,0,0
	.word 0,0,0,0,0 #10
	.word 0,0,0,0,0
	.word 0,0,0,0,0 #15
	.word 0,0,0,0,0
	.word 0,0,0,0,0
	.word 0,0,0,0,0
	.word 0,0,0,0,0
test_case: .word 3,2,4,25
i: .word 0
res: .word 0

space:      .byte 32
newline:    .byte 10

res_str: .string "res : "
.text
#int climbStairs(int);
#
# int main () 
# {
#    int test_case[4] = {1, 2, 4, 25};
#    int i,result = 0;
#    for (int i =0; i < 4; i++) {
#         result = climbStairs(test_case[i]);
#         printf("result : %d\n", result);
#     }
#     return 0;
# }
#
# int climbStairs(int n){
#     int mem[45], i;
#     mem[0] = 1;
#     mem[1] = 2;
#     for( i = 2; i < n; i++) 
#        mem[i] = mem[i-2] + mem[i-1];
#     return mem[n-1];
# }

# s0 : test_case base addr , s1: res , s2: i 
main:
    la s0, test_case # test_case arr
    lw s1, res       # res = 0
    lw s2, i         # i =0
    addi s3, zero,4
    loop:
        bge s2, s3, loop_end
        lw a0, 0(s0)
        jal climbStairs
        mv s1, a0
        la a0, res_str
        lw a0 0(a0)
        li a7, 4 # print string
        ecall
        mv a0, s1
        li a7, 1 # print integer
        ecall
        la a0, newline #print newline
        lbu a0, 0(a0)
        li a7, 11
        ecall
        addi s2, s2, 1
        addi s0 , s0, 4
        j loop
    loop_end:
	li     a0, 0            # return 0
    li     a7, 10           # Exit code
    ecall

# t0 : mem base addr , t1: mem[i-2] ,t2: mem[i-1] ,t3: mem[i]
climbStairs:
    la t0, mem
    addi t1, t0, 0
    li t2,1
    sw t2,0(t1)
    addi t2, t0, 4
    li t3,2
    sw t3, 0(t2)
    mv t3, zero
    addi t3, t0, 8
    li t4, 2

    climb_loop:
        bge t4, a0, climb_loop_end  #

        # mem[i] = mem[i-2] + mem[i-1];
        lw t5, 0(t1)          # load mem[i-2]
        addi t6, t5, 0
        lw t5, 0(t2)          # load mem[i-1]
        add t6, t6, t5
        sw t6, 0(t3)          # store val into mem[i]
        mv t6, zero           # init 

        # rotate
        mv t1, t2
        mv t2, t3
        addi t3, t3, 4
        
        addi t4, t4, 1
        j climb_loop
        
    climb_loop_end:
    slli t4, a0, 2
    addi t4, t4 , -4
    add t4, t4, t0 # base addr + offset = mem[n-1]
    lw a0, 0(t4)
    mv t4, zero
    #li a7, 1 # print integer
    #ecall
    #la a0, newline #print newline
    #lbu a0, 0(a0)
    #li a7, 11
    #ecall
    ret

Clear: