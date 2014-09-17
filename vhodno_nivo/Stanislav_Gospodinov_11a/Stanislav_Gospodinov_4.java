import java.util.Scanner;


public class Stanislav_Gospodinov_4 {
	
	static void fib(int[] arr){
		 arr[0] = 0;
         arr[1] = 1;
         for(int p=2; p < arr.length; p++){
        	 arr[p] = arr[p-1] + arr[p-2];
         }
		
	}
	
	public static void main(String[] args) {
		int[] arr = new int[10];
		fib(arr);
		int x, y, j, i;
		Scanner s = new Scanner(System.in);
		x = s.nextInt();
		do{
			y = s.nextInt();
		}while(y < x);
		for(j = x; j < y; j++){
			for(i = 0; i < arr.length; i++){
				if(j == arr[i]){
					System.out.println(j);
				}
			}
		}
	}

}
