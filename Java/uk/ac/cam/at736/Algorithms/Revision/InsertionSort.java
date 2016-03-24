package uk.ac.cam.at736.Algorithms.Revision;

public class InsertionSort{
	public static void sort(int[] array){
		int sortedIndex;
		int currentIndex;
		for (sortedIndex = 0; sortedIndex < array.length; sortedIndex ++){
			currentIndex = sortedIndex;
			while (currentIndex >0){
				if (array[currentIndex]<(array[currentIndex-1])){
					
					int temp = array[currentIndex]; // do a swap
					array[currentIndex] = array[currentIndex-1];
					array[currentIndex-1] = temp;

					currentIndex -= 1;
				} else break;
			}
		}
	} 
}