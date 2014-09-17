import java.util.Arrays;
import java.util.Scanner;


public class Problem18 {

	public Problem18() {
		int x = acceptInput();
		int[] oddFactors = getFirstTenOddFactors(x);
		System.out.println(Arrays.toString(oddFactors));
		System.out.println("The prime numbers in the list of odd factors are: " 
					+ Arrays.toString(primesInArray(oddFactors)));
	}
	
	private int acceptInput() {
		Scanner consoleInput = new Scanner(System.in);
		String inputLine;
		int x;
		
		while(true) {
			inputLine = consoleInput.next();
			try {
				x = Integer.parseInt(inputLine);
				if(x >= 0) {
					break;
				} else {
					System.out.println("The input number must be greater than or equal to zero!");
				}
			} catch(NumberFormatException e) {
				System.out.println("You did not enter a valid number!");
			}
			
		}
		
		consoleInput.close();
		
		return x;
	}
	
	private int[] getFirstTenOddFactors(int x) {
		
		int[] factors = new int[10];
		int cur = 0;
		factors[cur++] = 1;
		for(int i = 2; i <= x; ++i) {
			if(x % i == 0 && i % 2 != 0) {
				factors[cur++] = i;
				if(cur >= 10) {
					break;
				}
			}
		}
		
		if(cur < 9) {
			System.out.println("There are no ten odd divisors of " + x);
		}
		
		return factors;
	}
	
	private int[] primesInArray(int[] arr) {
		int[] primesInArray = new int[10];
		int count = 0;
		for(int i = 0; i < arr.length; ++i) {
			if(arr[i] == 0) {
				break;
			}
			if(isPrime(arr[i])) {
				primesInArray[count++] = arr[i];
			}
		}
		return Arrays.copyOfRange(primesInArray, 0, count);
	}
	
	private boolean isPrime(int num) {
		boolean flag = true;
		for(int i = 2; i <= Math.sqrt(num); ++i) {
			if(num % i == 0) {
				flag = false;
				break;
			}
		}
		return flag;
	}
	
	public static void main(String[] args) {
		new Problem18();
	}
	
}
