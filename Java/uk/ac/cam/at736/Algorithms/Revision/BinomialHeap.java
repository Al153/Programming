package uk.ac.cam.at736.Algorithms.Revision;

import java.util.*
public class BinomialHeap {
	private SinglyLinked<BinomialTree> trees;
	private SinglyLinked<BinomialTree> min;

	public BinomialHeap(){
		trees = null;
		min = null;
	}

	public void insert(int k){
		BinomialTree n = new BinomialTree(k);
		if (min == null) min = n;
		boolean isMin = false
		else if (k<min.value.value) isMin = true;
		trees = insertTree(n,trees,isMin);
	}

	public int extractMin(){
		for (BinomialTree t = trees; t != min; t = next);
	}

	public void decreaseKey(BinomialTree n, int k){
		n.value = k;
		if (n.parent != null){
			while (n.value<n.parent.value){
				int temp = n.value;
				n.value = n.parent.value;
				n.parent.value = temp;
				n = n.parent;
				if (n.parent == null) break;
			}
		}
		if (n.value<min.valuee.value){
			min = n;
		}

	}

	public void delete(BinomialTree n){
		decreaseKey(k,Integer.MIN_VALUE);
		extractMin();
	}

	private SinglyLinked<BinomialTree> insertTree(BinomialTree k, SinglyLinked<BinomialTree> l, boolean isMin){
		if (l == null){
			SinglyLinked<BinomialTree> result = new SinglyLinked<BinomialTree>(k);
			if (isMin) min = result;
			return result;
		}
		else if (k.order == l.value.order) return insertTree(BinomialTree.merge(k,l.value),l.next,isMin);
		else{
			result = add(l.value, insertTree(k,l.next));
			if (isMin) min = result;
			return result;
		}
	}


}