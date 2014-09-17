import java.util.Scanner;


public class Borislav_Stratev_Task3 {

	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);
		int x = scan.nextInt();
		int y = scan.nextInt();
	
		for(int i=x;i <y+1;i++) {
			if((isPrime(i)) && (i%10 == 3)) {
				System.out.println(i);	
			}
		}		
	}
	
	private static boolean isPrime(int number) {
		for(int i=2; i<number; i++){
			if(number%i == 0){
				return false;
			}
		}
		return true;
	}
}
