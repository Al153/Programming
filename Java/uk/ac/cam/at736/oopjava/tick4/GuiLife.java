package uk.ac.cam.at736.oopjava.tick4;
import java.awt.BorderLayout;
import javax.swing.border.Border;
import javax.swing.BorderFactory;
import javax.swing.Box;
import javax.swing.JComponent;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.border.EtchedBorder;
import java.util.*;
import java.io.*;
import uk.ac.cam.acr31.life.*;

public class GuiLife extends JFrame {
	PatternPanel patternPanel;
	ControlPanel controlPanel;
	GamePanel gamePanel;

	public GuiLife() {
		super("GuiLife");
		setSize(640, 480);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setLayout(new BorderLayout());
		JComponent optionsPanel = createOptionsPanel();
		add(optionsPanel, BorderLayout.WEST);
		JComponent gamePanel = createGamePanel();
		add(gamePanel, BorderLayout.CENTER);
	}
	
	private JComponent createOptionsPanel() {
		Box result = Box.createVerticalBox();
		result.add(createSourcePanel());
		result.add(createPatternPanel());
		result.add(createControlPanel());
		return result;
	}
	
	private void addBorder(JComponent component, String title) {
		Border etch = BorderFactory.createEtchedBorder(EtchedBorder.LOWERED);
		Border tb = BorderFactory.createTitledBorder(etch,title);
		component.setBorder(tb);
	}
	
	private JComponent createGamePanel() {
		JPanel holder = new JPanel();
		addBorder(holder,Strings.PANEL_GAMEVIEW);
		this.gamePanel = new GamePanel();
		holder.add(this.gamePanel);
		return new JScrollPane(holder);
	}
	
	private JComponent createSourcePanel() {
		JPanel result = new SourcePanel();	
		addBorder(result,Strings.PANEL_SOURCE);
		return result;
	}
	
	private JComponent createPatternPanel() { 
		this.patternPanel = new PatternPanel();
		addBorder(this.patternPanel,Strings.PANEL_PATTERN);
		return this.patternPanel;
	}
	
	private JComponent createControlPanel() {
		this.controlPanel = new ControlPanel();
		addBorder(this.controlPanel, Strings.PANEL_CONTROL);
		return this.controlPanel;
	}
	
	public static void main(String[] args) {
		GuiLife gui = new GuiLife();
		try {
			String url="http://www.cl.cam.ac.uk/teaching/current/OOProg/life.txt";
			List<Pattern> list = PatternLoader.loadFromURL(url);
			gui.patternPanel.setPatterns(list);
			World w = gui.controlPanel.initialiseWorld(list.get(1));
			//if (w != null) { System.out.println("w NOT NULL");} else {System.out.println("w NULL");}
			//if (gui.gamePanel != null) { System.out.println("gp NOT NULL");} else {System.out.println("gp NULL");}
	
			gui.gamePanel.display(w);

		} catch (IOException ioe) {
			ioe.printStackTrace();
		} catch (PatternFormatException pfe){
			pfe.printStackTrace();
		}
		gui.setVisible(true);
	}
}