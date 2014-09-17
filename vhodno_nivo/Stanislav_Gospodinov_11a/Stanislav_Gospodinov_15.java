import java.util.Scanner;

public class Stanislav_Gospodinov_15 {

	public static void main(String[] args) {
		int[] arr = new int[10];
		int i, j = 0, x = 0, sum;
		Scanner s = new Scanner(System.in);
		while(x <= 0 || x >= 10 ){
			x = s.nextInt();			
		}
		for(i = 0; i < arr.length; i++){
			sum = 0;
			j = 0;
			while(j < 1000 ){
				if (j % (x*(i+1)) == 0){
					sum += j;
				}
				j++;
			}
			arr[i] = sum;
			System.out.println(arr[i]);
		}
		
	}

}
