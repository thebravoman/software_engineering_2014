import java.util.Scanner;
class Cos_Dig_Problem9 {
	public static void main (String[] args) {
		Scanner input = new Scanner (System.in);
		double [] cos_arr = new double [10];
		double curr_coss;
		int x = input.nextInt();
		int l=0,curr_cos=0;
		while(l<9){
			curr_cos++;
			curr_coss = Math.cos(curr_cos);
			curr_coss*=1000;
			if((int)(curr_coss)%10==x){
				cos_arr[l]=(curr_coss/1000);
				l++;
			}
		}
		for(int i = 0; i<10; i++){
			System.out.print(cos_arr[i]);
			if(i+1<10){
				System.out.print(" ");
			}
		}
	}
}
