package Learning

import scala.collection.immutable.HashMap

/**
  * Created by Al on 23/05/2017.
  */
class WeightVector(val weights: Map[(Int, Int), Double]) {
  def apply(i: Int): Int => Double = (j: Int) =>
    if (i<j && weights.contains(i, j)) {
        weights((i,j))
      } else {
        0.0
      }


  def *(n: Double): WeightVector = {
    new WeightVector(weights.mapValues((x: Double) => x*n))
  }

  def +(that: WeightVector): WeightVector = {
    var newWeights = new HashMap[(Int,Int), Double]
    for ((i,j) <- this.weights.keys){
        newWeights = newWeights + ( (i,j) -> (this(i)(j) + that(i)(j)))
    }

    for ((i,j) <- that.weights.keys){
      if (!this.weights.contains((i,j))){
        newWeights = newWeights + ( (i,j) -> (this(i)(j) + that(i)(j)))
      }
    }

    new WeightVector(newWeights)
  }

  def -(that: WeightVector): WeightVector = {
    var newWeights = new HashMap[(Int,Int), Double]
    for ((i,j) <- this.weights.keys){
      newWeights = newWeights + ( (i,j) -> (this(i)(j) - that(i)(j)))
    }

    for ((i,j) <- that.weights.keys){
      if (!this.weights.contains((i,j))){
        newWeights = newWeights + ( (i,j) -> (this(i)(j) - that(i)(j)))
      }
    }

    new WeightVector(newWeights)
  }

  override def toString: String = {
    var str = ""
    for ((i,j) <- weights.keys){
      str += "W("+ i+ "->"+ j +") = " + weights(i,j) + "\n"
    }
    str
  }
}

object BaseWeights{
  def getZeroedWeights(max: Int): WeightVector ={
    var weights = new HashMap[(Int,Int), Double]
    for (j: Int <- 0 until max){
      for (i: Int <- 0 until j){
        weights = weights + ((i,j)-> 0.0)
      }
    }

    new WeightVector(weights)
  }
}
