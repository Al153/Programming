package uk.ac.cam.at736.oopjava.tick3; 
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.*;
import uk.ac.cam.acr31.life.World;
import uk.ac.cam.acr31.life.WorldViewer;

public class LoaderLife{
	public static void play(World world) throws java.io.IOException {
	   	int userResponse = 0;
	   	Writer w = new OutputStreamWriter(System.out);

	   while (userResponse != 'q') {
			world.print(w);
	      	userResponse = System.in.read();
	      	world = world.nextGeneration(0);

	  	}
	}

	public static void playGraphics(World world)throws java.io.IOException {
	   	int userResponse = 0;
		WorldViewer viewer = new WorldViewer();

	   while (userResponse != 'q') {
			viewer.show(world);
	      	userResponse = System.in.read();
	      	world = world.nextGeneration(0);

	  	}
	  	viewer.close();
	}


	public static void main(String[] args) throws java.io.IOException {

		if (args.length <1 || args.length >3) { System.out.println("LoaderLife [optional worldType] [patternSource] [option patternIndex]");
				return;
			}

		World world = null;
		String patternSource = (args.length == 3)? args[1] : args[0];
		List<Pattern> ps = null;
		try {
			ps = PatternLoader.getPatterns(patternSource);
		} catch (java.security.AccessControlException e){
			System.out.println("Please specify a pattern source.");
			return;
		} catch (java.io.FileNotFoundException e){
			System.out.println("An error occurred loading from URL: "+patternSource);
			return;
		}
		if (args.length == 1){
			PatternLoader.printPatterns(ps); 		//prints out patterns
		} else {
			if (args.length != 2 && args.length != 3) {
				System.out.println("LoaderLife [optional worldType] [patternSource] [option patternIndex]");
				return;
			}
			String worldType = (args.length == 3)? args[0] : "--array";
			int patternNo =0;
			try {
				patternNo = Integer.parseInt((args.length == 3)? args[2]:args[1]);
			} catch (NumberFormatException e) {
				System.out.println("Could not interpret patternIndex as an integer (given '"+((args.length == 3)? args[2]:args[1])+"').");
				return;

			}
			//Check for a world type but no pattern
			if (args.length == 2){
				if (args[0].equals("--array") || args[0].equals("--test")){
					System.out.println("Please specify a pattern source."); return;
				}
			}
			try{
				Pattern p = ps.get(patternNo);
				if (worldType.equals("--array")) {
					world = new ArrayWorld(p.getWidth(),p.getHeight());
				}else if (worldType.equals("--long")) {
					world = new PackedWorld();
				} else if (worldType.equals("--aging")){
					world = new AgingWorld(p.getWidth(),p.getHeight());
				} else {
					System.out.println("Error: the world can only be of type --array or --long");
					return;
				}
				p.initialise(world);
				play(world);
			} catch (PatternFormatException e){
	   			System.out.println(e.getMessage());
	   		} catch (NumberFormatException e) {
	   			System.out.println("Could not interpret a field");
	   		} catch (IndexOutOfBoundsException e) {
	   			System.out.println("Chosen index number not present in list.");
	   		}

		}

		

	}
}