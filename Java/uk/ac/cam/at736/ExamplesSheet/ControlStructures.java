package uk.ac.cam.at736.ExamplesSheet;
public class ControlStructures{
	public static int sum(int[] a){
		int total = 0;
		int size = a.length;
		for (int i = 0;i<size,i++){
			total += a[i];
		}
		return total;
	}
	public static int[] cumsum(int[] a){
		int total = 0;
		int size = a.length;
		int[] result = new int[size];
		for (int i=0;i<size;i++){
			total += a[i];
			result[i] = total;
		}
		return result;
	}
}