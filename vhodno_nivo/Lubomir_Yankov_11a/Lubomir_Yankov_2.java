import java.util.Scanner;

public class Lubomir_Yankov_2
{

	public static void main (String [] args)
		{
		
		Scanner input = new Scanner (System.in);
		
		int x, y, i, sum = 0;
		
		System.out.print("Enter x: ");
		
		x = input.nextInt();
		
		System.out.print("Enter y: ");
		
		y = input.nextInt();
		
		while (x > y)
		{
		System.out.print("Enter y lower than x: ");
		
		y = input.nextInt();
		}
		
		for(i = x; i<=y; i++)
		{
		if (i%17 == 0) 
		{
			sum = sum + i;
		}
		}
		
		System.out.println("The sum is: " +sum);
		
		}

}