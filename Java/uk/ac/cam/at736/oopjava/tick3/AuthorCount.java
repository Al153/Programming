package uk.ac.cam.at736.oopjava.tick3; 

public class AuthorCount implements Comparable<AuthorCount> {
	private String author;
	private int count;
	public AuthorCount(String author) {
		this.author = author;
		this.count = 1;
	}
	public void inc() {
		count++;
	}
	@Override
	public int hashCode() {
		return this.author.hashCode();
	}
	@Override
	public boolean equals(Object obj) {
		if (obj instanceof AuthorCount) {
			return obj.hashCode() == this.hashCode();
		} else return false;
	}
	@Override
	public int compareTo(AuthorCount o) {
		if (this.getCount()<o.getCount()) return 1;
		else if(this.getCount()>o.getCount()) return -1;
//		else if(this.hashCode()<o.hashCode()) return 1;
//		else if(this.hashCode()>o.hashCode()) return -1;
		else return this.getAuthor().compareTo(o.getAuthor());

		//TODO: return 1 if 'this' rank orders before 'o',
		// return 0 if 'this' and 'o' are equal, and -1 otherwise.
		// to do so order first by this.count, and if counts are equal,
		// then order by author.count as a tie-breaker.
	}
	@Override
	public String toString() {
		//TODO: return a string whose:
		// first 20 characters contains the author name (left-aligned)
		// and final 3 characters contains the count (right-aligned)	
		//Hint: You might find String.format(...) helpful here.

		return String.format("%-20s%3d",this.author,this.count);
	}
	public String getAuthor(){
		return this.author;
	}
	public int getCount(){
		return this.count;
	}
}