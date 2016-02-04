package uk.ac.cam.at736.Algorithms.Tick1Star;
import uk.ac.cam.rkh23.Algorithms.Tick1Star.*;
import uk.ac.cam.rkh23.Algorithms.Tick1.*;
import java.util.*;

public class MaxHeap< T extends Comparable<T> > implements  MaxHeapInterface<T> { // extends Comparable<T> > {
	protected List<T> mHeap = null;
	protected int mLength;

	public MaxHeap(List<T> l){
		mLength = l.size(); // set the length
		mHeap = l; // get the array of Ts in the string
		updateArray(); // adds more space to the heap

		// heapify:
		for (int i = (mLength>>1); i >= 0; i--) 
			heapify(i);
		}

	public T getMax() throws EmptyHeapException {
		if (mLength == 0){
			throw new EmptyHeapException(); // check if empty heap
		} else {
			T c = mHeap.get(0); // else get the top value
			swap(0,mLength-1); // swap the top and bottom elements
			mLength -= 1; // decrease the length
			heapify(0); // restore maxHeap property
			return c; // return the max
		}
	}

	public void insert(T c){
		mHeap.set(mLength,c); // insert to bottom of heap
		siftUp(mLength); // restore maxHeap property
		mLength += 1; // increment length
		updateArray(); // check for overflow of the array
	}

	public int getLength(){
		return this.mLength; // returns the length
	}

	private void updateArray(){
		// Behaviour: doubles the size of the T[] array if the heap takes up too much space
		if (mLength == mHeap.size()){ // only updates if the array is full
			ArrayList<T> newHeap = new ArrayList<T>(mLength * 2); // creates a new array for the heap
			for (int i = 0; i<mLength; i++){ // copies elements
				newHeap.add(mHeap.get(i));
			}
			mHeap = newHeap; // sets the mHeap reference to newHeap
		}
	}

	private void heapify(int iRoot){
		// get child index
		int lChild =leftChild(iRoot);
		int rChild = rightChild(iRoot);

		// checks if mHeao[iRoot] satisfies the heap property:
		if (lChild >= mLength) return; // is a maxHeap if has no children
 

		// get the largest child
		int maxChild;
		if (rChild >= mLength) maxChild = lChild; // if there is no right child, then lChild is the max child
		else {
			if (mHeap.get(lChild).compareTo(mHeap.get(rChild))>0) maxChild = lChild;	// else find the largest child
			else maxChild = rChild;
		}

		if (mHeap.get(iRoot).compareTo(mHeap.get(maxChild)) >= 0) return; // if satisfies heap property
		else{
			swap(maxChild,iRoot);
			heapify( maxChild);
		}
	}

	private void siftUp(int i){
		if (i == 0) return; // if the value reaches the top, then finish
		// otherwise, check if greater than parent
		int parent = parent(i);
		if (greater(i,parent)){ // if so then swap and sift up the heap
			swap(parent,i);
			siftUp(parent);
		}
	}

	protected void swap(int i, int j){
		// swaps value in mHeap at indices i and j
		T temp = mHeap.get(i);
		mHeap.set(i,mHeap.get(j));
		mHeap.set(j,temp);
	}


	protected int parent(int i){return (i-1)>>1;}
	protected int leftChild(int i){return (i<<1) + 1;}
	protected int rightChild(int i){return (i<<1) + 2;}


	public void printHeap(){
		for (T t : mHeap){
			System.out.println(t);
		}
	}

	public boolean greater(int i, int j){
		return mHeap.get(i).compareTo(mHeap.get(j))>0;
	}
}
