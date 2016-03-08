package uk.ac.cam.at736.Algorithms.Tick3;

import uk.ac.cam.rkh23.Algorithms.Tick3.*;
//imports various data structures
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;
import java.util.Scanner;

import java.util.ArrayDeque;
import java.util.LinkedList;

public class Graph extends GraphBase {
	private int mFlowNetwork[][] = new int[super.mN][super.mN]; //flow network

	// 1) various constructors, just send call up the hierarchy
	public Graph(URL url) throws IOException {
		super(url);
	}

	public Graph(String file) throws IOException {
		super(file);
	}
	
	public Graph(int adj[][]) {
		super(adj);
	}

	// 2) implementing BFS based path finder
	public List<Integer> getFewestEdgesPath(int src, int target) throws TargetUnreachable{
		ArrayDeque<Integer> searchQueue = new ArrayDeque<Integer>(); // creates a queue to search with
		searchQueue.addLast(src);
		int predecessor[] = new int[super.mN]; // holds ther predecessor of each vertex
		boolean reachable[] = new boolean[super.mN]; // holds whether a vertex has been reached
		while (!searchQueue.isEmpty()){
			// in each iteration:
			//	- remove a node n from the queue
			// 	- for every vertex v adjacent to n, which hasn't yet been visited:
			//		- set the predecessor of v to n
			//		- set v as reachable
			int n = searchQueue.removeFirst(); // gets the node to search
			for (int v = 0; v < super.mN; v++){ // for every node
				if ((super.mAdj[n][v]-mFlowNetwork[n][v] >0) && !(reachable[v])){ // if it is reachable, but hasn't yet been reached
					predecessor[v] = n; //set het predecessor and the reached 
					reachable[v] = true;
					searchQueue.addLast(v);
					// I'm not sure whether to halt the search once target has been found
					// so I'm not going to halt it and process all the data
				}
			}
		}
		// now reconstruct the path
		LinkedList<Integer> path = new LinkedList<Integer>(); // creates a linked list, used as a stack
		int top = target;

		if (reachable[top]){ //if reachable
			path.push(top);
			while (top != src){ // walk the predecessor pointers to buiild the path
				top = predecessor[top];
				path.push(top);
			}		
		} else {
			throw new TargetUnreachable(); // throw an exception
		}
		return path;
	}


	public MaxFlowNetwork getMaxFlow(int s, int t){
		int flow = 0;
		int pFlow;
		List<Integer> p;

		while (true){ // while an augmenting path can be found
					// put as much extra flow through it as possible
			try {
				p = getFewestEdgesPath(s,t);
			} catch (TargetUnreachable f) { //when there are no more unused paths
				break;
			}
			pFlow = getPathCapacity(p); //gets the capacity of the path which isn't fully utilised
			flow += pFlow; // can add this amount of flow to the network

			updateNetwork(p,pFlow); 			//writes to the flow matrix
		}
		super.mAdj = mFlowNetwork; // gives network of flow
		return new MaxFlowNetwork(flow,this);
	}

	private int minimum(int a, int b){
		// helper method
		if (a<b) return a;
		return b;
	}

	int getPathCapacity(List<Integer> p){
		int f = 2147483647; // max value
		if (p.isEmpty()) return 0; // no flow at all
		int last = -1;
		for (int v: p){ //walks the path, finding the bottleneck on additional flow
			if (last == -1){
				last = v;
				continue;
			}
			f = minimum(f,mAdj[last][v]-mFlowNetwork[last][v]);
			last = v;
		}
		return f;

	}

	void updateNetwork(List<Integer> path, int m){
		int last = -1;
		for (int v: path){ //walks the path, updating flow network values
			if (last == -1){
				last = v;
				continue;
			}
			mFlowNetwork[last][v] += m;
			mFlowNetwork[v][last] -= m;
			last = v;
		}
	}

	void printPath(List<Integer> p){ //debugging method to print out a path
		for (int v: p){
			System.out.print(v);
			System.out.print(" -> ");
		}
	}
}