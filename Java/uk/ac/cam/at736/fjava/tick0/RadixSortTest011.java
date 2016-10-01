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
* Handles bucketing for test011 of the test pack
* file 11 has a narrow range, but lots of data.
* All values are less than 512 and are positive, so we look at the value ANDed with
* 0x000001f0
* 
*/

public class RadixSortTest011 extends BucketStrategy {
	public RadixSortTest011(){
		BUFFER_NUMBER = 32;
		BUFFER_SIZE = (0x800000/BUFFER_NUMBER)&0xfffff000;
	}

	protected int getBucket(int value){
		return (value&(31<<4))>>4;
	}
}

