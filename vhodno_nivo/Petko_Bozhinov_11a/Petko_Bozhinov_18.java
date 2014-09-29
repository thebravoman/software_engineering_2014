// Entry Level - 11. grade, ELSYS 2014/2015
// Petko '3phase' Bozhinov
// Task 18

import java.lang.reflect.Array;
import java.util.Scanner;

public class zad18 {
	public static void main(String args[]) {
		Scanner in = new Scanner(System.in);
		int x, element = 0;
		boolean simple = true;

		int array[] = new int[10];

		do {
			System.out
					.println("Submit a value for X, that is greater/equal to 0. ");
			x = in.nextInt();
		} while (x < 0);
		for (int i = 1; i <= x; i++) {
			if (x % i == 0 && i % 2 != 0) {
				array[element] = i;
				element++;
			}
			if (element == 9) {
				break;
			}
		}
		for (int i = 0; i < element; i++) {
			System.out.println("Element "+(i+1)+" of the array is = "+array[i]+";");
		}
		for (int i = 0; i < element; i++) {
			int z = array[i];
			for(int j = 2; j < x; j++){
				if(z % j == 0){
					if(z != j){
						simple = false;
					}
				}
			}
			if(simple){
				System.out.println(z+" is one of the simple elements in the array;");
			}
		}
	}
}
