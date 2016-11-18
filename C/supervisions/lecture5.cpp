// 1. Write an implementation of a class LinkedList which stores zero or more positive integers
// internally as a linked list on the heap. The class should provide appropriate constructors
// and destructors and a method pop() to remove items from the head of the list. The method
// pop() should return -1 if there are no remaining items. Your implementation should
// override the copy constructor and assignment operator to copy the linked-list structure
// between class instances. You might like to test your implementation with the following:
// Hint: heap allocation & deallocation should occur exactly once!


//*******************************************************************



#include <stdio.h>
using namespace std;

class node
{
private:
    int value; 
    node * next;
public:
	node(int v, node *n): value(v), next(n){}
	~node(void);
	int getValue(void);
	node *getNext(void);
};



class LinkedList
{
private:
    node * head;
    int listLength;
    LinkedList(node *n);
    
public:
    LinkedList(void);
    LinkedList(int values[], int l);
    LinkedList(LinkedList &l);
   	void operator=(LinkedList &l);
    void push(int value);
    int pop(void);
    ~LinkedList(void);
    int getLength(void);
    node *getHead(void);
};


node *copyList(node *in){
	if (in) {
		return new node(in->getValue(),copyList(in -> getNext()));
	} else {
		return NULL;
	}
}

node::~node(void){}

int node::getValue(void){
	return this -> value;
}

node *node::getNext(void){
	return this -> next;
}

LinkedList::LinkedList()
{
   
  	head = NULL;
    listLength = 0;
}

LinkedList::LinkedList(int values[], int l){
	this -> head = NULL;
    this -> listLength = 0;
	if (l>0){
		for (int i = l-1; i >= 0; --i){
			this -> head = new node(values[i],this -> head);
		}
		listLength = l;
	}
}

LinkedList::LinkedList(node *n){
	this -> head = n;
}

LinkedList::LinkedList(LinkedList &l){
	this -> head = copyList(l.getHead());
}

void LinkedList::operator=(LinkedList &l){
	this -> head = copyList(l.getHead());
}

node *LinkedList::getHead(void){
	return head;
}

int LinkedList::getLength(void){
	return listLength;
}

void LinkedList::push(int value)
{
	if (value >= 0){
		this -> head = new node(value,this -> head);
    	listLength++;
	}
}

int LinkedList::pop()
{
    if (listLength = 0){
    	return -1;
    } else {
    	int v = this -> head -> getValue();
    	this -> head = this -> head -> getNext();
    	return v;
    }
}

LinkedList::~LinkedList() 
{
    node * p = head;
    node * q = head;
    while (q)
    {
        p = q;
        q = p -> getNext();
        if (q) delete p;
    }
}



int main() {
	int test[] = {1,2,3,4,5};
	LinkedList l1(test+1,4), l2(test,5);
	LinkedList l3=l2, l4;
	l4 = l1;
	printf("%d %d %d\n",l1.pop(),l3.pop(),l4.pop());
	return 0;
}