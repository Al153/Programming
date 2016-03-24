package uk.ac.cam.at736.Algorithms.Revision;


public class RBTree<Key extends Comparable<Key>, Value> {
	private RBNode<Key, Value> mNodes;

	public RBTree(){
		mNodes = new RBLeaf<Key,Value>(null);
	}

	public Value lookup(Key k){
		return lookupRec(k,mNodes);
	}

	private Value lookupRec(Key k, RBNode<Key,Value> n){
		if (n.type == NodeType.LEAF) return null;

		if (k.compareTo(n.getKey()) == 0) return n.getValue();
		if (k.compareTo(n.getKey())<0) return lookupRec(k,n.getLChild());
		else return lookupRec(k,n.getRChild());
	}

	public void insert(Key k, Value v){
		RBNode<Key, Value> newNode = new RBFullNode<Key, Value>(k,v,null);
		insertRec(k,newNode,mNodes);
	}

	private void insertRec(Key k, RBNode<Key, Value> newNode, RBNode<Key,Value> n){
		if (n.type == NodeType.LEAF){
			this.mNodes = newNode; // first entry
			rebalance(newNode);
		}

		if (k.compareTo(n.getKey()) == 0) n.setValue(newNode.getValue()); // just update the value
		if (k.compareTo(n.getKey())<0){
			if (n.getLChild().type == NodeType.LEAF){
				n.setLChild(newNode);
				rebalance(newNode);
			} else {
				insertRec(k,newNode,n.getLChild());
			}
		}
		if (k.compareTo(n.getKey())>0) {
			if (n.getRChild().type == NodeType.LEAF){
				n.setRChild(newNode);
				rebalance(newNode);
			} else {
				insertRec(k,newNode,n.getRChild());
			}
		}
	}

	private void rebalance(RBNode<Key, Value> n){
		if (n.getParent() == null) n.setColour(Colour.BLACK); // top node
		else if(n.getParent().getColour() == Colour.BLACK) return; // just needs to be red
		else{
			RBNode<Key,Value> u = uncle(n);
			RBNode<Key,Value> g = grandparent(n);
			if (u != null && u.getColour() == Colour.RED){
				n.getParent().setColour(Colour.BLACK); // alternate the colours up
				u.setColour(Colour.BLACK);
				g.setColour(Colour.RED);
				rebalance(g); // recurse up
			}else{
				if ((n == n.getParent().getRChild()&& n.getParent() == g.getLChild())){
					n.getParent().rotateLeft();
					n = n.getLChild();
				} else if ((n == n.getParent().getLChild())&&n.getParent() == g.getRChild()){
					n.getParent().rotateRight();
					n = n.getRChild();
				}
				n.getParent().setColour(Colour.BLACK);
				g.setColour(Colour.RED);
				if (n == n.getParent().getLChild()) g.rotateRight();
				else g.rotateLeft();
			}


		}
	}
	

	private RBNode<Key,Value> grandparent(RBNode<Key,Value> n){
		if (n!= null)
			if(n.getParent() !=null) return n.getParent().getParent();
		return null;
	}

	private RBNode<Key,Value> uncle(RBNode<Key,Value> n){
		RBNode<Key,Value> g = grandparent(n);
		if (g == null) return null;
		if (n.getParent()==g.getLChild()) return g.getRChild();
		else return g.getRChild();
	}
}