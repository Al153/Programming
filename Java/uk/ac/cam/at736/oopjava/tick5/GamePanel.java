package uk.ac.cam.at736.oopjava.tick5;
import java.util.*;
import java.io.*;
import javax.swing.*;
import java.awt.*;
import uk.ac.cam.acr31.life.*;

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
			for(int col=0; col*zoom <this.width; ++col) {
				for(int row=0; row*zoom < height; ++row) {
					//get various values
					int colPos = (int)(col*zoom);
					int rowPos = (int)(row*zoom);
					int nextColPos = (int)((col+1)*zoom);
					int nextRowPos = (int)((row+1)*zoom);
					//draw two lines
					g.drawLine(colPos,rowPos,colPos,nextRowPos);
					g.drawLine(colPos,rowPos,nextColPos,rowPos);
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