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


public class test {
	private static final int FILE_BUFFER_SIZE = 16 * 8192;
	public static void main(String[] args) throws Exception {
		String f1 = args[0];
		String f2 = args[1];
		RandomAccessFile fileARandom = new RandomAccessFile(f1,"rw");
		RandomAccessFile fileBRandom = new RandomAccessFile(f2,"rw");
		int inputLength = (int) fileARandom.length();
		BucketInBuffer fileAIn 	= new BucketInBuffer(
										new  DataInputStream(
											new BufferedInputStream(
												new  FileInputStream(fileARandom.getFD())
											)
										), fileBRandom, FILE_BUFFER_SIZE
									);
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

		for (int i = 0; i < inputLength; i+=4){
			int val = fileAIn.readInt();
			if (i < 64){
				System.out.println(Integer.toHexString(val));
			}
			fileBOut.writeInt(val);
		}
		fileBOut.flush();

	}
}