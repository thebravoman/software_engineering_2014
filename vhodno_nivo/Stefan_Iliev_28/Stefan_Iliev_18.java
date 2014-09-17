import java.util.Scanner;


public class Stefan_Iliev_18 {
   //Copyright Stefan Iliev 2014. Я сте пипнали, я пръсти не ви останали :}

	
	public static void main(String[] args) {
		System.out.println("Number. > 0. Now.");
		int input = getProtectedInputInt(0); 	   //MUHAHAHA. Returns electricity on the positive side of the world :}
		long longArray[] = new long[10]; 		  //As always ... ARRAY. I'll call it girlfriend from now on. 
		int longArrayPos = 0;					 //That C initialization. Like this is not java ;-;
		
		if (!isPrime(input)) {
			for (int i = 1 ; longArrayPos < longArray.length && i < input/2 ; i+=2) { //Lame stuff again. OH REVERSE COMMENT ! :OOOOOOOOOOOOO
				if (input % i == 0) {				 //*insert lyrics here*
					longArray[longArrayPos++] = i; 	//Lame stuff.
				}
			}
		} else {
			longArray[longArrayPos++] = 1;
			longArray[longArrayPos++] = input;
		}
		printArray(longArray);
		System.out.println("And the prime numbers are:");
		printArray(longArray,PRIME_ONLY);
		
	}
	//BANG, HE REUSES THE CODE AGAIN. OMAGAD.
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
	public static int getProtectedInputInt(int limit) { //Returns unsigned integer or the closest thing to it. :D (Inclusive limit)
		Scanner scnr = new Scanner(System.in);                     //Open a scanner.
		int input;												  //Magic :l
		do {													 //Moar magic
			input = scnr.nextInt();								//Oh well, i give up
		} while (input < limit);         					   //WHAT IN OBLIVION IS THAT ?
		scnr.close();										  //Once they told me memory leaks are bad :{
		return input;										 //OH WOW. ITS NOT A VOID. WOW WOW WOW.
	}

	public static int getProtectedInputInt(int limit,int maximum) { //Returns integer between the set limit. (Inclusive limit)
		Scanner scnr = new Scanner(System.in);                     //Open a scanner.
		int input;												  //Magic :l
		do {													 //Moar magic
			input = scnr.nextInt();								//Oh well, i give up
		} while (input < limit || input > maximum);            //WHAT IN OBLIVION IS THAT ?
		scnr.close();										  //Once they told me memory leaks are bad :{
		return input;										 //OH WOW. ITS NOT A VOID. WOW WOW WOW.
	}
	private static long result;
	public static boolean isPrime(long number) {
		if ((number & 1) == 0)
			if (number == 2) return true; 
			else return false; 		     //No even number is prime (except 2) :} Learn to #math Not sure if optimization or not, but by a wild guess, skipping the loop is always better.
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

	public final static int PRIME_ONLY = 1515; //makes magic.
	public static void printArray(long array[],int mod) {
		if(mod == PRIME_ONLY) {
			for (int i = 0; i < array.length;i++) {              //Make magic run until it hits the no magic error land.
				if(isPrime(array[i])) {
					System.out.println(Long.toString(array[i])); //Make numbers magically appear on the console. TODO: Make numbers appear on everything. :} :} :}
				}
			}
		}
	}
}
