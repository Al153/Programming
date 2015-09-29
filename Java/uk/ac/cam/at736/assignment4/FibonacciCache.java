package uk.ac.cam.at736.assignment4;

public class FibonacciCache {
   //TODO: Test your program with values other than 20 as given here
   public static long[] fib = new long[20];

   public static void store() {
   		for (int i = 0; i<fib.length;i++){
   			if (i < 2l){
   				fib[i] = 1l;
   			} else {
   				fib[i] = fib[i-1] + fib[i-2];
   			}
   		}
   }

   public static void reset() {
      for (int i = 0; i<fib.length;i++){
      	fib[i] = 0l;
      }
   }
 
   public static long get(int i) throws Exception{
      //TODO: return the value of the element in fib found at index i
      //      e.g. "get(3)" should return the fourth element of fib

      //TODO: your code should throw an Exception with a suitable message
      // if the value requested is out of bounds of the array
   	if (i>=0l && i<fib.length){
   		return fib[i];
   	} else throw new Exception("Error value requested is outside the bounds of the array");
   }

   public static void main(String[] args) {
      //TODO: catch exceptions as appropriate and print error messages
      store();
      int i = Integer.decode(args[0]);
      try{
      	System.out.println(get(i));
      }catch(Exception e){
      		System.out.println(e.getMessage());
      }
   }
  
}