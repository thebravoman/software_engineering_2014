// Entry Level - 11. grade, ELSYS 2014/2015
// Petko '3phase' Bozhinov
// Task 12

import java.lang.reflect.Array;
import java.util.Scanner;

public class zad12 {
	public static void main(String args[]) {
		Scanner in = new Scanner(System.in);
		int x, y, w, h, widthOfEachPlank, heightOfEachPlank, countOfPlanks;

		int[] coordinates = new int[10];

		System.out.println("Insert value for X: ");
		x = in.nextInt();
		System.out.println("Insert value for Y: ");
		y = in.nextInt();
		System.out.println("Insert value for W: ");
		w = in.nextInt();
		System.out.println("Insert value for H: ");
		h = in.nextInt();

		countOfPlanks = x/w;
		widthOfEachPlank = x / countOfPlanks;
		heightOfEachPlank = y / h;
		if (widthOfEachPlank > 0 && heightOfEachPlank > 0) {
			int totalCountOfPlanks = countOfPlanks * heightOfEachPlank;
			System.out.println("The count of the separate slabs is "
					+ totalCountOfPlanks
					+ ". Here come the x-coordinates of each plank... ");
			if (countOfPlanks > 10) {
				countOfPlanks = 10;
			}
			for (int i = 0; i < countOfPlanks; i++) {
				coordinates[i] = w * i;
			}
			for (int i = 0; i < countOfPlanks; i++) {
				int plankNumber = i + 1;
				System.out.println("The X-coordinate, from where plank' partition number "
						+ plankNumber + " starts is " + coordinates[i] + ".");
			}
		} else if (widthOfEachPlank == 0 || heightOfEachPlank == 0) {
			System.out.println("0 whole slabs with those dimensions could be separated. Please, try again by setting lower dimensions.");
		}

	}
}
