import java.util.Scanner;

public class Lubomir_Yankov_14
{

	public static void main (String [] args)
	{
	
		Scanner input = new Scanner (System.in);

		int n = 1, x, count = 0, v = 0, sum = 0, i = 0;
		
		int[] a = new int[10];
		
		boolean s = true;
		
		System.out.print("Enter x: ");
		
		x = input.nextInt();
		
		while ((x <= 0) && (x >= 10))
		{
			
			System.out.print("Enter x (0<x<10): ");
			
			x = input.nextInt();
			
		}
	
		while (s)
		{
		
			if (n % x == 0)
			{
				for (i = 0; i <= n; i++)
				{
					sum = sum + i;
				}
				a[v] = sum;
				v++;
				count++;
				sum = 0;
			}
		
			n++;
			
			if (count == 10)
			{
			
				s = false;
			
			}
		
		}
	
		for (v = 0; v <10; v++)
		{
		
			System.out.println(a[v]);
		
		}
	
	}

}