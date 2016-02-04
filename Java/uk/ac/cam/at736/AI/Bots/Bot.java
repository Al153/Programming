package uk.ac.cam.at736.AI.Bots;

// AI fighting bots 
public class Bot extends Sprite {
	private Team team;
	private int score;
	private GameSpace parent;

	private double linearVelocity; // stores direction and speed
	private double direction;
	private double viewAngle; // how far wide the bot can see

	public Bot(Team team, GameSpace parent){
		super(team.getStart(), new Vector(0.0,0.0), new Vector(0.0,0.0), parent, team.getBoundary);

		this.parent = parent;
	}
	// ______________________ commands controlled by NN __________________

	public void moveForward(){}
	public void moveBackward(){}
	public void turnLeft(){}
	public void turnRight(){}
	public void shoot(){}
	public void narrowView(){}
	public void widenView(){}

	//_______________________ scoring __________________

	@override
	public void tick(double t){
		// overrides tick by changing the values of velocity etc

		super.tick(t);

		// reset velocity
	}

	public void whenHit(){
		this.score -= 1;
	}

	public void score(){
		this.score += 2
	}

	public int getScore(){
		return this.score;
	}

	public void setScore(int s){
		this.score = s
	}

}