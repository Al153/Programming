package uk.ac.cam.at736.oopjava.tick2;
import uk.ac.cam.acr31.life.World;
import java.io.Writer;
import java.awt.Graphics;
import java.io.PrintWriter;
import java.io.OutputStreamWriter;

public class TestPackedWorld implements World {
	private int generation;
	private int width;
	private int height;
	private long cells =0L;
	public TestPackedWorld() {
		width = 8;
		height = 8;
		generation = 0;
		cells = 0L;
	}
	protected TestPackedWorld(TestPackedWorld prev) {
		width = prev.width;
		height = prev.height;
		generation = prev.generation + 1;
		cells = 0L;
	}



	public boolean getCell(int col, int row) {


		if (col<0 || col>=8 || row<0 || row>=8){
			return false;
		}else{
			return PackedLong.get(cells,col+row*8);
		}
	}

	public void setCell(int col, int row, boolean alive) { 
		if (col<0 || col>=8 || row<0 || row>=8){
			cells =  0l;
		}else{
			cells =  PackedLong.set(cells,col+row*8,alive);

   		}
   	}
	public int getWidth() { return width; }
	public int getHeight() { return height; }
	public int getGeneration() { return generation; }
	public int getPopulation() { return 0; }

	public void print(Writer w) { 
		PrintWriter pw = new PrintWriter(w);
 		// See the Java documentation for PrintWriter
		 //
		 // use pw.print("something") to write to the writer
		 // use pw.println("something") to write a newline
		 //
		 // you must always call pw.flush() at the end of this method
		 // to force the PrintWriter to write to the terminal (if you
		 // do not, then data may be buffered inside PrintWriter).



  		pw.println("-"); 
   		for (int row = 0; row < height; row++) {
      		for (int col = 0; col < width; col++) {
         		pw.print(getCell(col, row) ? "#" : "_"); 
      			}
  			pw.println(); 
   		} 
		pw.flush();
	}
	public void draw(Graphics g, int width, int height) { /*Leave empty*/ }

	private TestPackedWorld nextGeneration(){
		//Construct a new TestPackedWorld object to hold the next generation:
		TestPackedWorld world = new TestPackedWorld(this);
		
		for (int row = 0;row<world.height;row++){
			for (int col = 0; col<world.width;col++){
				boolean newCell = computeCell(col,row);
				world.setCell(col,row,newCell);
			}

		}
		return world;
	}
	public World nextGeneration(int log2StepSize){
		TestPackedWorld world = this;
		//System.out.println(1<<log2StepSize);
		for (int i = 0; i<(1<<log2StepSize);i++){
			world = world.nextGeneration();
		}
	return world;
	}

	//////////////////////////// Auxiliary methods ///////////////////////

	private int countNeighbours( int col, int row){
		int count = 0;
		count += getCell(col+1,row)?1:0;
		count += getCell(col+1,row+1)?1:0;
		count += getCell(col,row+1)?1:0;
		count += getCell(col-1,row+1)?1:0;
		count += getCell(col-1,row)?1:0;
		count += getCell(col-1,row-1)?1:0;
		count += getCell(col,row-1)?1:0;
		count += getCell(col+1,row-1)?1:0;
		return count;
	}
	private boolean computeCell(int col, int row){
		
   		// liveCell is true if the cell at position (col,row) in world is live
   		boolean liveCell = getCell(col, row);
			
   		// neighbours is the number of live neighbours to cell (col,row)
   		int neighbours = countNeighbours(col, row);
		//pw.print(neighbours);pw.println(liveCell);
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
   		return nextCell;
	}

}