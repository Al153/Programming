package uk.ac.cam.at736.AI.Bots;
public class Projectile extends Sprite {
	private Bot shooter;

	public Projectile(Vector position, Vector velocity,GameSpace parent){
		super(position,velocity, new Vector(0.0,0.0), parent, parent.getBoundary());
	}
	public boolean testCollision(Sprite c){

	}


}