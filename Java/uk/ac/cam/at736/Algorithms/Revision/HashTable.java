package uk.ac.cam.at736.Algorithms.Revision;


import java.util.*;

public abstract class HashTable<A,B>{ //abstract so can have a hash function
	private ArrayList<LL<A,B>> table;

	protected HashTable(int size){ // customiseable size
		table = new ArrayList(size);
		for (int i = 0; i<size; i++){
		table.add(null);
		}
	}

	public void insert(A k, B p){
		int hashedKey = hashFun(k);
		if (table.get(hashedKey) == null) table.set(hashedKey,new LL<A,B>(k,p));
		else table.set(hashedKey,table.get(hashedKey).add(k,p));
	}

	public B lookup(A k){
		int hashedKey = hashFun(k);
		if (table.get(hashedKey) == null) return null;
		else return table.get(hashedKey).search(k);
	}

	public abstract int hashFun(A k); // up to implementor
}