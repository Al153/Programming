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

/* This class is part of the strategy pattern.
*  It deals with the infrastructure for bucketting.
*  Classes that extend it provide the function to pick buckets for values
*
*/

public abstract class BucketStrategy {
	protected int BUFFER_NUMBER;
	protected int BUFFER_SIZE;

	public static BucketBuffer[] createBuckets(int[] bucketSizes, FileOutputStream out, RandomAccessFile outFile, int bufferSize){
		// Converts bucketSizes into a histogram and creates the right number of bucket buffers
		BucketBuffer[] buckets = new BucketBuffer[bucketSizes.length - 1];
		int total = 0;
		int value;
		for ( int i = 0; i < bucketSizes.length - 1; i ++ ){
			value = bucketSizes[i];
			bucketSizes[i] = total;
			total += value;
			buckets[i] = new BucketBuffer(bucketSizes[i], out, outFile, bufferSize);
		}
		bucketSizes[bucketSizes.length -1] = total;
		return buckets;
	}

	protected abstract int getBucket(int value); // this 

	public int[] doRadixSort(
				DataInputStream in,
				FileOutputStream out,
				RandomAccessFile inFile,
				RandomAccessFile outFile,
				int length
			) throws IOException{

		// Does the radix sort
		int 	value;
		int 	i;
		int[]	bucketPositions = new int[BUFFER_NUMBER+1];

		for ( i = 0; i < length; i ++ ){ 
			value = getBucket(in.readInt());
			bucketPositions[value] += 4;
		}

		inFile.seek(0); // reset the input stream for a second run
		BucketBuffer[] buckets =  BucketStrategy.createBuckets(bucketPositions, out, outFile, BUFFER_SIZE);
		
		for (i = 0; i < length; i ++ ){
			value = in.readInt();
			buckets[getBucket(value)].write(value);
		}
		flushAllBuckets(buckets);
		return bucketPositions;
	}


	protected void flushAllBuckets(BucketBuffer[] buckets) throws IOException{
		// flush all buckets at the end of the sort
		for ( int i = 0; i < buckets.length; i ++ ){
			buckets[i].flush();
			buckets[i] = null;
		}
	}

	public void printHistogram(int[] bucketPositions){
		// Debugging and optimisation method which prints out the bucket sizes
		System.out.println("____________________________________Bucket sizes_________________________________");
		for ( int i = 0; i < bucketPositions.length; i ++ ){
			System.out.print(i + "\t: "+ bucketPositions[i] + "\t| ");
		}
	}

}