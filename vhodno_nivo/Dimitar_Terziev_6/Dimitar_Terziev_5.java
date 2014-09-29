import java.util.Scanner;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
class Rev_Cos_Problem5 {
	public static void main (String[] args) {
		Scanner input = new Scanner (System.in);
		int x = input.nextInt();
		if(0>x || 10<x){
			return;
		}
		Double [] cos_arr = new Double [10];
		for(int i=0;i<10;i++){
			cos_arr[i]=Math.cos(i+1);
			System.out.print(cos_arr[i].doubleValue());
			System.out.print(" ");
		}
		System.out.print("\n");
		Arrays.sort(cos_arr,Collections.reverseOrder());
		for(int i=0;i<10;i++){
			System.out.print(cos_arr[i].doubleValue());
			if(i+1<10){
			System.out.print(" ");
			}
		}
	}
}
