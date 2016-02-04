package uk.ac.cam.at736.Algorithms.Tick1Star;
import uk.ac.cam.rkh23.Algorithms.Tick1Star.*;
import java.util.*;

public class test {
	public static void main(String[] args){
	   	List<ComparisonCountingString> input = new ArrayList<ComparisonCountingString>();
  	 	input.add(new ComparisonCountingString("a"));  
  		input.add(new ComparisonCountingString("b"));
  		input.add(new ComparisonCountingString("c"));
  		input.add(new ComparisonCountingString("d"));
  		input.add(new ComparisonCountingString("e"));
  		input.add(new ComparisonCountingString("f"));
  		input.add(new ComparisonCountingString("g"));
  		input.add(new ComparisonCountingString("h"));
  		input.add(new ComparisonCountingString("i"));
  		input.add(new ComparisonCountingString("j"));
  		input.add(new ComparisonCountingString("k"));
  		input.add(new ComparisonCountingString("l"));


  		MaxHeap <ComparisonCountingString> mh = new MaxHeap<ComparisonCountingString>(input);
		//BottomUpMaxHeap<ComparisonCountingString> mh = new BottomUpMaxHeap<ComparisonCountingString>(input);
		try{
			while (true){
				System.out.println(mh.getMax());
			}
		} catch (EmptyHeapException e){
			System.out.println("Exception thrown.");
			System.out.println(ComparisonCountingString.getComparisonCount());
		}


		
	}
}