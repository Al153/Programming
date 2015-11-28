package uk.ac.cam.at736.oopjava.tick3;
import uk.ac.cam.acr31.life.World;
import java.io.Writer;
import java.awt.Graphics;
import java.io.PrintWriter;
import java.io.OutputStreamWriter;

public class PackedWorld extends WorldImpl {
	private long cells;
	public PackedWorld() {
		super(8,8);
		cells = 0L;
	}
	protected PackedWorld(PackedWorld prev) {
		super(prev);
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
	
	
	protected PackedWorld nextGeneration(){
		//Construct a new PackedWorld object to hold the next generation:
		PackedWorld world = new PackedWorld(this);
		
		for (int row = 0;row<world.getHeight();row++){
			for (int col = 0; col<world.getWidth();col++){
				boolean newCell = super.computeCell(col,row);
				world.setCell(col,row,newCell);
			}

		}
		return world;
	}
}

//________ 
//________ 
//____###_ 
//____#_#_ 
//____#_#_ 
//________ 
//________ 
//________ 