package uk.ac.cam.at736.Algorithms.Revision;

public class RBFullNode<Key extends Comparable<Key>,Value> extends RBNode<Key,Value>{
	private RBNode<Key,Value> rChild;
	private RBNode<Key,Value> lChild;
	private Key mKey; private Value mValue;

	public RBFullNode(Key k, Value v, RBNode<Key,Value> p){
		super(Colour.RED,p);
		mKey = k; mValue = v;
		rChild = new RBLeaf<Key,Value>(this);
		lChild = new RBLeaf<Key,Value>(this);
		super.type = NodeType.FN;
	}

	public RBNode<Key,Value> getRChild(){return rChild;}
	public RBNode<Key,Value> getLChild(){return lChild;}
	public RBNode<Key,Value> rotateRight(){
		lChild.mParent = super.mParent;
		RBNode<Key,Value> temp = lChild;
		setLChild(temp.getRChild());
		temp.setRChild(this);
		return temp;
	}
	public RBNode<Key,Value> rotateLeft(){
		rChild.mParent = super.mParent;
		RBNode<Key,Value> temp = rChild;
		setRChild(temp.getLChild());
		temp.setLChild(this);
		return temp;
	}
	public void setRChild(RBNode<Key,Value> c){
		rChild = c;
		c.setParent(this);

	}
	public void setLChild(RBNode<Key,Value> c){
		lChild = c;
		c.setParent(this);
	}
	public Key getKey(){return mKey;}
	public Value getValue(){return mValue;}
	public void setValue(Value v){mValue = v;}
}