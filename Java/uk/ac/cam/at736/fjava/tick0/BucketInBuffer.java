/**
* this file defines a BucketInBuffer.
* When the final phase is occurring, bucket 
* They then abstract away the part of counting sort where values are written from the first file to the second using the
* histogram as a key
*/

package uk.ac.cam.at736.fjava.tick0;

import java.io.FileInputStream;
import java.io.RandomAccessFile;
import java.io.DataInputStream;

import java.io.IOException;

public class BucketInBuffer {
	private int BUFFER_SIZE;
	private byte[] mBuffer; //  	  = new byte[BUFFER_SIZE]; // a small buffer = 4mb / 256 buckets
	private int mBufferPos = 0;
	private DataInputStream mReader;
	private RandomAccessFile mFile;
	private int mOffset = 0;

	public BucketInBuffer(DataInputStream reader, RandomAccessFile file, int bufferSize) throws IOException{
		// PRECONDITION: reader is a FileInputStream of file
		mFile = file;
		mReader = reader;
		BUFFER_SIZE = bufferSize;
		mBuffer = new byte[BUFFER_SIZE];
		refresh();
	}

	public int readInt() throws IOException {
		if (mBufferPos == BUFFER_SIZE){
			this.refresh();
		}

		int retValue = (((int) (mBuffer[mBufferPos+3]))&0xff);

		//System.out.println("Val = " + retValue);
		retValue = retValue | ((((int) (mBuffer[mBufferPos+2]))&0xff)<<8);
		//System.out.println("Val = " + retValue);
		retValue = retValue | ((((int) (mBuffer[mBufferPos+1]))&0xff)<<16);
		//System.out.println("Val = " + retValue);
		retValue = retValue | ((((int) mBuffer[mBufferPos])&0xff)<<24);

		//System.out.println("Val = " + retValue);

		mBufferPos += 4;


		return retValue;
	}

	public void refresh() throws IOException {
		// read into buffer from the disk
		// update the offset to take into account
		System.out.println("Refreshing");
		mFile.seek(mOffset);
		mReader.read(mBuffer, 0, BUFFER_SIZE);
		mOffset += BUFFER_SIZE;
		mBufferPos = 0;
	}
}
