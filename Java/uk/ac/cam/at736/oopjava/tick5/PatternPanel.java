package uk.ac.cam.at736.oopjava.tick5;
import java.util.*;
import java.io.*;
import javax.swing.*;
import javax.swing.event.*;
import java.awt.BorderLayout;



public abstract class PatternPanel extends JPanel {
	private JList guiList;
	private Pattern currentPattern;
	private List<Pattern> patternList;

	public PatternPanel() {
		super();
		currentPattern = null;
		setLayout(new BorderLayout());
		guiList = new JList();	
		add(new JScrollPane(guiList));
		guiList.addListSelectionListener(new ListSelectionListener() {
			public void valueChanged(ListSelectionEvent e) {
				if (!e.getValueIsAdjusting() && (patternList != null)) {
					int sel = guiList.getSelectedIndex();
					if (sel != -1) {
						currentPattern = patternList.get(sel);
						onPatternChange();
					}
				}
			}
		});
	}
	
	public abstract void onPatternChange();

	public void setPatterns(List<Pattern> list) {
		this.patternList = list;
		if (list == null) {
			currentPattern = null; //if list is null, then no valid pattern
			guiList.setListData(new String[]{}); //no list item to select
			return;
		}
		ArrayList<String> names = new ArrayList<String>();
		for (Pattern p: list) {
			names.add(p.getName() + " ("+p.getAuthor()+")");
		}	
		guiList.setListData(names.toArray());

		currentPattern = list.get(0); //select first element in list
		guiList.setSelectedIndex(0);  //select first element in guiList
	}

	public Pattern getCurrentPattern() {
		return this.currentPattern;
	}
}
