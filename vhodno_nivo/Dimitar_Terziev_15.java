import java.util.Scanner;
class Sum_Arr2_Problem15 {
	public static void main (String[] args) {
		Scanner input = new Scanner (System.in);
		int x = input.nextInt();
		int curr_mul=0;
		if(x<0 || x>9){
			return;
		}
		long [] sum_arr = new long[10];
		for(int i=0; i<10; i++){
			sum_arr[i]=0;
		}
		for(int i=0;i<10; i++){
			curr_mul=0;
			while(curr_mul<1000){
				sum_arr[i]+=curr_mul;
				curr_mul+=(x*(i+1));
			}
		}
		for(int i=0; i<10; i++){
			System.out.print(sum_arr[i]);
			if(i+1<10){
				System.out.print(" ");
			}
		}
	}
}

