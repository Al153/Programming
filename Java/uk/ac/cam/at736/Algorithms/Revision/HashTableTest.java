package uk.ac.cam.at736.Algorithms.Revision;

public class HashTableTest extends HashTable<String,Integer>{
	public HashTableTest(){
		super(10);
	}

	public int hashFun(String s){
		return s.length();
	}
}