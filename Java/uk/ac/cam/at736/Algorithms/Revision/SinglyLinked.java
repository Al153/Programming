package uk.ac.cam.at736.Algorithms.Revision;

public class SinglyLinked<V> {
	public SinglyLinked<V> next;
	public SinglyLinked<V> end;
	V value;

	public SinglyLinked(V v){
		value = v; next = null; end = this;
	}

	private SinglyLinked(V v, SinglyLinked<V> n, SinglyLinked<V> e;){
		value = v; next = n; end = e;
	}

	public SinglyLinked<V> add(V v){
		return new SinglyLinked<V>(v,this,this.end);
	}

	public void append(V,v){
		this.getEnd().next = SinglyLinked(v);
		this.end.end = end;
	}

	public SinglyLinked getEnd(SinglyLinked<v> n){
		if (n.end != n) {
			n.end = getEnd(n.end);
		}
		return end;
	}
}