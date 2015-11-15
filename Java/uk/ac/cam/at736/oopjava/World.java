package uk.ac.cam.at736.oopjava.tick2;
import java.io.Writer;
import java.awt.Graphics;
import java.io.PrintWriter;
import java.io.PrintWriter;
import java.io.OutputStreamWriter;


public interface World {
 public void setCell(int col, int row, boolean alive);
 public boolean getCell(int col, int row);
 public int getWidth();
 public int getHeight();
 public int getGeneration();
 public int getPopulation();
 public void print(Writer w);
 public void draw(Graphics g,int width, int height);
 public World nextGeneration(int log2StepSize)throws java.io.IOException ;
}