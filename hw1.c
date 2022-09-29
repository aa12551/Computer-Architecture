#include "stdlib.h"
#include "stdio.h"

int *sortArrayByParity(int *nums, int numsSize, int *returnSize)
{
    int *ans = malloc(sizeof(int)*numsSize);
    int *front = ans;
    int *back = ans+numsSize;
    for(int i = 0;i<numsSize;i++)
    {
        if(nums[i] % 2)
        {
            *--back = *(nums+i);
        }
        else
        {
            *front++ = *(nums+i);
        }
    }
    *returnSize = numsSize;
    return ans;
}

int main()
{
    int nums[] = {22,3,9,2,54};
    int numsSize = 5;
    int returnSize = 0;
    int *ans = sortArrayByParity(nums,numsSize,&returnSize);
    printf("[ ");
    for(int i = 0;i<numsSize;i++)
    {
        printf("%d ",ans[i]);
    }
    printf("]");
}