#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// 1. What is the value of i after executing each of the following:
// (a) i = sizeof(char);
	// 1
// (b) i = sizeof(int);
	// 4
// (c) int a; i = sizeof a;
	// 4
// (d) char b[5]; i = sizeof(b);
	// 5
// (e) char *c=b; i = sizeof(c);
	// 4
// (f) struct {int d;char e;} s; i = sizeof s;
	// 8
// (g) void f(int j[5]) { i = sizeof j;}
	// 4
// (h) void f(int j[][10]) { i = sizeof j;}
	// 4
void q1(void){
	int i = sizeof(char);
	printf("%i\n", i);

	i = sizeof(int);
	printf("%i\n", i);
	
	int a; i = sizeof a;
	printf("%i\n", i);
	
	char b[5]; i = sizeof(b);
	printf("%i\n", i);
	
	char *c=b; i = sizeof(c);
	printf("%i\n", i);
	
	struct {int d;char e;} s; i = sizeof s;
	printf("%i\n", i);
	
	void f(int j[5]) { i = sizeof j; printf("%i\n", i);}
	int x[] = {1,2,3,4,5};
	f(x);

	void g(int j[][10]) { i = sizeof j; printf("%i\n", i);}

	int y[][10] ={};
	g(y);
	
}

// 2. Use struct to define a data structure suitable for representing a binary tree of integers.
// Write a function heapify(), which takes a pointer to an integer array of values and a
// pointer to the head of an (empty) tree and builds a binary heap of the integer array
// values. (Hint: you’ll need to use malloc())

struct heapNode {
	int value;
	struct heapNode *left;
	struct heapNode *right;
};

void printHeap(struct heapNode *heap, int indent){
	for (int i = 0; i < indent; i++){
		printf("\t");
	}
	if (heap == NULL){
		printf("Lf\n");
	} else {
		printf("%i : {\n", heap -> value);
		printHeap(heap -> left, indent + 1);
		printHeap(heap -> right, indent + 1);
		for (int i = 0; i < indent; i++){
			printf("\t");
		}
		printf("}\n");
	}

}

struct heapNode *insert(struct heapNode *tree, struct heapNode* new){
	if (tree != NULL){
		if (new -> value < tree -> value){
			new->left = tree -> left;
			new->right = tree -> right;
			struct heapNode *temp = new;
			new = tree;
			tree = temp;
		}
	
		struct heapNode *temp = tree -> right;					// weird switcharoo keeps heap balanced
		tree -> right = insert(tree -> left, new);
		tree -> left = temp;
		
		return tree;
	} else {
		return new;
	}

}

struct heapNode *heapify(struct heapNode *heap, int a[], int len){
	for (int i = 0; i < len; i++){
		struct heapNode *this = (struct heapNode *) malloc(sizeof(struct heapNode));
		this -> left = NULL;
		this -> right = NULL;
		this -> value = a[i];

		heap = insert(heap,this);
	}
	printHeap(heap,0);
}




// 3. What other C data structure can be used to represent a heap? Would using this structure
// lead to a more efficient implementation of heapify()?
	// Binary heap: an array of ints.
	// - more efficient in space, since children can be inferred from the current index, meaning less memory is stored
	// - naturally stays nearly full without having to impose the condition above, so has better asymptotic complexity
	// - less overhead from calling malloc repeatedly


void main(int argc, char const *argv[])
{
	q1();
	printf("\n");
	int a[] = {1,2,3,4,5,6,7};
	heapify(NULL,a,7);

}