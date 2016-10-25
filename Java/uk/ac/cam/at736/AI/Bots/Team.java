 package uk.ac.cam.at736.AI.Bots;

public class Team { // red or blue
	private Boundary boundary;
	private Vector startingPosition;




	// . . .

	public Vector getStart(){
		return this.startingPosition;
	}

	public Boundary getBoundary(){
		return this.boundary();
	}

}