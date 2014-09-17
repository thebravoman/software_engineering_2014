import java.util.Scanner;


public class Stanislav_Gospodinov_18 {
	
	public static boolean isSimple(int n){
		int count, i = 0;
		for(count=1; count <= n; count++){
			if( n % count == 0){
				i++;
			}			
		}
		if (i>2){
			return false;
		}else{
			return true;
		}
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int x = 0, i = 1, j = 0;
		int[] arr = new int[10];
		Scanner s = new Scanner(System.in);
		while(x <= 0){
			x = s.nextInt();
		}
		while(i <= x){
			if(i % 2 != 0 && x % i == 0){
				arr[j] = i;
				j++;
				if(j>arr.length){
					break;
				}
			}
			i++;
		}
		for(j = 0; j < arr.length; j++){
			if(arr[j] == 0){
				break;
			}
			if(isSimple(arr[j]) == true){
				System.out.println(arr[j]+" prosto");
			}else{
				System.out.println(arr[j]);
			}
		}
	}

}
