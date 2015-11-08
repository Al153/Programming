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