package uk.ac.cam.at736.oopjava.tick5;
import java.util.*;
import java.io.*;
import javax.swing.*;
import java.awt.BorderLayout;



public class PatternPanel extends JPanel {
	private JList guiList;

	public PatternPanel() {
		super();
		setLayout(new BorderLayout());
		guiList = new JList();	
		add(new JScrollPane(guiList));
	}
	
	public void setPatterns(List<Pattern> list) {
		ArrayList<String> names = new ArrayList<String>();
		for (Pattern p: list) {
			names.add(p.getName() + " ("+p.getAuthor()+")");
		}	
		guiList.setListData(names.toArray());
	}
}
