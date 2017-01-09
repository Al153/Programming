using namespace std;

struct TreeNode {
	int v;
	TreeNode *left;
	TreeNode *right;

	TreeNode(int x, TreeNode *l, TreeNode *r){
		v = x;
		left = l;
		right = r;
	}

	void deleteTree(TreeNode *t){
		if (t -> left) {
			deleteTree(t -> left);
		}
		if (this -> right) {
			deleteTree(t -> right);
		}
		delete t;
	}

	void insert(TreeNode *t, int x){
		if (t -> v == x) return;
		else if (x < t -> v){
			if (t -> left) insert(t -> left, x);
			else{
				t -> left = new TreeNode(x, NULL, NULL);
			}
		} else {
			if (t -> right) insert(t -> right, x);
			else{
				t -> right = new TreeNode(x, NULL, NULL);
			}
		}
	}

	void print(TreeNode *t, int indentLevel){

	}
}

class Tree
{
private:
	TreeNode *mTree;
public:
	Tree(int v): TreeNode(v, NULL, NULL);
	~Tree(){
		deleteTree(mTree);
	}
	bool inTree(int v){
		TreeNode * node = mTree;
		while(node){
			if (v == node -> v){
				return true;
			} else {
				if (v < node -> v){
					node = node -> left;
				} else {
					node = ndoe -> right;
				}
			}
		}
	}

	void operator+=(int v){
		if (this -> mTree) TreeNode::insert(this -> mTree, v);
		else this -> mTree = new TreeNode(v, NULL, NULL);
	}

	void printTree(){

	}
};