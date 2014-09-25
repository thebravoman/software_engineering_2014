import java.util.Scanner;

public class Simeon_Shopkin_2 {

	public static void main(String[] args) {
		
		Scanner in = new Scanner(System.in);
		System.out.println("Input X");
		int x = in.nextInt();
		System.out.println("Input Y");
		int y = in.nextInt();
		int sum=0;
		
		if (x<y){
			
			while(x<y){
				if (x % 17 == 0){
					sum= sum + x;
				}
				x++;
			}
			
			System.out.println(sum);

		}else {
			System.out.println("X is smaller than Y");
		}		

}
}
