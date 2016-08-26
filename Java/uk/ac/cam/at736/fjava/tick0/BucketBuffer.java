/**
* this file defines a BucketBuffer.
* When the radix sort phase is occurring, 256 bucketBuffers are created.
* They then abstract away the part of counting sort where values are written from the first file to the second using the histogram as a key
*/

package uk.ac.cam.at736.fjava.tick0;

import java.io.FileOutputStream;
import java.io.RandomAccessFile;

import java.io.IOException;

public class BucketBuffer {
	private int BUFFER_SIZE;
	private byte[] mBuffer = new byte[BUFFER_SIZE]; // a small buffer = 4mb / 256 buckets
	private int mBufferLength = 0;
	private int mOffset;
	private FileOutputStream mWriter;
	private RandomAccessFile mFile;

	public BucketBuffer(int startAddress, FileOutputStream writer, RandomAccessFile file, int bufferSize){
		// PRECONDITION: writer is a FileOutPutStream of file
		mOffset = startAddress; // start address is the BYTE address of the start of this buffer's position in file
		mFile = file;
		mWriter = writer;

		BUFFER_SIZE = bufferSize;
		//System.out.println("buffer size = " + BUFFER_SIZE);
		mBuffer = new byte[BUFFER_SIZE];
	}

	public void write(int i) throws IOException {
		// split up i into its bytes and store to the array
		// Data input/output require a big endian format.
		mBuffer[mBufferLength+3] = (byte) i;
		mBuffer[mBufferLength+2] = (byte) (i>>>8);
		mBuffer[mBufferLength+1] = (byte) (i>>>16);
		mBuffer[mBufferLength] = (byte) (i>>>24);


		// TODO: on the first filling of the buffer, flush when bufferLength+offset at the end of a segment 
		mBufferLength += 4;
		if (mBufferLength == BUFFER_SIZE){
			this.flush();
		}
	}

	public void flush() throws IOException {
		// writes the buffer's data to the disk
		// update the offset to take into account
		mFile.seek(mOffset);
		mWriter.write(mBuffer, 0, mBufferLength);
		mOffset += mBufferLength;
		mBufferLength = 0;
	}
}
