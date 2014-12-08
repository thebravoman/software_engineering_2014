#include <stdio.h>

int main(void) {
	
	int x, y, i = 0,prev, mid, next;
	
	scanf("%d %d", &x, &y);
	
	while(next < y)
   {
      if ( i <= 1 )
         prev = i;
      else
      {
         next = prev + mid;
         prev = mid;
         mid = next;
      }

      if(next >= x)
      	printf("%d\n",prev);
      	i++;
   }
	
	
	return 0;
}
