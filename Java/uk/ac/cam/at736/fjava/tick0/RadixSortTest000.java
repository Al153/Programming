package uk.ac.cam.at736.fjava.tick0;

/*
* This code provides an optimised bucket for the test cases 000 and 001.
* The distribution of the top byte of these is:
*  	0x80 : 30000 Bytes ~ 7000 integers
*	0x00 : 20000000 Bytes ~ 5000000 integers
*	0x7f : ditto
*
*
*
*/

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

public class RadixSortTest000 extends BucketStrategy {
	public RadixSortTest000(){
		BUFFER_NUMBER = 33;
		BUFFER_SIZE = (0x800000/BUFFER_NUMBER)&0xfffff000;
	}

/*Previous bucketing code:
*	
*	I am keeping this code commented, as it gives a better idea of what the 
*	branchless code below does.
*
*	protected int getBucket(int value){
*		if ((value>>24) + 128 == 0) return 0;
*		if (value>>24 == 0){
*			return ((value>>20)&15)+1; 
*		}  else {
*			return ((value>>20)&15)+17; 
*		}
*	}
*
*/

	// optimised to remove unecessary branching
	// In this exercise, branch prediction penalties are greatly outweighed by disk slow down
	// However, there's no reason not to eliminate branches 
	protected int getBucket(int value){
		int signIndicator	= (value >> 30)+2; // 0 => negative; 2 => top byte = 0; 3 => topByte = 7f
		int valueKey		= ((value >> 20)&15) + 1; // range: 1->16

		//top byte  | signIndicator  | signIndicator >> 1	|		signIndicator &1
		//___________________________________________________________________________
		//0x80		|	0			 |  0    				|		0
		//0x00		|	2            |  1    				|		0
		//0x7f		|	3            |  1    				|		1

		return (valueKey*(signIndicator>>1)) + 16*(signIndicator&1);
	}

}

