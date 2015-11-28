package uk.ac.cam.at736.oopjava.tick3; 

import java.util.*;

public class CollectionTest {
 	public static List<AuthorCount> processWithList(List<Pattern> patterns) {
		LinkedList<AuthorCount> list = new LinkedList<AuthorCount>();
		for(Pattern p : patterns) {
			//O(N^2 + time for sort (N Log N))
			//push operation is O(1), but has to search the list for each obeject first, which is O(N)*O(N)
			//sorting is probably N log N
			AuthorCount a = new AuthorCount(p.getAuthor());
			int i = list.indexOf(a);
			if (i>=0) {
				list.get(i).inc();
			} else {
				list.push(a);
			}
		//TODO: determine if a suitable AuthorCount objects exists in
		//'list' if so, increment the count for this author; if not add
		//a suitable object to the list


		}
		Collections.sort(list);
		return list;
	}
	public static List<AuthorCount> processWithMap(List<Pattern> patterns) {
		//O(N log N) - the adds to map depend on implementation, but either N log n (tree) or linear - array
		//N log N to sort
		Map<String,AuthorCount> map = new HashMap<String,AuthorCount>();
		for(Pattern p : patterns) {
			AuthorCount a = new AuthorCount(p.getAuthor());
			if (map.containsKey(p.getAuthor())){
				map.get(p.getAuthor()).inc();
			} else {
				map.put(p.getAuthor(),a);
			}
		}
		//TODO: copy set of AuthorCount objects associated with 'map' into
		//an ArrayList. Sort the list of AuthorCount objects and return it
		//to the caller.
		List<AuthorCount> list =  new ArrayList<AuthorCount>(map.values());
		Collections.sort(list);
		return list;
		}
	public static void main(String[] args) throws java.io.IOException {
		//TODO: write code in here to test both above implementations on the
		//System.out.println("|"+ new AuthorCount("hello").toString()+"|");
		List<Pattern> ps =  PatternLoader.getPatterns("http://www.cl.cam.ac.uk/teaching/current/OOProg/life.txt");
		List<AuthorCount> listed = processWithList(ps);
		List<AuthorCount> mapped = processWithMap(ps);
	}
}