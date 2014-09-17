import java.util.Scanner;
import java.lang.Math;

public class Lubomir_Yankov_9
{

	public static void main(String [] args)
	{
	
		Scanner input = new Scanner (System.in);
		
		int x, i, b, v = 0;
		
		double[] a = new double[10];
		
		double k, m;
		
		System.out.print("Enter x: ");
		
		x = input.nextInt();
		
		while ((x < 0) || (x >= 10))
		{
		
			System.out.print("Enter x (0<=x<10): ");
			
			x = input.nextInt();
		
		}
	
		for (i = 0; i <= 9; i++)
		{
		
			k = Math.cos(i+1);
			
			m = k*1000;
			
			b = (int)m;
			
			//System.out.println()
			
			if (Math.abs(b) % 10 == x)
			{
				
				a[v] = k;
				v++;
			
			}

		}
	
		for (i = 0; i < v; i++)
		{
		
			System.out.println(a[i]);
		
		}
	
	}

}