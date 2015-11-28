class Methods {

	public List<Comparable> smallest(List<Comparable> l){
		Collections.sort(l);
		Comparable smallest = l[0];
		LinkedList<Comparable> result = new LinkedList<Comparable>();
		for (int i = 0; i<l.size && (l.get(i).equals(smallest)); i++){
			result.add(l.get(i));
		}
		return result;
	}

	public HashMap<String,Integer> createHashmap(String[] names, int[] ages){
		HashMap<String,Integer> result = new HashMap<String,Integer>();
		for (int i = 0; i<names.size; i++){
			result.put(names[i],new Integer(ages[i]));
		}
		return result;
	}
}