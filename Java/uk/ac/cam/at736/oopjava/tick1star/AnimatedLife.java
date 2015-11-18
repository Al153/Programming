package uk.ac.cam.at736.oopjava.tick1star; 

public class AnimatedLife{
	public static boolean getCell(boolean[][] world, int col, int row){
		if (row < 0 || row > world.length - 1) return false;
   		if (col < 0 || col > world[row].length - 1) return false;

   		return world[row][col];
	}
	public static void setCell(boolean[][] world, int col, int row, boolean value){
		if (row < 0 || row > world.length - 1) return ;
   		if (col < 0 || col > world[row].length - 1) return ;
   		world[row][col] = value? true:false;
	}
	public static void print(boolean[][] world) { 
  		System.out.println("-"); 
   		for (int row = 0; row < world.length; row++) { 
      		for (int col = 0; col < world[row].length; col++) {
         		System.out.print(getCell(world, col, row) ? "#" : "_"); 
      			}
  			System.out.println(); 
   		} 
	}
	public static int countNeighbours(boolean[][] world, int col, int row){
		int count = 0;
		count += getCell(world,col+1,row)?1:0;
		count += getCell(world,col+1,row+1)?1:0;
		count += getCell(world,col,row+1)?1:0;
		count += getCell(world,col-1,row+1)?1:0;
		count += getCell(world,col-1,row)?1:0;
		count += getCell(world,col-1,row-1)?1:0;
		count += getCell(world,col,row-1)?1:0;
		count += getCell(world,col+1,row-1)?1:0;
		return count;
	}
	public static boolean computeCell(boolean[][] world, int col, int row){
		
   		// liveCell is true if the cell at position (col,row) in world is live
   		boolean liveCell = getCell(world, col, row);
			
   		// neighbours is the number of live neighbours to cell (col,row)
   		int neighbours = countNeighbours(world, col, row);
		//System.out.print(neighbours);System.out.println(liveCell);
   		// we will return this value at the end of the method to indicate whether 
   		// cell (col,row) should be live in the next generation
   		boolean nextCell = liveCell;
			
   		//A live cell with less than two neighbours dies (underpopulation)
   		if (neighbours < 2) nextCell = false;
		 
   		//A live cell with two or three neighbours lives (a balanced population)
   		if (neighbours==3) nextCell = true;

		
   		//A live cell with with more than three neighbours dies (overcrowding)
  
		if (neighbours > 3) nextCell = false;
   		//A dead cell with exactly three live neighbours comes alive
   
		//System.out.println(nextCell);
   		return nextCell;
	}
	public static boolean[][] nextGeneration(boolean[][] world){
		boolean[][] newWorld = new boolean[world.length][world[0].length];
		for (int row = 0;row<world.length;row++){
			for (int col = 0; col<world[row].length;col++){
				setCell(newWorld,col,row,computeCell(world,col,row));
			}

		}

		return newWorld;
	}
	public static void play(boolean[][] world, int generations, OutputAnimatedGif g) throws java.io.IOException{
	   int elapsedGenerations = 0;
	   g.addFrame(world);
	   while (elapsedGenerations<generations) {
	      world = nextGeneration(world);
	   	  elapsedGenerations++;
	   	  g.addFrame(world);
	   }
	   g.close();

	}

	public static void main(String[] args) throws java.io.IOException {
		if (args.length != 3){
			System.out.println("Please specify a pattern, generation count, and output name.");
			return;
		}
	   	try{ 
	   		Pattern p = new Pattern(args[0]);
	   		boolean[][] world = new boolean[p.getHeight()][p.getWidth()];
	   		int generations = Integer.parseInt(args[1]);
	   		String name = args[2];
	   		OutputAnimatedGif graphics = new OutputAnimatedGif(name);
	   		p.initialise(world);
	   		play(world,generations,graphics);
	   	} catch (PatternFormatException e){
	   		System.out.println(e.getMessage());
	   	} catch (NumberFormatException e) {
	   		System.out.println("Could not interpret a field");
	   	}
	}
	public static String getPreferredPattern() {
 		//TODO change this to return your chosen pattern specification
 		return "Glider:Richard Guy:20:20:1:1:010 001 111";
	}
	public static int getPreferredGenerations() {
 		//TODO change this to specify the number of generations to run
		return 70;
	}

}
