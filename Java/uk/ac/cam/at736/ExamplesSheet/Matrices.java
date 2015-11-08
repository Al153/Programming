package uk.ac.cam.at736.examplesSheet;

public class Matrices{

	public static void transpose(float[][] matrix){
		int size = matrix.length;
		for (int i = 0; i<size; i++){
			for (int j = 0; j<i; j++){
				float temp = matrix[i][j];
				matrix[i][j] = matrix[j][i];
				matrix[j][i] = temp;
			}
		}
	}
	public static void printArray(float[][] matrix){
		int size = matrix.length;
		for (int i = 0; i<size; i++){
			for (int j = 0; j<size; j++){
				System.out.print(matrix[i][j]);
				System.out.print(" ");
			}
			System.out.println();
		}
		System.out.println();
	}
	public static void main(String[] args) throws java.io.IOException
	{
		float[][] myArray = new float[3][3];
		for (int i=0;i<3;i++){ for (int j=0;j<3;j++){
				myArray[i][j] = (float)(i*3+j+1);
			}
		}
		printArray(myArray);
		transpose(myArray);
		printArray(myArray);
	}
}