import java.util.Scanner;


public class Stanislav_Gospodinov_3 {

	public static boolean isSimple(int n){
		int count, i = 0;
		for(count=1; count <= n; count++){
			if( n % count == 0){
				i++;
			}
		}
		if (i>2){
			return false;
		}else{
			return true;
		}	
	}
	
	public static void main(String[] args) {
		int x, y, p;
		Scanner s = new Scanner(System.in);
		x = s.nextInt();
		do{
			y = s.nextInt();
		}while(y < x);
		for( p = x; p <= y; p++){
			if ((p % 10 == 3) && isSimple(p)){
				System.out.println(p);
			}
		
		}
	}

}
