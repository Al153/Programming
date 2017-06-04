package Learning

/**
  * Created by Al on 23/05/2017.
  */
sealed abstract class Neuron(var index: Int) {
  var lastA: Double = 0.0 // before activation fn
  var lastZ: Double = 0.0 // after activation fn
  var lastDerivative: Double = 0.0

  def calculate(neurons: Array[Neuron], weights: WeightVector): Unit
  def setInput(v: Double): Unit = throw new Exception("Error: assigned input to a non-input neuron")// dummy in most subclasses

  protected def sigma(z: Double) : Double = {
    1.0 / (1.0 + Math.exp(-z))
  }

  protected def sigmaPrime(z: Double) : Double = {
    val s = sigma(z)
    s*(1.0-s)
  }
}

case class InnerNeuron(i: Int) extends Neuron(i) {

  override def calculate(neurons: Array[Neuron], weights: WeightVector): Unit ={
    lastA = 0
    for (i <- neurons.indices){
      lastA += neurons(i).lastZ * weights(i)(index)
    }
    lastZ = sigma(lastA)
    lastDerivative = sigmaPrime(lastA)
  }
}


case class InputNeuron(i: Int) extends Neuron(i){
  private var inputValue: Double = 0.0

  override def setInput(v: Double): Unit = inputValue = v

  override def calculate(neurons: Array[Neuron], weights: WeightVector): Unit = {
    lastA = inputValue
    lastZ = sigma(inputValue)
    lastDerivative = sigmaPrime(inputValue)
  }
}

case class OutputNeuron(i: Int) extends  Neuron(i) {

  override def calculate(neurons: Array[Neuron], weights: WeightVector): Unit ={
    lastA = 0
    for (i <- neurons.indices){
      lastA += neurons(i).lastZ * weights(i)(index)
    }
    lastZ = sigma(lastA)
    lastDerivative = sigmaPrime(lastA)
  }
}