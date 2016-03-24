package uk.ac.cam.at736.Algorithms.Revision;

public class Test {
	public static void main(String[] argv){
		HashTableTest myTree = new HashTableTest();
		myTree.insert("abc",3);
		myTree.insert("Hello",4);
		myTree.insert("world",5);
		myTree.insert("d",1);
		myTree.insert("e",7);

		System.out.println(myTree.lookup("abc"));

		System.out.println(myTree.lookup("e"));
		System.out.println(myTree.lookup("d"));
		System.out.println(myTree.lookup("Hello"));
		System.out.println(myTree.lookup("world"));			

		//int[] testArray = {9,2,3,1,5,7,6,8,4};
		//printArray(testArray);
		//QuickSort.sort(testArray);
		//printArray(testArray);
	}

	public static void printArray(int[] a){
		for (int i = 0; i < a.length; i ++){
			System.out.print(a[i]);
			System.out.print(", ");
		}
		System.out.println("");
	}

	public static void printRange(int[] a, int start, int end){
		for (int i = 0; i < a.length; i ++){
			System.out.print(a[i]);
			System.out.print(", ");
		}
		System.out.println("");
	}
}