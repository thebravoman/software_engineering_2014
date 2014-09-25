import java.util.Scanner;
class Two_Arr_Problem7 {
	public static void main (String[] args) {
		Scanner input = new Scanner (System.in);
		int x = input.nextInt();
		if(x>100 || x<0){
			return;
		}
		int [] first_arr = new int [10];
		int [] sec_arr = new int [5];
		for(int i=0; i<10; i++){
			first_arr[i] = (int)(Math.random()*x);
		}
		for(int i=1; i<9; i+=2){
			sec_arr[((i+1)/2)] = first_arr[i];
		}
		for(int i=0; i<5; i++){
			System.out.print(sec_arr[i]);
			if(i+1<5){
				System.out.print(" ");
			}
		}
	}
}
