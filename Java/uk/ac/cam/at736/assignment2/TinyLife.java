package uk.ac.cam.at736.assignment2; 

public class TinyLife{
	public static boolean getCell(long world, int col, int row){
		if (col<0 || col>=8 || row<0 || row>=8){
			return false;
		}else{
			return PackedLong.get(world,col+row*8);
		}
	}
	public static long setCell(Long world, int col, int row, boolean value){
		if (col<0 || col>=8 || row<0 || row>=8){
			return 0l;
		}else{
			return PackedLong.set(world,col+row*8,value);
		}
	}
	public static void print(long world) { 
  		System.out.println("-"); 
   		for (int row = 0; row < 8; row++) { 
      		for (int col = 0; col < 8; col++) {
         		System.out.print(getCell(world, col, row) ? "#" : "_"); 
      			}
  			System.out.println(); 
   		} 
	}
	public static int countNeighbours(long world, int col, int row){
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
	public static boolean computeCell(long world, int col, int row){
		
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
	public static long nextGeneration(long world){
		long newWorld = 0;
		for (int col = 0;col<8;col++){
			for (int row = 0; row<8;row++){
				newWorld = setCell(newWorld,col,row,computeCell(world,col,row));
			}

		}

		return newWorld;
	}
	public static void play(long world) throws java.io.IOException {
	   int userResponse = 0;
	   while (userResponse != 'q') {
	      print(world);
	      userResponse = System.in.read();
	      world = nextGeneration(world);
	   }
	}

	public static void main(String[] args) throws java.io.IOException {
	   play(Long.decode(args[0]));
	}
}