package uk.ac.cam.at736.Algorithms.Revision;

import java.util.*;
public class BinomialTree {
	public int order;
	public SinglyLinked<BinomialTree> children;
	public value;
	public parent;

	public BinomialTree(int k){
		this.order = 0;
		this.children = null;
		this.value = k;
		this.parent = null;
	}

	public static BinomialTree merge(BinomialTree a, BinomialTree b){
		if (a.value<b.value){
			a.order += 1;
			a.children.append(b);
			b.parent = a;
			return a;
		} else {
			b.order += 1;
			b.children.append(a);
			a.parent = b;
		}
	}
}