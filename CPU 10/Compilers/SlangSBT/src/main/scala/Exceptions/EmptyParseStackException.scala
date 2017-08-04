package Exceptions

/**
  * Created by Al on 11/03/2017.
  */
case class EmptyParseStackException()
  extends Throwable{
  override def toString: String = "Error, parse stack is empty"
}