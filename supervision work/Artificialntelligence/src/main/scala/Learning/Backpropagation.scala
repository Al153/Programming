package Learning

import scala.collection.immutable.HashMap

/**
  * Created by Al on 23/05/2017.
  */
object Backpropagation {
  def main(args: Array[String]): Unit ={
    val step = 0.05
    val repeats = 10000
    val neuronCount = 5

    val trainingSet = ParityProblem.createTrainingSet(20)
    printTrainingSet(trainingSet)
    val weights = learn(trainingSet, step, repeats, neuronCount)
    println(weights)
  }

  def calculateValue(neurons: Array[Neuron], weights: WeightVector, outputNeuron: Neuron)(inputs: Array[Double]): Double = {
    for (i <- inputs.indices) {
      neurons(i).setInput(inputs(i))
    }

    for (n <- neurons) {
      n.calculate(neurons, weights)
    }

    outputNeuron.lastZ


  }

  def learn(trainingSet: Array[(Array[Double], Double)], step: Double, repeats: Int, neuronCount: Int): WeightVector = {
    if (trainingSet.length == 0) {
      throw new Exception("Please provide at least one training example")
    }
    var lastError = Double.PositiveInfinity

    var weightVector = BaseWeights.getZeroedWeights(neuronCount)
    val (firstFeatures, _) = trainingSet(0)
    // adds one neuron because neuron 0 is set to input 1.0
    val neurons: Array[Neuron] = createNeurons(firstFeatures.length, neuronCount+1, 1)


    for(i <- 0 until repeats){
      lastError = 0.0
      var weightsDerivativeSum: WeightVector = BaseWeights.getZeroedWeights(neuronCount)
      val calcFun = calculateValue(neurons, weightVector, neurons.last)_

      for ((inputs, y_p) <- trainingSet){

        val output = calcFun(inputs)

        lastError += error(y_p, output)/neuronCount

        val dError = dErrorByDOut(y_p, output)
        val weightsDerivative = getWeightDerivatives(neurons, dError, weightVector)
        // weightVector = weightVector - ( weightsDerivative * step)

        //println(weightsDerivative)
        weightsDerivativeSum = weightsDerivativeSum + weightsDerivative

      }

       // println("Weights:\n"+weightsDerivativeSum)


      weightVector = weightVector - (weightsDerivativeSum * step)

      println("repeat: "+ i + " Error = " + lastError)
    }

    weightVector
  }

  def error(expected: Double, actual: Double): Double = {
    val diff = expected - actual
    0.5*diff * diff
  }

  def dErrorByDOut(expected: Double, actual: Double): Double = {
    actual - expected
  }

  def getWeightDerivatives(neurons: Array[Neuron], dError: Double, weights: WeightVector): WeightVector = {

    var newWeights = new HashMap[(Int,Int), Double]
    val deltas = new Array[Double](neurons.length)
    for (j <- neurons.indices.reverse){
      for (i <- 0 until j){
        val zi: Double = neurons(i).lastZ
        val delta: Double =
          (neurons(j) match {
          case OutputNeuron(_) => dError
          case InputNeuron(_) => {
            var sum = 0.0
            for (k <- neurons.indices){
              sum += deltas(k)*weights(j)(k)
            }
            sum
          }
          case _ => 0.0
        })*neurons(j).lastDerivative

        deltas(j) = delta

        newWeights = newWeights + ((i,j) -> zi*delta)
      }
    }
      new WeightVector(newWeights)
  }

  def createNeurons(inputs: Int, total: Int, outputs: Int): Array[Neuron] ={
    var tempNeurons: List[Neuron] = List()
    for (i <- 0 until total) {
      if (i < inputs) {
        tempNeurons = InputNeuron(i) :: tempNeurons
      } else if(i<total - outputs) {
        tempNeurons = InnerNeuron(i) :: tempNeurons
      } else {
        tempNeurons = OutputNeuron(i) :: tempNeurons
      }
    }

    tempNeurons.reverse.toArray
  }

  def printTrainingSet(set: Array[(Array[Double], Double)]) : Unit = {
    for (test <- set) {
      val (inputs, output) = test
      println("[" + inputs.mkString(", ")  +"] > " + output)
    }
  }
}
