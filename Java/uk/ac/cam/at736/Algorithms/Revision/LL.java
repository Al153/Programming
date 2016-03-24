package uk.ac.cam.at736.Algorithms.Revision;

public class LL<K,P>{
	public LL<K,P> next;
	public K key;
	public P payload;

	public LL(K k, P p){
		key = k; payload = p; next = null;
	}

	private LL(K k, P p, LL<K,P> n){
		key = k; payload = p; next = n;
	}

	public LL<K,P> add(K k, P p){
		return new LL(k,p,this);
	}

	public P search(K k){
		if (k.equals(key)) return payload;
		else if (next != null) return next.search(k);
		else return null;
	}

}