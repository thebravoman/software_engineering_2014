import java.util.Scanner;
class Rand_Arr_Problem6 {
	public static void main (String[] args) {
		Scanner input = new Scanner (System.in);
		int x = input.nextInt();
		int curr_el = 0, temp = 0;
		if(x>9 || x<0){
			return;
		}
		int[] rand_arr = new int [100];
		for(int i=0; i<100; i++){
			rand_arr[i] = (int)(Math.random()*100);
		}
		for(int i=0; i<100; i++){
			if(rand_arr[i]%10==x){
				temp = rand_arr[curr_el];
				rand_arr[curr_el] = rand_arr[i];
				rand_arr[i] = temp;
				curr_el++;
			}
		}
		for(int i=0;i<100; i++){
			System.out.print(rand_arr[i]);
			System.out.print(" ");
		}
	}
}
