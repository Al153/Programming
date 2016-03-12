package uk.ac.cam.at736.Algorithms.Tick2;
import uk.ac.cam.rkh23.Algorithms.Tick2.*;

public class LCSBottomUp extends LCSFinder{
	public LCSBottomUp(String s1, String s2){
		super(s1,s2);
		super.mTable = new int[s1.length()][s2.length()];
	}


	private int getTableEntry(int i, int j){
		// looks up coords in table, returning 0 as sentinel values for those outside the table
		if ((i<0) || (j<0)) return 0;
		else return super.mTable[i][j];
	}

	public int getLCSLength(){
		if ((mString1.length() == 0)||(mString2.length() == 0)) return 0; // if either string is empty then return 0
		for (int i = 0; i< mString1.length(); i++){
			for (int j = 0; j< mString2.length(); j++){
				if (super.mString1.charAt(i) == super.mString2.charAt(j)){
					// if strings have the same character at [i] and [j] respectively, the LCSL at this point is 1 + previous_LCSL
					super.mTable[i][j] = getTableEntry(i-1,j-1) + 1;
				} else {
					// otherwise the LCSL at this point is the maximum of those with one fewer character at the end of either string
					super.mTable[i][j] = max(getTableEntry(i-1,j),getTableEntry(i,j-1)); 
																				
				}
			}
		}
		return getTableEntry(super.mString1.length()-1,super.mString2.length()-1); // returns last value in the table
	}

	private int max(int a, int b){
		if (a>b) return a;
		return b;
	}

	public String getLCSString(){
		// How to find LCS from table:
		// create a stack from a linked list

		// start with two indices at the maximum values (top right by the  tick page's convention):
		// find the maximum value of its neighbours with equal or smaller indices (below, left, diagonal below left),
		// defaulting with diagonal. (or the remaining direction if either of the indices is 0),
		// and move to that spot
		// if the move is diagonal and involves a decrease in value, then add the char pointed to by an index in the string to the stack
		// once the index has reached the bottom left, return the stack as a string
		char[] resultStack = new char[getLCSLength()]; // gets the LCS length and initialises the string
		int i = super.mString1.length() -1;
		int j = super.mString2.length() -1;
		if (getLCSLength() == 0) return ""; // since a string of length 0 is always ""
		while(i>0 || j>0){
			if (i == 0){ // special case: i = 0
				if (mTable[i][j]>mTable[i][j-1]){ // check if there is a decrease from moving down
					resultStack[mTable[i][j-1]] = mString2.charAt(j);  // if so, then add the char to the stack
				}
				j--;
				continue;
			}
			if (j == 0){ // special case: j = 0
				if (mTable[i][j]>mTable[i-1][j]){ // check if there is a decrease from moving left
					resultStack[mTable[i-1][j]] = mString1.charAt(i); // if so then add the char to the stack
				}
				i--;
				continue;
			}

			if (mTable[i-1][j-1]>=mTable[i-1][j]){ // if diag>=left
				if (mTable[i-1][j-1]>=mTable[i][j-1]) { // if diag>=down
					if (mTable[i][j]>mTable[i-1][j-1]){ // if there's a decrease
						resultStack[mTable[i-1][j-1]] = mString2.charAt(j);  // if so, then add the char to the stack
					}
					i--; j--; // decrease both indices
				}else{
					j--; // move down
				}

			} else {
				if (mTable[i-1][j]>=mTable[i][j-1]){ // if left is greater:
					i--; // move left
				} else { // if down is greater:
					j--; // move down
				}
			}

		}
		if (mTable[0][0] > 0){ // if the strings share the same first letter then add it
			resultStack[0] = mString1.charAt(0); 
		}
		return new String(resultStack);

	}

	public void printTable(){ // debugging tool to print out the internal table, but flipped vertically from the tick page
		System.out.print("\t");
		for (int i = 0; i<super.mString1.length(); i++){
			System.out.print(super.mString1.charAt(i)); 
			System.out.print("\t");
		}
		System.out.println("");
		for (int j = 0; j <super.mString2.length(); j++){
			System.out.print(super.mString2.charAt(j)); 
			System.out.print("\t");		
			for (int i = 0; i<super.mString1.length(); i++){
				System.out.print(super.mTable[i][j]); 
				System.out.print("\t");
			}
			System.out.println("");
		}
	}
}