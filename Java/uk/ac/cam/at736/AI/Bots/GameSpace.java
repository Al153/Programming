package uk.ac.cam.at736.AI.Bots;

import java.util.*

public class GameSpace {
	private LinkedList<Sprite> subscribed;
	public void subscribe(Sprite s){
		// adds s to its internal list
		this.subscribed.add(s);
	}
	public void unsubscribe(Sprite s){
		this.subscribed.remove(s);
	}

	public void drawAll(){ // draws all children
		for (Sprite s: this.subscribed){
			s.draw();
		}
	}

	public void tickAll(double t){ // ticks all children
		for (Sprite s: this.subscribed){
			s.tick(t);
		}
	}

	public LinkedList<Sprite> getList(){
		return this.subscribed; // gets the whole list ( so the bots can test what they can see)
	}
 
}