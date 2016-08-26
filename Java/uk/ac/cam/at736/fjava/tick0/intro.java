package uk.ac.cam.at736.fjava.tick0;

import java.io.RandomAccessFile;
import java.io.DataOutputStream;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;

import java.io.IOException;
import java.io.FileNotFoundException;


public class intro {
	public static void main(String[] args) throws FileNotFoundException , IOException {
		// RandomAccessFile f = new RandomAccessFile("myFile.txt","rw");
		// f.writeInt(1); //write a "1" into the first four bytes of the file
		// f.writeInt(2); //write the value "2" after the value "1"
		// f.writeInt(3); //write the value "3" after the value "2"
		// f.seek(4); //file pointer now between fourth and fifth byte
		// System.out.println("Read four bytes as an int value "+f.readInt());
		// System.out.println("The file is "+f.length()+" bytes long");
	
		RandomAccessFile f = new RandomAccessFile("myFile2.txt","rw");
		DataOutputStream d = new DataOutputStream(
    		new BufferedOutputStream(new FileOutputStream(f.getFD())));
		d.writeInt(1); //write calls now only store primitive ints in memory
		d.writeInt(2);
		d.writeInt(3);
		d.flush(); //force the contents to be written to the disk. Important!
		f.seek(4);
		System.out.println("Read four bytes as an int value "+f.readInt());
		System.out.println("The file is "+f.length()+" bytes long");
	}
}
