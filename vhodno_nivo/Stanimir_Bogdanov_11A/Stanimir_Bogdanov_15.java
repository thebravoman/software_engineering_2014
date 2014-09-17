import java.util.Arrays;
import java.util.Scanner;


public class Problem15 {

	public Problem15() {
		int x = acceptInput();
		System.out.println(Arrays.toString(getSums(x)));
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
					break;
				} else {
					System.out.println("The input number must be in the range (0;10)");
				}
			} catch(NumberFormatException e) {
				System.out.println("You did not enter a valid number!");
			}
			
		}
		
		consoleInput.close();
		
		return x;
	}
	
	private int[] getSums(int x) {
		int[] arr = new int[10];
		
		for(int N = 0; N < 10; ++N) {
			int sum = 0;
			for(int k = 0; k < 1000; ++k) {
				if((k % ((N+1)*x)) == 0) {
					sum += k;
				}
			}
			arr[N] = sum;
		}
		
		return arr;
	}
	
	public static void main(String[] args) {
		new Problem15();
	}
	
}
