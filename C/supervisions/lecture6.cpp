#include <stdio.h>
using namespace std;


// 1. If a function f has a static instance of a class as a local variable, when might the class
// constructor be called?

//	 When the stack frame is created

// 2. Write a class Matrix which allows a programmer to define 2 × 2 matrices. Overload the
// common operators (e.g. +, -, *, and /)

class Vector{
private:
	double mX;
	double mY;
public:
	Vector(double x, double y) : mX(x), mY(y){}
	double getX(void);
	double getY(void);
	double operator*(Vector v2);
	Vector operator+(Vector v2);
	Vector operator-(Vector v2);
	void print(void);
};

class Matrix{
private:
	double a;
	double b;
	double c;
	double d;
public:
	Matrix(double a, double b, double c, double d);
	void print(void);
	Matrix inverse(void);
	Matrix operator+(Matrix B);
	Matrix operator*(Matrix B);
	Matrix operator-(Matrix B);
	Matrix operator/(Matrix B);
	Vector operator*(Vector b);
};



Matrix::Matrix(double a, double b, double c, double d){
	this -> a = a; 
	this -> b = b; 
	this -> c = c; 
	this -> d = d; 
}
void Matrix::print(void){
	printf("|%lf, %lf|\n|%lf %lf|\n\n", this -> a, this -> b, this -> c, this -> d);
}

Matrix Matrix::inverse(void){
	double determinant = (this->a)*(this->d) - (this->b)*(this->c);
	return Matrix(d/determinant, -b/determinant, -c/determinant, a/determinant);
}

Matrix Matrix::operator+(Matrix B){
	return Matrix(a+B.a, b+B.b, c+B.c, d+B.d);
}

Matrix Matrix::operator*(Matrix B){
	return Matrix(a*B.a + b*B.c, a*B.b + b*B.d, c*B.a + d*B.c, c*B.b + d*B.d);
}

Matrix Matrix::operator-(Matrix B){
	return Matrix(a-B.a,b-B.b, c-B.c, d-B.d);
}

Matrix Matrix::operator/(Matrix B){
	Matrix A = *this;
	return A * (B.inverse());
}

Vector Matrix::operator*(Vector b){
	return Vector(a*b.getX()+this->b*b.getY(), c*b.getX()+d*b.getY());
}

// 3. Write a class Vector which allows a programmer to define a vector of length two. Modify
// your Matrix and Vector classes so that they interoperate correctly (e.g. v2 = m*v1 should
// work as expected)



double Vector::getX(void) { return mX;}
double Vector::getY(void) { return mY;}
double Vector::operator*(Vector v2){
	// dot product
	return mX * v2.mX + mY * v2.mY;

}
Vector Vector::operator+(Vector v2){
	return Vector(mX + v2.mX, mY + v2.mY);
}
Vector Vector::operator-(Vector v2){
	return Vector(mX - v2.mX, mY - v2.mY);
}

void Vector::print(void){
	printf("[%lf, %lf]\n\n",  mX, mY);
}


// 4. Why should destructors in an abstract class almost always be declared virtual?

//	Inherited classes will almost always have more members than their children/we don't know the internal structure of child classes



int main(int argc, char const *argv[])
{
	Matrix M(1.0, 2.0, 3.0, 4.0);
	Matrix P(-1.0, 0.0, 2.0, 1.0);
	Matrix N = M * P;

	M.print();
	P.print();
	N.print();

	Vector u = Vector(1.5, -1.0);
	Vector v = N * u;

	u.print();
	v.print();

	return 0;
}