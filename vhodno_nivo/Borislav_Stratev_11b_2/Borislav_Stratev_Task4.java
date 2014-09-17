import java.util.Scanner;
 
public class Borislav_Stratev_Task4 {
	
	public static void main(String args[]) {
		
		Scanner scan = new Scanner(System.in);
		int x = scan.nextInt();
		int y = scan.nextInt();
		
		int a = x;
		int b = 1;
		int z = 0;
		
		z = x;
		
		while(z <= y) {
						
			int temp = a;
			a = b;
			b = z;
			
			System.out.println(z);
			
			z = a + b;
		}
	}
}
