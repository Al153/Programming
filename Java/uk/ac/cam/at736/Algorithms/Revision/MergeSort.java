package uk.ac.cam.at736.Algorithms.Revision;

public class MergeSort{
	public static void sort(int[] array){
		int[] temp = new int[array.length];
		sort_rec(array,temp,0,array.length);


	}


	private static void sort_rec(int[] a, int[] helper, int start, int end){
		if (start == end || start == end-1) return; // if trivial array, return
		//else split, sort, merge
		int start2 = (start+end)/2;
		sort_rec(a,helper,start,start2);
		sort_rec(a,helper,start2,end);
		merge(a,helper,start,start2,start2,end);
	}

	private static void merge(int[] a, int[] helper, int start1, int start2, int end1, int end2){
		int i;
		for (i = start1; i < end1; i++) helper[i-start1] = a[i]; // initialise helper array

		int j1 = 0; int j2 = start2;
		for (i = start1; i < end2; i++){
			
			if (j1 == end1-start1){
				// no remaining elements in first array
				a[i] = a[j2];
				j2++;
			} else if ( j2 == end2){
				// no remaining elements in second array
				a[i] = helper[j1];
				j1++;
			} else if (helper[j1]<=a[j2]){ // first array element smaller
				a[i] = helper[j1];
				j1++;
			} else {
				a[i] = a[j2];
				j2++;
			}
		}
	}
}