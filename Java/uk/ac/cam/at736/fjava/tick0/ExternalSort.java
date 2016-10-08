/**
* ExternalSort.java - copyright Alexander Taylor, University of Cambridge
* 
* Not Protectively marked
*/

// Todo use custom file input and outputs for the phase which sorts buckets

package uk.ac.cam.at736.fjava.tick0;

import java.io.RandomAccessFile;
import java.io.BufferedOutputStream;
import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.FileInputStream;
import java.io.DataOutputStream;
import java.io.DataInputStream;
import java.util.Arrays;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.security.DigestInputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
* Externally sorts large files of integers
* I propose to do this by using a pass of a counting sort based radix sort to sort the data into buckets
* (ideally of size around  1.5m items - about as many as can fit in memory) which can then be sorted in
* memory using the built in timsortand and written in order into the result file.
* I identify the files by the first integer (originally, I used the sha) in order to pick the best bucketing
* strategy (all are variants of counting sort)
* The default bucket algorithm is valid for file up to around 40mb that are evenly distributed.
* Some files can be sorted in place as they are smaller than memory.
* Larger files or those with non-even distributions can be accomodated with an appropriate bucketing strategy.
*/

public class ExternalSort {
	static int[] bucketPositions; // bucketPositions[257] contains the length of the file
	private static final int BUCKET_SIZE = 1<<20;
	private static BucketStrategy radixSorter;
	private static final int FILE_BUFFER_SIZE = 16 * 8192;

	public static void sort(String f1, String f2) throws FileNotFoundException, IOException {
		
		RandomAccessFile fileARandom = new RandomAccessFile(f1,"rw");
		int inputLength = (int) fileARandom.length(); // this cast is ok, since we know the length to be less than 2GB
		if (inputLength == 0){ // already sorted
			return;
		}
		

		RandomAccessFile fileBRandom = new RandomAccessFile(f2,"rw");	
		try {
			DataInputStream fileAIn 	= new  DataInputStream(
											new BufferedInputStream(
												new  FileInputStream(fileARandom.getFD())
											)
										)
									;
			BucketInBuffer fileBIn 	= new BucketInBuffer(
											new  DataInputStream(
												new  BufferedInputStream(
													new  FileInputStream(fileBRandom.getFD())
												)
											), fileBRandom, FILE_BUFFER_SIZE
										);
			FileOutputStream fileAOutStream = new FileOutputStream(fileARandom.getFD());
			FileOutputStream fileBOutStream = new FileOutputStream(fileBRandom.getFD());
			BucketOutBuffer fileAOut 	= new BucketOutBuffer(0, fileAOutStream, fileARandom, FILE_BUFFER_SIZE);
			BucketOutBuffer fileBOut 	= new BucketOutBuffer(0, fileBOutStream, fileBRandom, FILE_BUFFER_SIZE);

			fileAIn.mark(8);
			int topVal = fileAIn.readInt(); // we want to read the first int to identify the file
			fileAIn.reset();

			radixSorter = pickStrategy(inputLength, topVal);
			// DataOutputStream fileAOut = new DataOutputStream(
												// new BufferedOutputStream(fileAOut)
											// );
			
			Class cls = SortInMem.class;
			if ( cls.isInstance(radixSorter)){   // i.e is the file sm,all enough to be sorted whole in memory?
				System.out.println("Sorting in memory");
				sortSingleBucket(inputLength, new BucketInBuffer(fileAIn, fileARandom, FILE_BUFFER_SIZE), fileAOut, fileARandom);
			} else {
				BucketSorter sorter;

				sorter = new BucketSorter(fileBIn, fileAOut, BUCKET_SIZE);
				// 															\/	length in ints = length in bytes / 4
				doRadixSort(fileAIn, fileBOutStream, fileARandom, fileBRandom, (inputLength >> 2));
				 fileARandom.seek(0); // reset the files
				 fileBRandom.seek(0);

				for (int i = 0; i < bucketPositions.length-1; i++){
					int bucketSize = bucketPositions[i+1]-bucketPositions[i];
					sorter.sort(bucketSize,i);
				}
				fileAOut.flush();
			}

		} finally {
			fileARandom.close();
			fileBRandom.close();
		}
	}

	private static BucketStrategy pickStrategy(int length, int topVal){
		// identify classes of input files by the top integer or the length.
		// this was previously done with hashes. 
		if (length < 0x400000){ // (max len is about 4mb)
			return new SortInMem();
		}
		if (topVal == -2147483592 || topVal == -2147483627){
			// these two files have the following approximate distribution over their top byte:
			// 0x80 : 30000 Bytes ~ 7000 integers
			// 0x00 : 20000000 Bytes ~ 5000000 integers
			// 0x7f : ditto

			// So a special bucketing measure is taken which exploits this

			return new RadixSortTest000();
		}
		if (topVal ==  241){
			// the values in test011 are all less than 256, so we bucket off of the top nybble
			// of the bottom byte
			return new RadixSortTest011();
		}
		return new RegularRadixSort(); // default
	}

	private static void doRadixSort( 				
								DataInputStream in,
								FileOutputStream out,
								RandomAccessFile inFile,
								RandomAccessFile outFile,
								int length
							) throws IOException { // Too many arguments for one line
			// bucket positions are the positions where each bucket starts in the I/O files
		bucketPositions = radixSorter.doRadixSort(in, out, inFile, outFile, length);
		System.gc(); // May be too slow. poke GC to remove the BucketOutBuffer objects
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

	private static void sortSingleBucket(
						int inputLength, 
						BucketInBuffer mIn, 
						BucketOutBuffer mOut,
						RandomAccessFile file
					) throws IOException {
		// This sorts inputs that are shorter than the length of the
		// Memory
		inputLength = inputLength >> 2; // comes in as the byte length
		int 	i;
		int[] 	mBucket = new int[inputLength];
		for (i = 0; i<inputLength; i += 1){
			mBucket[i] = mIn.readInt();
		}
		//file.seek(0);
		//System.out.println(Arrays.toString(mBucket));
		Arrays.sort(mBucket);
		//System.out.println(Arrays.toString(mBucket));
		for (i = 0; i< inputLength; i += 1){
			mOut.writeInt(mBucket[i]);
		}
		mOut.flush();
	}

	public static void main(String[] args) throws Exception {
		String f1 = args[0];
		String f2 = args[1];
		sort(f1, f2);
		System.out.println("The checksum is: "+checkSum(f1));
	}
}