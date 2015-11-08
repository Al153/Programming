public class figure {
	protected Color color;
	public void setColor(Color c) {color = c;}
	public Color getColor() {return color;}
	public double perimeter(){return 0.0;}
	public double area(){return 0.0;}
}

public class Circle extends Figure{
	protected Point centre;
	protected double radius;
	public static final double pi = 3.14159265;
	public Circle(Point c, double r){
		centre = p;
		radius = r;
	}
	public void expand(double scale){
		radius *= scale;
	}
	public double perimeter(){
		return 2*pi*radius;
	}
	public double area(){
		return pi*radius*radius;
	}
}

public class Square extends Figure{
	protected Point upperLeft;
	protected double sideLength;
	public Square(Point u, double s){
		upperLeft = u;
		sideLength = s;
	}
	public double perimeter(){return 4.0*sideLength;}
	public double aread(){return sideLength*sideLength;}
}