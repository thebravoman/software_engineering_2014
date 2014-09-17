import java.util.Scanner;

public class Lubomir_Yankov_4
{

	public static void main (String [] args)
	{
	
		Scanner input = new Scanner (System.in);
		
		int x, y, i, k, tek = 0, pred = 1, popred = 0;
		
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
			if (tek <= y)
			{
				if (tek >= x)
				{
					System.out.println(tek);
				}
			}
			tek = pred + popred;
			popred = pred;
			pred = tek;
		}
	
}
}
