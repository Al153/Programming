package uk.ac.cam.at736.AI.ANN;
import java.util.*;

public class Neuron {
	protected double value = 0.0;
	protected ArrayList<Integer> inputs;
	protected ArrayList<Double> weights;
	protected NeuralNetwork nn;

	public Neuron(ArrayList<Integer> i, NeuralNetwork n){
		this.inputs = i;
		this.nn = n;
	}
	public double getValue(){
		return this.value;
	}
	public void setValue(double v){
		this.value = v;
	}
	public void addLink(int i, double w){
		if (i<this.nn.neurons.size()){
			this.inputs.add(i);
			this.weights.add(w);
		} else {
			raise new NeuronError(i);
		}
	}
	public void calculateValue(){
		double v = 0.0;
		for (int i = 0; i<this.inputs.size(); i++){
			this.value += this.nn.neurons.get(this.inputs.get(i)).getValue() * this.weights.get(i);
		}
	}
}