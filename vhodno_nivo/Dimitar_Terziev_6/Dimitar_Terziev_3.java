import java.util.Scanner;
class Sum_3_Problem3 {
	public static void main (String[] args) {
		Scanner input = new Scanner (System.in);
		int x = input.nextInt();
		int y = input.nextInt();
		long sum = 0;
		if(x%10>3){
			x=(((x/10)+1)*10)+3;
		}else if(x%10<3){
			x=((x/10)*10)+3;
		}
		if(x==3){
			sum+=3;
		}
		while(x<y){
			for(int i=3;i<x/2;i+=2){
				if(x%i==0){
					break;
				}
				if(i+2>=x/2){
					sum+=x;
				}
			}
			x+=10;
		}
		System.out.print(sum);
	}
}
