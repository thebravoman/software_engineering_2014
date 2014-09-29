import java.util.Arrays;
import java.util.Scanner;


public class Problem16 {

	public Problem16() {
		int x = acceptInput();
		int[] firstNPrimes = findFirstNPrimes(x);
		System.out.println(Arrays.toString(firstNPrimes));
	}
	
	private int acceptInput() {
		Scanner consoleInput = new Scanner(System.in);
		String inputLine;
		int x;
		
		while(true) {
			inputLine = consoleInput.next();
			try {
				x = Integer.parseInt(inputLine);
				if(x > 0 && x < 10) {
					if(x % 2 == 0 || x == 5) {
						System.out.println("There are no prime numbers that are multiples ");
						System.out.println("of 5 or even (apart from 2)");
					} else
						break;
				} else {
					System.out.println("The input number must be in the range (0;10)!");
				}
			} catch(NumberFormatException e) {
				System.out.println("You did not enter a valid number!");
			}
			
		}
		
		consoleInput.close();
		
		return x;
	}
	
	private int[] findFirstNPrimes(int x) {
		int curNum = 2;
		int curIndex = 0;
		int[] primes = new int[10];
		while(curIndex < 10) {
			if(isPrime(curNum) && (curNum % 10) == x) {
				primes[curIndex++] = curNum;
			}
			++curNum;
		}
		return primes;
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
		new Problem16();
	}
	
}
