import java.util.Scanner;
import java.util.Random;

public class Lubomir_Yankov_6
{

	public static void main (String [] args)
	{
	
		Scanner input = new Scanner (System.in);
		
		Random r = new Random ();
		
		int[] a = new int[100];
		
		int x, i, k, m;
		
		System.out.print("Enter x: ");
		
		x = input.nextInt();
		
		for (i = 0; i < 100; i++)
		{
		
			a[i] = r.nextInt(100);
			
			System.out.println(a[i]);
			
		}
	
		for (i = 0; i < 100; i++)
		{
			
			for (k = (i + 1); k < 100; k++)
			{
			
				if (a[i] % 10 == x)
				{
				
					m = a[i];
					a[i] = a[k];
					a[k] = m;
				
				}
			
			}
			
		}
	
		System.out.println("The sorted array is: ");
		
		for (i = 99; i > 0; i--)
		{
		
			System.out.println(a[i]);
		
		}
	
	}

}