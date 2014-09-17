import java.util.Scanner;
import java.util.Random;

public class Lubomir_Yankov_8
{

	public static void main (String [] args)
	{
		
		Scanner input = new Scanner (System.in);

		Random r = new Random ();
		
		int x, i, k = 0;
		
		int[] a = new int[10];

		int[] b = new int[10];
		
		System.out.print("Enter x: ");
		
		x = input.nextInt();
	
		while ((x <= 0) || (x >= 100))
		{
		
			System.out.print("Enter x (0<x<100): ");
			
			x = input.nextInt();
		
		}
		
		for (i = 0; i < 10; i++)
		{
		
			a[i] = r.nextInt(x) +x;
		
		}
		
		for (i = 0; i < 10; i++)
		{
		
			if(a[i] % 2 != 0)
			{
			
				b[k] = a[i]; 
				
				k++;
			}
			
		}
		
		System.out.println("The new array is: ");
		
		for (i = 0; i < k; i++)
		{
		
			System.out.println(b[i]);
		
		}
		
	}

}