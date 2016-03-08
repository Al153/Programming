package uk.ac.cam.at736.Algorithms.Tick3;

import uk.ac.cam.rkh23.Algorithms.Tick3.*;
//imports various data structures
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.*;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;
import java.util.Scanner;

import java.util.ArrayDeque;
import java.util.LinkedList;

public class Test {
	public static void main(String[] args){

		URL url = null;
		try {
			url = new URL("http://www.cl.cam.ac.uk/teaching/1516/Algorithms/ticks/maxflow_test.01.in");
		} catch (MalformedURLException e) {
			System.out.println("MALFORMED URL");
			return;
		}
		Graph g = null;
		try {
			g = new Graph(url);
		} catch (IOException e){
			System.out.println("URL ERROR");
			return;
		}
		MaxFlowNetwork mfn = g.getMaxFlow(0,3);
		System.out.print("Flow = ");System.out.println(mfn.getFlow());
		GraphBase b = mfn.getNetwork();
		b.printFlowMatrix();

	}

}