package uk.ac.cam.at736.Algorithms.Revision;

public class QuickSort{
	public static void sort(int[] array){
		int[] temp = new int[array.length];
		sort_rec(array,temp,0,array.length);


	}


	private static void sort_rec(int[] a, int[] helper, int start, int end){
		if (start == end || start == end-1) return; // if trivial array, return
		//else split, sort
		
		//pick pivot, and swap to front end
		int pivot = start;
		swap(a,start,pivot);

		// swap around pivot
		int i = start+1;
		int j = end-1;
		while(i < j){
			if (a[i]<a[start]){
				if (a[j]>a[start]){ // both in correct positions with respect to pivot
					i++; j--;
				} else { //i in correct position, j not
					i++;
				}
			} else {
				if (a[j]>a[start]){ // i in wrong position, j correct
					j--;
				} else { // both in wrong position
					swap(a,i,j);
					i--; j++;
				}
			}
		}

		if (i == j){ // pointers are equal
			if (a[start]>a[i]){ //if last element is out of order, swap it
				swap(a,start,i);
				pivot = i;
			} else {
				swap(a,start,i-1);
				pivot = i;
			}
		} else { //if pointers have overshot
			swap(a,start,i);
			pivot = j;
		}



		sort_rec(a,helper,start,pivot);
		sort_rec(a,helper,pivot,end);
	}

	private static void swap(int[] a, int i, int j){
		int temp = a[i]; a[i] = a[j]; a[j] = temp;
	}
}