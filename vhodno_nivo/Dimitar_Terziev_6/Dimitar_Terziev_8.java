import java.util.*;
import java.util.Scanner;
class Odd_Arr_Problem8 {
	public static void main (String[] args) {
		Scanner input = new Scanner (System.in);
		int x = input.nextInt();
		int [] first_arr = new int [10];
 		ArrayList<Integer> odd_arr = new ArrayList<Integer>();
		for(int i=0; i<10; i++){
			first_arr[i] = (int)(Math.random()*x);
			if(first_arr[i]%2==1){
				try{
					odd_arr.add(first_arr[i]);
				}catch(Exception ex){
					System.out.print(ex);
				}
			}
		}
		int odd_arr_size = odd_arr.size();
		for(int i=0; i<odd_arr_size; i++){
			System.out.print(odd_arr.get(i));
			if(i+1<odd_arr_size){
				System.out.print(" ");
			}
		}
	}
}
