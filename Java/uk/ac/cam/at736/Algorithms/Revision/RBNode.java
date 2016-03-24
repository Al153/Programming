package uk.ac.cam.at736.Algorithms.Revision;

public abstract class RBNode<Key extends Comparable<Key>, Value>{
	protected Colour mColour;
	protected RBNode<Key,Value> mParent;
	public NodeType type;
	public RBNode(Colour c, RBNode<Key,Value> p){
		mColour = c;
		mParent = p;
	}
	public Colour getColour(){ return mColour;}
	public void setColour(Colour c){ mColour = c;}
	public RBNode<Key,Value> getParent(){ return mParent;}
	public void setParent(RBNode p){mParent = p;}

	public abstract RBNode<Key,Value> getRChild();
	public abstract RBNode<Key,Value> getLChild();
	public abstract RBNode<Key,Value> rotateLeft();
	public abstract RBNode<Key,Value> rotateRight();
	public abstract void setRChild(RBNode<Key,Value> c);
	public abstract void setLChild(RBNode<Key,Value> c);
	public abstract Key getKey();
	public abstract Value getValue();
	public abstract void setValue(Value v);
}

