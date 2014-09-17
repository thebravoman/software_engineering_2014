import java.util.Scanner;

public class Simeon_Shopkin_18 {

	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		System.out.println("Input X");
		int x,i=1,k=0,l,j=2,result=0;
		boolean status=true;
		int[] del= new int[10];		
		x = in.nextInt();
		
		while (i<=x) {
			if ((i % 2 !=0) && (x % i==0)) {
				del[k] = i;
				k++;
				if (k > 10) {
					break;
				}
			}
			i++;
		}
		
		for (k=0;k<10;k++) {
			if (del[k] == 0) {
				break;
			}
			System.out.println(del[k]);
		}	
		for (k=0;k<10;k++) {	
			while (j <= del[k] / 2)
			  {
			      if (del[k] % j == 0)
			      {
			         result = 1;
			      }
			      j++;
			  }
			  if (result != 1)
			  {
			      System.out.println("Number: " + del[k] + " is Prime.");
			  }
				
		}
		
		for (l=1;l<=del.length;l++){
					
		} 
		
	
	}

}

