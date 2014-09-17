import java.util.Scanner;


public class Stanislav_Gospodinov_2 {

	public static void main(String[] args) {
		int x, y, sum = 0;
		Scanner s = new Scanner(System.in);
		x = s.nextInt();
		do{
			y = s.nextInt();
		}while(y < x);
		
		while(x <= y){
			if(x%17 == 0){
				sum += x;
			}
			x++;
		}
		System.out.println(sum);
	}

}
