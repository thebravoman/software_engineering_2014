import java.util.Scanner;


public class Stefan_Iliev_17 {
    //Copyright Stefan Iliev 2014. Я сте пипнали, я пръсти не ви останали :}
	
	public static void main(String[] args) {
		System.out.println("Enter a number between 0 and 10 exclusive. (Or suffer the while(true))"); //Remind the user what to do. 
		int input = getProtectedInputInt(1,9);
		long longArray[] = new long[10];//This time i won't shit on the compiler ;}}}
		int longArrayPos = 0;
		resetFibonacci(); //For the sake of pretty code.
		while (longArrayPos < 2) { //Make that pc QQ.
			if (nextFibonacci() % 10 == input) {  
				longArray[longArrayPos++] = currentFibonacci;
			}
		} //Fibonaccies found.
		if (!(input % 2 == 0)) {					//Protecting
			if (!(input % 5 == 0)) {			   //Protecting again
				for (int i = 3; longArrayPos != longArray.length; i+=2) { //Optimized. Kinda.
					if (isPrime(i)) {									// Check if the number is prime
						if (i % 10 == input) {							// the last digit check .-. MAGIC 
							longArray[longArrayPos++] = i;				// and feeding the array
						}												//not to forget the brackets ;D
					}
				}
			} else {
				longArray[longArrayPos++] = 5;
			}
		} else System.out.println("No odd numbers end with even number");
		printArray(longArray);
	}
	private static long currentFibonacci; //This is vile sorcery. Don't troll it (if you don't know how :D).
	private static long prevFibonacci;   //Used to store the bad numbers :}
	public static long nextFibonacci() {
		currentFibonacci += prevFibonacci;  //Magic :l
		prevFibonacci = currentFibonacci - prevFibonacci; //HUAH, TAKE THAT CPU. I don't have RAM for that *cough* useful *cough* references, sorry. TAKE THAT JAVA. 
		return currentFibonacci;
	}
	public static void resetFibonacci(){
		//I have no idea if im going to use it, but w/e. DO IT FOR THE LULZ.
		currentFibonacci = 1;
		prevFibonacci = 0;
	}
 	//OOOOOOOOOOOOOOHH HE IS REUSING CODE. YES. YES, I am.CHEATS BRO :}
	public static int getProtectedInputInt(int limit,int maximum) { //Returns integer between the set limit. (Inclusive limit)
		Scanner scnr = new Scanner(System.in);                     //Open a scanner.
		int input;												  //Magic :l
		do {													 //Moar magic
			input = scnr.nextInt();								//Oh well, i give up
		} while (input < limit || input > maximum);            //WHAT IN OBLIVION IS THAT ?
		scnr.close();										  //Once they told me memory leaks are bad :{
		return input;										 //OH WOW. ITS NOT A VOID. WOW WOW WOW.
	}
	private static int result;
	public static boolean isPrime(int number) {
		if (number % 2 == 0) return false; 		     //No even number is prime :} Learn to #math Not sure if optimization or not, but by a wild guess, skipping the loop is always better.
		else if (number != 5) {
			if (number % 10 == 5 || number % 10 == 0) return false; //Well, learn to finger math. Woah, that sounds wrong :}:}
		} else return true;						   //The number is 5. :} #magicTheGathering.
		
		result = number/2;  					 //Optimization magic.
		for (int i = 3; i <= result; i++) {    	//Casting optimization magic.
			if (number % i == 0) return false; //BAM. FREAKING MAGIC.
		}									  //This bracket is the answer to life.
		return true; 						 //Gratz, the number is prime.
				
	}
	
	public static void printArray(int array[]) {
		for (int i = 0; i < array.length;i++) {              //Make magic run until it hits the no magic error land.
			System.out.println(Integer.toString(array[i])); //Make numbers magically appear on the console. TODO: Make numbers appear on everything. :} :} :}
		}
	}
	public static void printArray(long array[]) {
		for (int i = 0; i < array.length;i++) {              //Make magic run until it hits the no magic error land.
			System.out.println(Long.toString(array[i])); //Make numbers magically appear on the console. TODO: Make numbers appear on everything. :} :} :}
		}
	}

}
