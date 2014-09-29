import java.util.Arrays;
import java.util.Scanner;


public class Problem14 {

	public Problem14() {
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
		int N = 0;
		int curIndex = 0;
		int[] arr = new int[10];
		while(curIndex < 10) {
			N++;
			if(N % x == 0) {
				int sum = 0;
				for(int i = 1; i <= N; ++i) {
					sum += i;
				}
				arr[curIndex++] = sum;
			}
		}
		return arr;
	}
	
	public static void main(String[] args) {
		new Problem14();
	}
	
}
