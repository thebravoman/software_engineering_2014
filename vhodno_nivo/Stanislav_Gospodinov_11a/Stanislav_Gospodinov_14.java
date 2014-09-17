import java.util.Scanner;


public class Stanislav_Gospodinov_14 {

	public static void main(String[] args) {
		int j, i, n = 0, x = 0, sum = 0;
		int[] arr = new int[10];
		Scanner s = new Scanner(System.in);
		while(x <= 0 || x >= 10 ){
			x = s.nextInt();			
		}
		for(i = 0; i < arr.length; n++){
			sum = 0;
			if(n % x == 0){
				for(j = 0; j <= n; j++){
					sum += j;
				}
				arr[i] = sum;
				i++;
			}
		}
		for(i = 0; i < arr.length; i++){
			System.out.println(arr[i]);
		}
	}

}