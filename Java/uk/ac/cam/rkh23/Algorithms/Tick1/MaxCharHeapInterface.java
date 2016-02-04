package uk.ac.cam.rkh23.Algorithms.Tick1;
public interface MaxCharHeapInterface {
       // Get the maximum value (or exception if empty) 
       public char getMax() throws EmptyHeapException;
       // Insert a new value into the heap
       public void insert(char i);
       // Get the number of items in the heap
       public int getLength();
}