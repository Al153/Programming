package uk.ac.cam.at736.oopjava.tick5;
import java.util.*;
import java.io.*;
import javax.swing.*;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import java.awt.BorderLayout;
import uk.ac.cam.acr31.life.World;
import uk.ac.cam.acr31.life.WorldViewer;
import java.awt.event.*;

public abstract class ControlPanel extends JPanel {
	private JSlider zoomSlider;
	private JSlider stepSlider;
	private JSlider speedSlider;
	private JRadioButton longButton;
	private JRadioButton arrayButton;
	private JRadioButton agingButton;

	private JSlider createNewSlider(int min, int max, int start, String s) {
		Box panel = Box.createHorizontalBox();
		add(panel);
		panel.add(new JLabel(s));
		JSlider slider = new JSlider(min,max,start);
		panel.add(slider);
		return slider;
	}
	private JRadioButton createNewButton(String s, ButtonGroup g, Box b) {
		JRadioButton sButton = new JRadioButton(s,true);
		g.add(sButton);
		b.add(sButton);
		return sButton;
	}
	protected abstract void onSpeedChange(int value);
	protected abstract void onStepChange(int value);

	public ControlPanel() {
		super();
		setLayout(new BoxLayout(this,BoxLayout.Y_AXIS));
		zoomSlider = createNewSlider(1,20,1,Strings.CONTROL_ZOOM);
		add(Box.createVerticalStrut(10)); //add 10px of extra space
		stepSlider = createNewSlider(0,10,0,Strings.CONTROL_STEP);
		add(Box.createVerticalStrut(10)); //add 10px of extra space
		speedSlider = createNewSlider(0,100,0,Strings.CONTROL_SPEED);
		speedSlider.addChangeListener(new ChangeListener() {
			public void stateChanged(ChangeEvent e) {
				if (!speedSlider.getValueIsAdjusting())
					onSpeedChange(speedSlider.getValue());
				if (!stepSlider.getValueIsAdjusting())
					onStepChange(stepSlider.getValue());
			}
		});
		add(Box.createVerticalStrut(10)); //add 10px of extra space	
		Box worldPanel = Box.createHorizontalBox();
		add(worldPanel);
		worldPanel.add(new JLabel(Strings.STORAGE_WORLD_TYPE));
		ButtonGroup group = new ButtonGroup();
		longButton = createNewButton(Strings.STORAGE_LONG,group,worldPanel);
		arrayButton = createNewButton(Strings.STORAGE_ARRAY,group,worldPanel);
		agingButton = createNewButton(Strings.STORAGE_AGING,group,worldPanel);
		arrayButton.setSelected(true);
		add(Box.createVerticalStrut(10)); //add 10px of extra space
	}

	public World initialiseWorld(Pattern p) throws PatternFormatException {
		//System.out.println("REMEMBER TO REMOVE THIS LINE IN CONTROLPANEL.JAVA");
		
		//World result = new ArrayWorld(p.getWidth(),p.getHeight()); 
		World result = null;
		if (longButton.isSelected()) {
			result = new PackedWorld();
		} else if (arrayButton.isSelected()) {
			result = new ArrayWorld(p.getWidth(),p.getHeight());
		} else if (agingButton.isSelected()) {
			result = new AgingWorld(p.getWidth(),p.getHeight());
		} 
		if (result != null) p.initialise(result);
		return result;
	}
}