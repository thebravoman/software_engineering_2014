import java.util.Scanner;
class Fact_17_Problem2 {
	public static void main (String[] args) {
		Scanner input = new Scanner (System.in);
		int x = input.nextInt();
		int y = input.nextInt();
		long sum = 0;
		while(x%17!=0){
			x++;
		}
		while(x<y){
			sum+=x;
			x+=17;
		}
		System.out.print(sum);
	}
}
