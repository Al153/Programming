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