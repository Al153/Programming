package uk.ac.cam.at736.Algorithms.Tick1Star;
import uk.ac.cam.rkh23.Algorithms.Tick1Star.*;
import uk.ac.cam.rkh23.Algorithms.Tick1.*;
import java.util.*;

public class BottomUpMaxHeap< T extends Comparable<T> > extends MaxHeap<T> implements  MaxHeapInterface<T>  { 
	public BottomUpMaxHeap(List<T> l){
		super(l);
		}

	public T getMax() throws EmptyHeapException {
		if (mLength == 0){
			throw new EmptyHeapException(); // check if empty heap
		} else {
			T c = mHeap.get(0); // else get the top value
			swap(0,mLength-1); // swap the top and bottom elements
			mLength -= 1; // decrease the length
			siftDown(0); // restore maxHeap property
			return c; // return the max
		}
	}

	private int leafSearch(int i){
		int j = i;
		while (leftChild(j) < mLength){
			if (rightChild(j) < mLength) // lazy evaluation
				if (greater(rightChild(j), leftChild(j))){
					j = rightChild(j);
				} else {
					j = leftChild(j);
				}
			else {
				j = leftChild(j);
			}
		}
		return j;
	}

	private void siftDown(int i){

		int j = leafSearch(i);
		while (greater(i,j)){
			j = parent(j);
		}
		int temp = j;
		T x2 = mHeap.get(i); // value to store
		T x1; // value to move up
		while (j >= i) {
			x1 = mHeap.get(j);
			mHeap.set(j,x2);
			x2 = x1;
			j = parent(j);
		}
	}
}
