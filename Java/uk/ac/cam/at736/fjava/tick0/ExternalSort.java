/**
* ExternalSort.java - copyright Alexander Taylor, University of Cambridge
* 
* Not Protectively marked
*/

package uk.ac.cam.at736.fjava.tick0;

import java.io.RandomAccessFile;


import java.io.BufferedOutputStream;
import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.FileInputStream;
import java.io.DataOutputStream;
import java.io.DataInputStream;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.security.DigestInputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
* Externally sorts large files of integers
* I propose to do this by using a pass of a counting sort based radix sort
* (Tentatively on the top byte of each integer) to sort the data into buckets
* (ideally of size around  500-1000 items) which can then be sorted and replaced in place by conventional algorithms
*  (maybe java's built-in sorting method)
* Once the sort works, optimise for best use of memory (we want each bucket's disk size to be as close as possible to the maximum amount of data that we can sort in memory)
*/

public class ExternalSort {
	static int[] bucketPositions = new int[257]; // bucketPositions[257] contains the length of the file
	private static final int BUCKET_SIZE = 1<<20;
	private static final int BUFFER_SIZE = 16384;
	
	public static void sort(String f1, String f2) throws FileNotFoundException, IOException {
		System.out.println("Starting");

		/**
		* TODO: check inputs for nulls?
		*/
		RandomAccessFile fileARandom = new RandomAccessFile(f1,"rw");
		RandomAccessFile fileBRandom = new RandomAccessFile(f2,"rw");
		System.out.println("Opened files");
		try {
			DataInputStream fileAIn 	= new  DataInputStream(new  BufferedInputStream(new  FileInputStream(fileARandom.getFD())));
			DataInputStream fileBIn 	= new  DataInputStream(new  BufferedInputStream(new  FileInputStream(fileBRandom.getFD())));
			FileOutputStream fileAOut 	= new FileOutputStream(fileARandom.getFD());
			FileOutputStream fileBOut 	= new FileOutputStream(fileBRandom.getFD());

	
			DataOutputStream fileAOutFinal = new DataOutputStream(new BufferedOutputStream(fileAOut));
			System.out.println("Opened Streams");
			doRadixSort(fileAIn, fileBOut, fileARandom, fileBRandom, (int)(fileARandom.length() >> 2)); // length in ints = length in bytes / 4
			System.out.println("Done radix sort");
			BucketSorter sorter = new BucketSorter(fileBIn, fileAOutFinal, BUCKET_SIZE);
			fileARandom.seek(0); // resets files
			fileBRandom.seek(0);
			System.out.println("Sorting buckets:");
			for (int i = 0; i < 256; i++){
				System.out.print("Sorting bucket "+ i);
				sorter.sort(bucketPositions[i+1]-bucketPositions[i],i);
			}
		} finally {
			fileARandom.close();
			fileBRandom.close();
			System.out.println("Done");
		}


	}

	private static void doRadixSort(DataInputStream in, FileOutputStream out, RandomAccessFile inFile, RandomAccessFile outFile, int length) throws IOException {
		try {
			int value;
			// Init steps. Based of of counting sort
			int i;
			for (i = 0; i < length; i++ ){ 
				value = (in.readInt() >> 24)+128; // get just top 8 bits, converted so that negative numbers (-127 .. -1) are mapped to (0 .. 127) and (0 .. 128) -> ( 128 .. 255 ) 
				bucketPositions[value] += 4;
			}
			boolean narrowData = false;
			for (i = 0; i < 256; i++ ){
				if (bucketPositions[i] > BUCKET_SIZE << 2){
					narrowData = true;
					break;
				}
			}
			if (narrowData){
				System.out.println("TOO NARROW");
				inFile.seek(0); // reset the input stream for a second run
				for (i = 0; i < 256; i++ ){
					bucketPositions[i] = 0;
				}
				for (i = 0; i < length; i++ ){ 
					value = (byte)((in.readInt() >> 1))+128; // Hack - in the case of 11: sort buckets by the second byte
					bucketPositions[value] += 4;
				}
			}

			printHistogram();
			int total = 0;
			BucketBuffer[] buckets = new BucketBuffer[256];
			for ( i = 0; i < 256 ; i++){
				value = bucketPositions[i];
				bucketPositions[i] = total;
				total += value;
				buckets[i] = new BucketBuffer(bucketPositions[i], out, outFile, BUFFER_SIZE);
			}
			bucketPositions[256] = length<<2;
			inFile.seek(0); // reset the input stream for a second run
			for (i = 0; i < length; i++ ){
				value = in.readInt();
				buckets[(value >> 24)+128].write(value);
			}
			for (i = 0; i < 256 ; i ++){
				buckets[i].flush();
				buckets[i] = null;
			}
			System.gc(); // need to test speed of this		
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	private static String byteToHex(byte b) {
		String r = Integer.toHexString(b);
		if (r.length() == 8) {
			return r.substring(6);
		}
		return r;
	}

	public static String checkSum(String f) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			DigestInputStream ds = new DigestInputStream(
					new FileInputStream(f), md);
			byte[] b = new byte[512];
			while (ds.read(b) != -1)
				;

			String computed = "";
			for(byte v : md.digest()) 
				computed += byteToHex(v);

			return computed;
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "<error computing checksum>";
	}

	public static void main(String[] args) throws Exception {
		String f1 = args[0];
		String f2 = args[1];
		sort(f1, f2);
		System.out.println("The checksum is: "+checkSum(f1));
	}

	private static void printHistogram(){
		System.out.println("____________________________________Bucket sizes_________________________________");
		for (int i = 0; i<257; i++ ){
			System.out.print(i + "\t: "+ bucketPositions[i] + "\t| ");
		}
	}
}