package uk.ac.cam.at736.oopjava.tick5;
import java.awt.BorderLayout;
import javax.swing.border.Border;
import javax.swing.BorderFactory;
import javax.swing.Box;
import javax.swing.JComponent;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.border.EtchedBorder;
import javax.swing.Timer;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import java.util.*;
import java.io.*;
import java.awt.event.*;
import uk.ac.cam.acr31.life.*;

public class GuiLife extends JFrame {
	PatternPanel patternPanel;
	ControlPanel controlPanel;
	GamePanel gamePanel;
	private World world;
  	private int timeDelay = 500; //time delay
  	private int timeStep = 0;    //progress by 2 ^ timeStep each time 

  	private Timer playTimer = new Timer(timeDelay, new ActionListener() {

   		public void actionPerformed(ActionEvent e) {
   			doTimeStep();
   		}

 	});

	void doTimeStep() {
  		if (world != null) {
    		world = world.nextGeneration(timeStep);
    		gamePanel.display(world);
		}
	}
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
    	controlPanel = new ControlPanel(){
     		protected void onSpeedChange(int value) {
      			playTimer.setDelay(1+(100-value)*10);
     		}

     		protected void onStepChange(int value) {
      			this.timeStep = value;
     		}
    	};
    	addBorder(controlPanel,Strings.PANEL_CONTROL);
    	return controlPanel;
	}
	
	public static void main(String[] args) {
		GuiLife gui = new GuiLife();
		try {
			String url="http://www.cl.cam.ac.uk/teaching/current/OOProg/life.txt";
			List<Pattern> list = PatternLoader.loadFromURL(url);
			gui.patternPanel.setPatterns(list);
			gui.world = gui.controlPanel.initialiseWorld(list.get(1));
			//if (w != null) { System.out.println("w NOT NULL");} else {System.out.println("w NULL");}
			//if (gui.gamePanel != null) { System.out.println("gp NOT NULL");} else {System.out.println("gp NULL");}
	
			gui.gamePanel.display(gui.world);

		} catch (IOException ioe) {
			ioe.printStackTrace();
		} catch (PatternFormatException pfe){
			pfe.printStackTrace();
		}
		gui.playTimer.start();
		gui.setVisible(true);
	}
}