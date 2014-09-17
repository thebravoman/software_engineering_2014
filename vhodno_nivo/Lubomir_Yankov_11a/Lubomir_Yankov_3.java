import java.util.Scanner;

public class Lubomir_Yankov_3
{

	public static void main (String [] args)
	{
	
		Scanner input = new Scanner (System.in);
		
		int x, y, i;
		
		System.out.print("Enter x: ");
		
		x = input.nextInt();
		
		System.out.print("Enter y: ");
		
		y = input.nextInt();
		
		while (x > y)
		{
		
			System.out.print("Enter y lower than x: ");
			
			y = input.nextInt();
		
		}
		
		for (i = x; i <= y; i++)
		{
		
			if ((i % i == 0)&&(i % 1 == 0))
			{
				if(i % 10 == 3)
				{
					System.out.println(i);
				}
			}
		
		}
	
	}

}