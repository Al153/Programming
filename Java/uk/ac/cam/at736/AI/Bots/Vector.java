public uk.ac.cam.at736.AI.Bots;

public class Vector { // class representing a 2d vector
	private double[] v;

	public Vector(double x, double y){ // create a vector
		v[0] = x;
		v[1] = y;
	}

	public void setVector(double x, double y){ // set the vector
		v[0] = x;
		v[1] = y;
	}

	public double getX(){ // get the values
		return x[0];
	}

	public double getX(){
		return x[0];
	}

	private void add(Vector that){ // add a vector
		this.v[0] += that.getX();
		this.v[1] += that.getY();
	}

	private void addScale(Vector that, double s){
		this.v[0] += that.getX() * s;
		this.v[1] += that.getY() * s;
	}

	private int dot(Vector that){ // dot a vector
		return this.v[0] * that.getX() + this.v[1] * that.getY();
	}
}