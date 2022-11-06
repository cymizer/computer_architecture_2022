#include <stdio.h>
/**  70. Climbing Stairs
 * You are climbing a staircase. It takes n steps to reach the top.
 * Each time you can either climb 1 or 2 steps.
 * In how many distinct ways can you climb to the top? 
 */

int climbStairs(int);

int main () 
{
    int test_case[4] = {1, 2, 4, 25};
    int i,res = 0;
    for (int i =0; i < 4; i++) {
        res = climbStairs(test_case[i]);
        printf("res : %d\n", res);
    }
    return 0;
}

int climbStairs(int n){
    int mem[45], i;
    mem[0] = 1;
    mem[1] = 2;
    for( i = 2; i < n; i++) 
        mem[i] = mem[i-2] + mem[i-1];
    return mem[n-1];
}