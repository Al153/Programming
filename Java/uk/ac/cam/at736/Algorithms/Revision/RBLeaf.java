package uk.ac.cam.at736.Algorithms.Revision;
 
public class RBLeaf<Key extends Comparable<Key>,Value> extends RBNode<Key,Value>{
	public RBLeaf(RBNode<Key,Value> p){
		super(Colour.BLACK,p); // leaves are always black
		super.type = NodeType.LEAF;
	}

	public void setColour(Colour c){
		return; // do nothing
	}
	public RBNode<Key,Value> getRChild() {
		System.out.println("ERROR, getting Rchild of a leaf");
		return null;
	}
	public RBNode<Key,Value> getLChild(){
		System.out.println("ERROR, getting Lchild of a leaf");
		return null;
	}
	public RBNode<Key,Value> rotateLeft(){
		System.out.println("ERROR, left-rotating a leaf");
		return null;
	}

	public RBNode<Key,Value> rotateRight(){
		System.out.println("ERROR, right-rotating a leaf");
		return null;
	}
	public void setRChild(RBNode<Key,Value> c){
		System.out.println("ERROR, setting R child of a leaf");
	}
	public void setLChild(RBNode<Key,Value> c){
		System.out.println("ERROR, setting L child of a leaf");
	}
	public Key getKey(){
		System.out.println("ERROR:  leaf has no key");
		return null;
	}
	public Value getValue(){
		System.out.println("ERROR: leaf has no value");
		return null;
	}
	public void setValue(Value v){
		System.out.println("ERROR: setting value of a leaf");
	}

}