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
* Handles bucketing for file 11 of the test pack
* file 11 has a narrow range, but lots of data
*
*
*
*/

public class NarrowFile11 extends BucketStrategy {
	public NarrowFile11(){
		BUFFER_NUMBER = 256;
		BUFFER_SIZE = (0x800000/BUFFER_NUMBER)&0xfffff000;
	}

	protected int getBucket(int value){
		// File 11 in the test pack has values between 0 and 512 only, so we look at bits 8:1 
		return (value>>1)&255;
	}
}






