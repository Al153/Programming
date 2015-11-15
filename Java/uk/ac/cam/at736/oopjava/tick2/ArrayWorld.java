package uk.ac.cam.at736.oopjava.tick2;
import uk.ac.cam.acr31.life.World;
import java.io.Writer;
import java.awt.Graphics;
import java.io.PrintWriter;
import java.io.OutputStreamWriter;

public class ArrayWorld extends WorldImpl {
	private boolean[][] cells;
	public ArrayWorld(int w, int h) {
		super(w,h);
		cells = new boolean[h][w];
	}
	protected ArrayWorld(WorldImpl prev){
		super(prev);
		cells = new boolean[getHeight()][getWidth()];
	}
	public boolean getCell(int col, int row) {
		if (row < 0 || row > super.getHeight() - 1) return false;
   		if (col < 0 || col > super.getWidth() - 1) return false;
   		return cells[row][col];
	}

	public void setCell(int col, int row, boolean alive) { 

		if (row < 0 || row > cells.length - 1) return;
   		if (col < 0 || col > cells[row].length - 1) return ;

   		cells[row][col] = alive;
   	}

	protected ArrayWorld nextGeneration() {
		//Construct a new ArrayWorld object to hold the next generation:
		ArrayWorld world = new ArrayWorld(this);
		
		for (int row = 0;row<world.getHeight();row++){
			for (int col = 0; col<world.getWidth();col++){
				boolean newCell = super.computeCell(col,row);
				world.setCell(col,row,newCell);
			}

		}
		return world;
	}
}