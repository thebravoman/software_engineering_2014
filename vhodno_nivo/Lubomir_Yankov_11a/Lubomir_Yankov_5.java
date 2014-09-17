import java.util.Scanner;
import java.lang.Math;

public class Lubomir_Yankov_5
{

	public static void main (String [] args)
	{
		
		Scanner input = new Scanner (System.in);
		
		int x, i, k;
		
		double m;
		
		System.out.print("Enter x: ");
		
		x = input.nextInt();
		
		double[] a = new double[x];
		
		for (i = 0; i < x; i++)
		{
		
			a[i] = Math.cos(i);
			System.out.println(a[i]);
	
		}
		
		for (i = 0; i < x-1; i++)
		{
			
			for (k = (i + 1); k < x; k++)
			{
			
				if (a[i]<a[k])
				{
					m = a[i];
					a[i] = a[k];
					a[k] = m;
				}
			
			}
			
		}
		
		System.out.println("The sorted array is: ");
		
		for (i = 0; i < x; i++)
		{
		
			System.out.println(a[i]);
		
		}
		
		
	}

}