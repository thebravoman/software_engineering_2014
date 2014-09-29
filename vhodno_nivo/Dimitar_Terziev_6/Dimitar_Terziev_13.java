import java.util.Scanner;
class Cos_Sum_Problem13 {
	public static void main (String[] args) {
		Scanner input = new Scanner (System.in);
		int x = input.nextInt();
		double [] cos_arr = new double[10];
		double sum=0, cur_cos=0;
		for(int i=0; i<10; i++){
			for(int l=0;l<x;l++){
				cur_cos=Math.cos((i*x)+l);
				sum+=cur_cos;
			}
			cos_arr[i]=sum;
		}
		for(int i=0;i<10;i++){
			System.out.print(cos_arr[i]);
			if(i+1<10){
				System.out.print(" ");
			}
		}
	}
}
