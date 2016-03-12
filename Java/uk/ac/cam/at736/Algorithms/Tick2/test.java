package uk.ac.cam.at736.Algorithms.Tick2;


public class test {
	public static void main(String[] args){
		LCSBottomUp tester = new  LCSBottomUp("xaxbxcxd","aabbccdd");
		System.out.println(tester.getLCSLength());
		tester.printTable();

		System.out.println(tester.getLCSString());
	}
}