package uk.ac.cam.at736.fjava.tick0;
import java.io.RandomAccessFile;


import java.io.BufferedOutputStream;
import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.FileInputStream;
import java.io.DataOutputStream;
import java.io.DataInputStream;
import java.io.OutputStream;
import java.io.FileOutputStream;
import java.io.ObjectOutputStream;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.security.DigestInputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

interface IntWriter {
	void write(int[] ints);
}
public class tests { 
	private static final int NUM_INTS = 1000000;
	public static void main(String[] args) {
		int[] ints = new int[NUM_INTS];
		Random r = new Random();
		for (int i=0; i<NUM_INTS; i++) {
			ints[i] = r.nextInt();
		}
		time("DataOutputStream", new IntWriter() {
			public void write(int[] ints) {
				storeDO(ints);
			}
		}, ints);
		time("ObjectOutputStream", new IntWriter() {
			public void write(int[] ints) {
				storeOO(ints);
			}
		}, ints);
	}
	
	private static void time(String name, IntWriter writer, int[] ints) {
		long start = System.nanoTime();
		writer.write(ints);
		long end = System.nanoTime();
		double ms = (end - start) / 1000000d;
		System.out.printf("%s wrote %,d ints in %,.3f ms%n", name, ints.length, ms);
	}
	
	private static void storeOO(int[] ints) {
		ObjectOutputStream out = null;
		try {
			out = new ObjectOutputStream(new FileOutputStream("object.out"));
			out.writeObject(ints);
		} catch (IOException e) {
			throw new RuntimeException(e);
		} finally {
			safeClose(out);
		}
	}
	
	private static void storeDO(int[] ints) {
		DataOutputStream out = null;
		try {
			out = new DataOutputStream( new BufferedOutputStream(new FileOutputStream("data.out")));
			for (int anInt : ints) {
				out.write(anInt);
			}
		} catch (IOException e) {
			throw new RuntimeException(e);
		} finally {
			safeClose(out);
		}
	}
	
	
	private static void safeClose(OutputStream out) {
		try {
			if (out != null) {
				out.close();
			}
		} catch (IOException e) {
			// do nothing
		}
	}
}