import java.util.Scanner;

public class Simeon_Shopkin_11 {

	public static void main(String[] args) {

		float x;
		Scanner in = new Scanner(System.in);
		System.out.println("Input X between 0 and 1");
		x = in.nextFloat();

		float N;
		float p = 4;
		int br = 0;

		if ((x > 0) && (x < 1)) {
			for (N = 3; (4 / N) >= x; N=N+2){				
				br+=1;
				if(br%2 == 0){
					p = p + (4 / N);
				} else if(br%2!=0){					
					p = p - (4/N);					
				}				
			}

				System.out.println(p);

		} else {
			System.out.println("Error in X");
		}

	}
}
