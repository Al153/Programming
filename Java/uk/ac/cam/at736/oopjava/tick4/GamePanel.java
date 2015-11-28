package uk.ac.cam.at736.oopjava.tick4;
import java.util.*;
import java.io.*;
import javax.swing.*;
import java.awt.BorderLayout;

public class GamePanel extends JPanel {
	private int zoom = 10; //Number of pixels used to represent a cell
	private int width = 1; //Width of game board in pixels
	private int height = 1;//Height of game board in pixels
	private World current = null;
	
	public Dimension getPreferredSize() {
		return new Dimension(width, height);
	}
	
	protected void paintComponent(Graphics g) {
		super.paintComponent(g);
		if (current == null) return;	
		g.setColor(java.awt.Color.WHITE);
		g.fillRect(0, 0, width, height);
		current.draw(g, width, height);
		if (zoom > 4) {
			g.setColor(java.awt.Color.LIGHT_GRAY);
			g.draw
			//TODO: Using for loops call the drawLine method on "g",
			// repeatedly to draw a grid of grey lines to delimit
			// the border of the cells in the game board
			int worldWidth = this.world.getWidth();
			int worldHeight = this.world.getHeight();
			double colScale = (double)width/(double)worldWidth;
			double rowScale = (double)height/(double)worldHeight;
			for(int col=0; col<worldWidth; ++col) {
				for(int row=0; row<worldHeight; ++row) {
					int colPos = (int)(col*colScale);
					int rowPos = (int)(row*rowScale);
					int nextCol = (int)((col+1)*colScale);
					int nextRow = (int)((row+1)*rowScale);
					if (g.hitClip(colPos,rowPos,nextCol-colPos,nextRow-rowPos)) {
						g.setColor(getCellAsColour(col, row));
						g.fillRect(colPos,rowPos,nextCol-colPos,nextRow-rowPos);
					}
				}
			}
		}
	}

	private void computeSize() {
		if (current == null) return;
		int newWidth = current.getWidth() * zoom;
		int newHeight = current.getHeight() * zoom;
		if (newWidth != width || newHeight != height) {
			width = newWidth;
			height = newHeight;
			revalidate(); //trigger the GamePanel to re-layout its components
		}
	}
	
	public void display(World w) {
		current = w;
		computeSize();
		repaint();
	}
}