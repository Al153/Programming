package Exceptions

/**
  * Created by Al on 12/04/2017.
  */
case class ClosureSequenceException() extends Throwable {
  override def toString: String = "Closures were out of order"
}
