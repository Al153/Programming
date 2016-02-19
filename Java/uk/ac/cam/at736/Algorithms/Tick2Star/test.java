package uk.ac.cam.at736.Algorithms.Tick2Star;


public class test {
	public static void main(String[] args){
		LCSTopDownRecursive tester = new  LCSTopDownRecursive("","");//"xaxbxcxd","aabbccdd");
		System.out.println(tester.getLCSLength());
		tester.printTable();

		System.out.println(tester.getLCSString());
	}
}