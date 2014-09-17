import java.util.Scanner;


public class Ivo_Stratev_Task16 {

	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);
		int x = scan.nextInt();
		int arry[];
		
		int j = 0;
		arry = new int[10];
		for(int i=0;;i++) {
			if(j > 9) break;
			if((isPrime(i)) && (i%10 == x)) {
				arry[j] = i;
				System.out.println(arry[j]);
				j++;	
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
			
