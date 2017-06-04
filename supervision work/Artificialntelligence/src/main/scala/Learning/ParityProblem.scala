package Learning

import scala.util.Random

/**
  * Created by Al on 23/05/2017.
  */
object ParityProblem {
  val r = Random

  def createTrainingSet(n: Int): Array[(Array[Double], Double)] = {
    val set = new Array[(Array[Double], Double)](n)

    for (i <- 0 until n) {
      val in1 = r.nextBoolean()
      val in2 = r.nextBoolean()
      val result = toCleanDouble(in1 ^ in2)
      val testCase: Array[Double] = Array(1.0, toNoisyDouble(in1), toNoisyDouble(in2))
      set(i) = (testCase, result)
    }
    set
  }

  private def toNoisyDouble(b: Boolean): Double = {
    toCleanDouble(b) + r.nextGaussian()*0.1
  }

  private def toCleanDouble(b: Boolean): Double = if (b) 1.0 else -1.0
}
