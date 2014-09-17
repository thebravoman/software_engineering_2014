import java.util.Scanner;

public class Lubomir_Yankov_18
{

	public static void main (String [] args)
	{
	
		Scanner input = new Scanner (System.in);
		
		int[] a = new int[10];

		int x, n = 1, i = 0, k = 0;
		
		System.out.print("Enter x: ");
		
		x = input.nextInt();
		
		while (n <= x)
		{
		
			if ((x % n == 0) && (n % 2 != 0))
			{
			
				a[k] = n;
				
				//System.out.println(a[k]);
				
				k++;
				
			}
		
			n++;
			
		}
		
		for (i = 0; i < k; i++)
		{
		
			System.out.println(a[i]);
		
		}
		
	}

}