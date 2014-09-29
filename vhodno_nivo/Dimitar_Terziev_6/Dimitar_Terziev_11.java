import java.util.Scanner;
class Pi_Problem11 {
	public static void main (String[] args) {
		Scanner input = new Scanner (System.in);
		float x = input.nextFloat();
		if(x>1 || x<0){
			return;
		}
		float pi=0,curr_odd=1;
		boolean l=true;
		while(4/curr_odd>x){
			if(l){
				pi+=4/curr_odd;
			}else{
				pi-=4/curr_odd;
			}
			l=!l;
			curr_odd+=2;
		}
		System.out.print(pi);
	}
}
