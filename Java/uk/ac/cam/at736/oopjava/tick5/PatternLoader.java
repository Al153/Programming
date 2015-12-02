package uk.ac.cam.at736.oopjava.tick5;
import java.io.Reader;
import java.io.IOException;
import java.util.*;
import java.io.*;
import java.net.*;
public class PatternLoader {
	//Mixture of methods for getting patterns
	public static List<Pattern> load(Reader r) throws IOException {
		//TODO: Complete the implementation of this method.
	 	BufferedReader buff = new BufferedReader(r);
	 	List<Pattern> resultList = new LinkedList<Pattern>();
	 	String line = line = buff.readLine();
	 	while (line != null){
	 		try {
	 			Pattern p = new Pattern(line);
	 			resultList.add(p);
	 		} catch (PatternFormatException e){ 

	 		}
	 		line = buff.readLine();
	 	}
	 	return resultList;
	}
	public static List<Pattern> loadFromURL(String url) throws IOException {
		URL destination = new URL(url);
 		URLConnection conn = destination.openConnection();
 		return load(new InputStreamReader(conn.getInputStream()));
	}
	public static List<Pattern> loadFromDisk(String filename) throws IOException, java.security.AccessControlException {

		return load(new FileReader(filename));
	}
	public static void printPatterns(List<Pattern> ps){
		int count = 0;
		for (Pattern p : ps){
			System.out.print(count); System.out.println("\t" + p.getName() + "\t" + p.getAuthor());

			count++;
		}
	}
	public static List<Pattern> getPatterns(String patternSource) throws IOException,java.io.FileNotFoundException {
		//needs to find whether the patterns are in a file or a URL
		if (patternSource.startsWith("http://")){
			//URL
			return PatternLoader.loadFromURL(patternSource);
		} else {
			//file
			return PatternLoader.loadFromDisk(patternSource);
		}
	}
	
}