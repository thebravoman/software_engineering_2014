import java.util.Scanner;
class Odd_Sum_Problem1 {
	public static void main (String[] args) {
		Scanner input = new Scanner (System.in);
		int x = input.nextInt();
		int y = input.nextInt();
		long sum = 0;
		if(x%2 == 0){
			x++;
		}
		while(x<y){
			sum += x;
			x += 2;
		}
		System.out.print(sum);
	}
}
