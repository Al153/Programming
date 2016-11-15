class LinkList
{
	public:
		LinkList(int numbers[], int l){
			if (l>0)	
		}
		
		~LinkList();
	
};

class LinkListNode
{
	public: 
}

1 int main() {
2 int test[] = {1,2,3,4,5};
3 LinkList l1(test+1,4), l2(test,5);
4 LinkList l3=l2, l4;
5 l4=l1;
6 printf("%d %d %d\n",l1.pop(),l3.pop(),l4.pop());
7 return 0;
8 }