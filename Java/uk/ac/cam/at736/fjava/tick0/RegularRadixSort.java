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
* Handles bucketing for a evenly distributed large file
* look at top 5 bits only
*/

public class RegularRadixSort extends BucketStrategy {
	public RegularRadixSort(){
		BUFFER_NUMBER = 32;
		BUFFER_SIZE = (0x800000/BUFFER_NUMBER)&0xfffff000;
	}

	protected int getBucket(int value){
		return (value >> 27) +16;
	}
}

