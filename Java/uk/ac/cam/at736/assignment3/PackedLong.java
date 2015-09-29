package uk.ac.cam.at736.assignment3; 
		
public class PackedLong {
			
   /*
    * Unpack and return the nth bit from the packed number at index position;
    * position counts from zero (representing the least significant bit)
    * up to 63 (representing the most significant bit).
    */
   public static boolean get(long packed, int position) {
   // set "check" to equal 1 if the "position" bit in "packed" is set to 1
   long check = (packed>>>position)&1L; //TODO: complete this statement

   return (check == 1);
   }

   /*
    * Set the nth bit in the packed number to the value given
    * and return the new packed number
    */
   public static long set(long packed, int position, boolean value) {
      if (value) {
          packed |= (1L<<(long)position);
         // TODO: complete this
         // update the value "packed" with the bit at "position" set to 1
      }
      else {
          //long bitmask = (-1L) - (1L<<position);
          packed &= ~(1L<<(long)position);
         // TODO: complete this
         // update the value "packed" with the bit a "position" set to 0 
      }
      return packed;
   }
}