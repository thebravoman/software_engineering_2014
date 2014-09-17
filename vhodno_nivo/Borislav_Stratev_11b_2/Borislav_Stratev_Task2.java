import java.util.Scanner;


public class Borislav_Stratev_Task2 {

	public static void main(String[] args) {
	
		Scanner scan = new Scanner(System.in);
		int x = scan.nextInt();
		int y = scan.nextInt();
		
		int sum = 0;
		for(int i=x;i<y+1;i++){
			if (i%17==0)
				sum = sum +i;
		}
		
		System.out.println(sum);
	}
}
