import java.util.Scanner;
class Range_Fib_Problem4 {
	public static void main (String[] args) {
		Scanner input = new Scanner (System.in);
		long x = input.nextLong();
		long y = input.nextLong();
		long fib1=0, fib2 = 1;
		boolean turn = false;
		while(fib1<x || fib2<x){
			if(turn){
				fib1+=fib2;
			}else{
				fib2+=fib1;
			}
			turn=!turn;
		}
		while(fib1<y && fib2<y){
			if(turn){
				fib1+=fib2;
				System.out.print(fib2);
			}else{
				fib2+=fib1;
				System.out.print(fib1);
			}
			if(fib1<y && fib2<y){
				System.out.print(" ");
			}
			turn=!turn;
		}
	}
}
