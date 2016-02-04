package uk.ac.cam.at736.Algorithms.Tick1;
import uk.ac.cam.rkh23.Algorithms.Tick1.*;

public class MaxCharHeap implements MaxCharHeapInterface {
	private char[] mHeap = null; 
	private int mLength;

	public MaxCharHeap(String s){
		mLength = s.length(); // set the length
		s = s.toLowerCase(); // set to lowercase, as requested
		mHeap = s.toCharArray(); // get the array of chars in the string
		updateArray(); // adds more space to the heap

		// heapify:
		for (int i = (mLength>>1); i >= 0; i--) 
			heapify(i);
		}

	public char getMax() throws EmptyHeapException {
		if (mLength == 0){
			throw new EmptyHeapException(); // check if empty heap
		} else {
			char c = mHeap[0]; // else get the top value
			swap(0,mLength-1); // swap the top and bottom elements
			mLength -= 1; // decrease the length
			heapify(0); // restore maxHeap property
			return c; // return the max
		}
	}

	public void insert(char c){
		mHeap[mLength] = Character.toLowerCase(c); // insert to bottom of heap
		siftUp(mLength); // restore maxHeap property
		mLength += 1; // increment length
		updateArray(); // check for overflow of the array
	}

	public int getLength(){
		return this.mLength; // returns the length
	}

	private void updateArray(){
		// Behaviour: doubles the size of the char[] array if the heap takes up too much space
		if (mLength == mHeap.length){ // only updates if the array is full
			char[] newHeap = new char[mLength * 2]; // creates a new array for the heap
			for (int i = 0; i<mLength; i++){ // copies elements
				newHeap[i] = mHeap[i];
			}
			mHeap = newHeap; // sets the mHeap reference to newHeap
		}
	}

	private void heapify(int iRoot){
		// get child index
		int lChild = (2*iRoot)+1;
		int rChild = (2*iRoot)+2;

		// checks if mHeao[iRoot] satisfies the heap property:
		if (lChild >= mLength) return; // is a maxHeap if has no children
 

		// get the largest child
		int maxChild;
		if (rChild >= mLength) maxChild = lChild; // if there is no right child, then lChild is the max child
		else {
			if (mHeap[lChild]>mHeap[rChild]) maxChild = lChild;	// else find the largest child
			else maxChild = rChild;
		}

		if (mHeap[iRoot] >= mHeap[maxChild]) return; // if satisfies heap property
		else{
			swap(maxChild,iRoot);
			heapify( maxChild);
		}
	}

	private void siftUp(int i){
		if (i == 0) return; // if the value reaches the top, then finish
		// otherwise, check if greater than parent
		int parent = (i-1) >> 1;
		if (mHeap[i] > mHeap[parent]){ // if so then swap and sift up the heap
			swap(parent,i);
			siftUp(parent);
		}
	}

	private void swap(int i, int j){
		// swaps value in mHeap at indices i and j
		char temp = mHeap[i];
		mHeap[i] = mHeap[j];
		mHeap[j] = temp;
	}
}
