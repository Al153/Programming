package uk.ac.cam.at736.oopjava.tick2; 
import java.io.OutputStreamWriter;
import java.io.Writer;
import uk.ac.cam.acr31.life.World; 

public class RefactorLife{
	public static void play(World world) throws java.io.IOException {
	   	int userResponse = 0;
	   	Writer w = new OutputStreamWriter(System.out);


	   while (userResponse != 'q') {
			world.print(w);
	      	userResponse = System.in.read();
	      	world = world.nextGeneration(0);
	   }
	}


	public static void main(String[] args) throws java.io.IOException {
		if (args.length != 1 && args.length != 2) {
			System.out.println("RefactorLife [optional worldType] [pattern]");
			return;
		}
		String worldType = (args.length == 2)? args[0] : "--array";
		String worldPattern = (args.length == 2)? args[1] : args[0];

		//Check for a world type but no pattern
		if (args.length == 1){
			if (args[0].equals("--array") ||args[0].equals("--test")){
				System.out.println("Please specify a pattern."); return;
			}
		}


		World world = null;
		try{
			Pattern p = new Pattern(worldPattern);
			if (worldType.equals("--array")) {
				world = new ArrayWorld(p.getWidth(),p.getHeight());
			}else if (worldType.equals("--long")) {
				world = new PackedWorld();
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
	   	}
	}
}