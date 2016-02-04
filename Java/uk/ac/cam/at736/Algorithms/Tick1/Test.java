package uk.ac.cam.at736.Algorithms.Tick1;
import uk.ac.cam.rkh23.Algorithms.Tick1.*;


public class Test {
	public static void main(String[] args){
		MaxCharHeap h = new MaxCharHeap("AbCdEfG");
		try{
			while (true) {
				System.out.println(h.getMax());
			}
		} catch (EmptyHeapException e){
			System.out.println("Hit exception");
		}

	}
}