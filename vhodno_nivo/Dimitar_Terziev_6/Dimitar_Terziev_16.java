import java.util.Scanner;
class Prim_Arr2_Problem16 {
	public static void main (String[] args) {
		Scanner input = new Scanner (System.in);
		int x = input.nextInt();
		boolean check = false;
		long [] prim_arr = new long[10];	
		long counter=0;
		if(x<0 || x>9){
			return;
		}
		for(int i=0;i<10;i++){
			if((x%2==0 || x%5==0)){
				System.out.print("no prime numbers end in 2 or 5 except 2 and 5 \n");
				return;
			}
			check=false;
			while(true){
				counter++;
				if(counter%10==x){
					if(counter%2!=0){
						if(i==0){
							prim_arr[0]=counter;
							break;
						}
						for(int l=3;l<counter/2;l+=2){
							if(counter%l==0){
								break;
							}
							if(l+2>counter/2){
								check=true;
							}
						}
					}
				}
				if(check){
					prim_arr[i]=counter;
					break;
				}
			}
		}
		for(int i=0;i<10;i++){
			System.out.print(prim_arr[i]);
			if(i+1<10){
				System.out.print(" ");
			}
		}
	}
}

