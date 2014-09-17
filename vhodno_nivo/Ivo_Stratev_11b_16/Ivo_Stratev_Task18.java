import java.util.Scanner;


public class Ivo_Stratev_Task18 {

	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);
		long x = scan.nextLong();
		long arry[];
		
		int j = 0;
		arry = new long[10];
		for(long i=1;;i+=2) {
			if(j > 9) break;
			if((i%2 == 1) && (x%i == 0)) {
				arry[j] = i;
				System.out.println(arry[j]);
				j++;	
			}
		}
		
		System.out.println("Prime numbers: ");
		for(j=0;j<10;j++) {
			if(isPrime(arry[j]))
				System.out.println(arry[j]);	
		}		
	}
	
	private static boolean isPrime(long number) {
		for(long i=2; i<number; i++){
			if(number%i == 0){
				return false;
			}
		}
		return true;
	}
}
