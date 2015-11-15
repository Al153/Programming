package uk.ac.cam.at736.oopjava.tick2;
import uk.ac.cam.acr31.life.World; 

public class Pattern {

   private String name;
   private String author;
   private int width;
   private int height;
   private int startCol;
   private int startRow;
   private String cells;
   //TODO: write public 'get' methods for EACH of the fields above;
   //      for instance 'getName' should be written as:


public String getName(){return name;}
public String getAuthor(){return author;}
public int getWidth(){return width;}
public int getHeight(){return height;}
public int getStartCol(){return startCol;}
public int getStartRow(){return startRow;}
public String getCells(){return cells;}







   public Pattern(String format) throws PatternFormatException{
      //TODO: initialise all fields of this class using contents of 
      //      'format' to determine the correct values.
   		String[] parts = format.split(":");
   		if (parts.length != 7) throw new PatternFormatException("Invalid pattern format: Incorrect number of fields in Pattern (found "+parts.length+").");
 		name = parts[0];
 		author = parts[1];
	 	try{
	 		width = Integer.parseInt(parts[2]);
	 	} catch (NumberFormatException e){
	 		throw new PatternFormatException ("Invalid pattern format: Couldn't interpret the width field as a number (\""+parts[2]+"\" given).");

	 	}
	 	try {
			height = Integer.parseInt(parts[3]);
		} catch (NumberFormatException e){
			throw new PatternFormatException ("Invalid pattern format: Couldn't interpret the height field as a number (\""+parts[3]+"\" given).");
	 	}
		try {
			startCol = Integer.parseInt(parts[4]);
	   	} catch (NumberFormatException e){
	   		throw new PatternFormatException ("Invalid pattern format: Couldn't interpret the startX field as a number (\""+parts[4]+"\" given).");
	   	}
	   	try {
	   		startRow = Integer.parseInt(parts[5]);
	   	}catch (NumberFormatException e){
			throw new PatternFormatException ("Invalid pattern format: Couldn't interpret the startY field as a number (\""+parts[5]+"\" given).");
	   	}
	   	cells = parts[6];
	   	
	 
   }

   public void initialise(World world) throws PatternFormatException {
	   	String[] rows = cells.split(" ");
	   	int rSize = rows.length;
	      	
	   	for (int y = 0; y<rSize; y++){
	   		char[] cellsArray = rows[y].toCharArray();
	   		int cSize = cellsArray.length;
	   		for (int x = 0; x<cSize; x++){
	   			if (cellsArray[x] == '1'){
	   				world.setCell(x+startCol,y+startRow,true);
	   			} else if(cellsArray[x] == '0'){
	   				world.setCell(x+startCol,y+startRow,false);
	   			} else throw new PatternFormatException("Invalid pattern format: Malformed pattern '"+cells+"'.");
	   		} 
	   	}
   }
} 