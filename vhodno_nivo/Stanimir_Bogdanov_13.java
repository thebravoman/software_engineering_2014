import java.util.Arrays;
import java.util.Scanner;


public class Problem13 {

	public Problem13() {
		int x = acceptInput();
		System.out.println(Arrays.toString(sumsOfCosZ(x)));
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
	
	private double[] sumsOfCosZ(int x) {
		double[] arr = new double[10];
		
		for(int N = 0; N < 10; ++N) {
			double sumOfCosZ = 0;
			for(int z = N*x; z < (N+1)*x; ++z) {
				sumOfCosZ += Math.cos(z);
			}
			arr[N] = sumOfCosZ;
		}
		
		return arr;
	}
	
	public static void main(String[] args) {
		new Problem13();
	}
	
}
