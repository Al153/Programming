/**
* this file defines a BucketSorter.
* This class loads a bucket from disk into a bucket-sized buffer, sorts it, and writes it into the target file
* 
*/

package uk.ac.cam.at736.fjava.tick0;
import java.util.Arrays;
import java.io.DataInputStream;
import java.io.DataOutputStream;

import java.io.IOException;

public class BucketSorter {
	private final int mMaxBucketSize;
	private DataOutputStream mOut;
	private DataInputStream mIn;
	private int[] mBucket;

	public int lowest;
	public int highest;

	public BucketSorter(DataInputStream in, DataOutputStream out, int bucketSize){
		mOut = out;
		mIn = in;
		mMaxBucketSize = bucketSize;
	}

	public void sort(int bucketSize, int number) throws IOException {
		bucketSize = bucketSize >> 2; // comes in as the byte length
		//System.out.println(" bucket size = " + bucketSize);
		if (bucketSize > mMaxBucketSize){
			// Todo: error handling
			System.out.println("Error: bucket too large.");
			throw new IOException("Error: a bucket was too large.");
		}


		int i;
		mBucket = new int[bucketSize];
		for (i = 0; i<bucketSize; i += 1){
			mBucket[i] = mIn.readInt();
		}


		// ______________________________________________________DEBUG_______________________________________________________
			Arrays.sort(mBucket);
			//if (bucketSize > 0){
			//	lowest = mBucket[0];
			//	highest = mBucket[bucketSize-1];
			//}
		// ______________________________________________________DEBUG_______________________________________________________
		for (i = 0; i< bucketSize; i += 1){
			mOut.writeInt(mBucket[i]);
		}
		mOut.flush();
		mBucket = null;
	}
}