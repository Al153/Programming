// 1. Provide an implementation for:
// template<class T> T Stack<T>::pop(){
// template<class T> Stack<T>::~Stack();
#include <stdio.h>
#define STACK_SIZE 1024

using namespace std;
template<class T> class Stack
{
private:
	int stp;
	T *array;
public:
	Stack<T>(void);
	~Stack<T>(void);

	T pop(void);
	void push(T value);

	Stack(const Stack &s);
	Stack<T>& operator=(const Stack& s);
};

template<class T> T Stack<T>::pop(void){
	if (stp <= 0){
		throw "Stack underflow";
	} else {
		return array[--stp];
	}
}

template<class T> void Stack<T>::push(T value){
	if (stp >= STACK_SIZE){
		throw "Stack overflow";
	} else {
		array[stp++] = value;
	}
}

template<class T> Stack<T>::Stack(void){
	this -> array = new T [STACK_SIZE];
	this -> stp = 0;
}

template<class T> Stack<T>::~Stack(void){
	delete this -> array;
}

// 2. Provide an implementation for:

template<class T> Stack<T>::Stack(const Stack<T>& s){
	this->array = new T[STACK_SIZE];
	for (this->stp = 0; this -> stp < s.stp; (this->stp)++){
		this->array[stp] = s.array[stp];
	}
}
template<class T> Stack<T>& Stack<T>::operator=(const Stack<T>& s){
	return new Stack<T>(s);
}

// 3. Using meta programming, write a templated class prime, which evaluates whether a literal
// integer constant (e.g. 7) is prime or not at compile time.

template <unsigned int n, unsigned int m>
struct prime {
	static const bool prim = (n%m > 0) && prime<n,m-1>::prim;
};

template <unsigned int n>
struct prime<n,1>
{
	static const bool prim = true;
};

template <unsigned int n>
struct  is_prime
{
	static const bool prim = prime<n,n-1> :: prim;
};

// 4. How can you be sure that your implementation of class prime has been evaluated at
// compile time?

class foo {
public:
	int i;
	foo(int j): i(j){}
	~foo(void){}
	foo(void): i(0){} // I just wanted an uninitialized array. Maybe it would have been better to have used pointers to objects.
};

int main(int argc, char const *argv[])
{
	Stack<foo> s;
	Stack<foo> t = s;
	s.push(foo(1));
	s.push(foo(2));
	t.push(foo(3));


	printf("%i\n", s.pop().i);
	printf("%i\n", s.pop().i);
	printf("%i\n", t.pop().i);

	printf("%i\n", is_prime<2>::prim);
	printf("%i\n", is_prime<3>::prim);
	printf("%i\n", is_prime<4>::prim);
	printf("%i\n", is_prime<5>::prim);
	printf("%i\n", is_prime<6>::prim);
	printf("%i\n", is_prime<7>::prim);
	printf("%i\n", is_prime<8>::prim);
	printf("%i\n", is_prime<9>::prim);
	printf("%i\n", is_prime<10>::prim);

}