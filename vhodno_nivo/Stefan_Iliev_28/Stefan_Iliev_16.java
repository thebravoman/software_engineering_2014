import java.util.Scanner;


public class Stefan_Iliev_16 {
    //Copyright Stefan Iliev 2014. Я сте пипнали, я пръсти не ви останали :}
	
	public static void main(String[] args) {
		System.out.println("Please, enter a number between 0 and 10 exclusive.Preferably not even one :}");
		int input = getProtectedInputInt(1, 9);
		int intArray[],intArrayPos = 0;
		if (input % 2 == 0) {															//Check if the user is a monkey. Or my grandmother ;-;
			System.out.println("No prime number ends with "+Integer.toString(input));  //Informs my grandmother that she is bad at math.
		} else if (input == 5) {													  //Check for party killers.
			System.out.println("The answer is 5. Don't make my program cry plz :{"); //Throw them out!!!!!!!!!!!!. That dot op :{
		} else { 																	//My grandmother took her math tests :} Time for fun.Not. 
			intArray = new int[10];
			for (int i = 0;;i++) {
				if (isPrime(i)) {                      //ILOVEMAGIC.
					if (i % 10 == input) {            //LEL. DO WE GET THE LAST DIGIT HERE? YESH WE DO. OH WAIT , THERE IS MORE !!! WE COMPARE IT TO THE INPUT NUMBER :O :O :O PROGRAMMING PLZ
						intArray[intArrayPos++] = i; //Gratz, the prime number's last digit is equal to the input, now we can feed the array with numbers and electrify that memory :}
						if (intArrayPos == 10) {    //We don't want the out of bonds error, do we? Gud user, gud user. U're god, the program won't crash it when you use it. SO BUY IT.
							break; 				   //OMAGAD, ESCAPE FROM THE ERROR. RUN, *insert the N word here*, RUN!
						}
					}
				}  								//So many brackets.
			} 
			printArray(intArray); //GIVE THE USER HIS NUMBERS. MAKE THAT A...ARRAY MOVE :}
		}
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
}


