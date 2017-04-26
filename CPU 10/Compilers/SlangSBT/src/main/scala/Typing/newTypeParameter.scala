package Typing

/**
  * Created by Al on 23/04/2017.
  */

object newTypeParameter {
  var typeCounter = 0

  def apply: Int = {
    val result = typeCounter
    typeCounter += 1
    result
  }
}