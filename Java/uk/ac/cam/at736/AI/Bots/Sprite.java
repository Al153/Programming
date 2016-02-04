package uk.ac.cam.at736.AI.Bots;
public abstract class Sprite {
	private Vector position;
	private Vector velocity;
	private Vector acceleration;
	private GameSpace parent;
	private Boundary boundary;

	public Sprite(Vector position, Vector velocity, Vector acceleration, GameSpace parent, Boundary b){
		this.position = position;
		this.velocity = velocity;
		this.acceleration = acceleration;
		this.parent = parent;
		parent.subscribe(this);
	}

	public void tick(double t){
		this.velocity.addScale(this.acceleration,t);
		this.position.addScale(this.velocity,t);

		// check bounds
		if (position.getX()>boundary.maxX){
			position.setVector(boundary.maxX, position.getY());
		}
		if (position.getX()<boundary.minX{
			position.setVector(boundary.minX, position.getY());
		}
	}

	public void setAcceleration(Vector a){
		this.acceleration = a;
	}
	public GameSpace getParent(){return this.parent;}

	public abstract boolean testCollision(Sprite c); // tests if a point has collided with the sprite

	public abstract void draw(); // draws the sprite

	public abstract void whenHit(); // what to do when hit by a projectile
}