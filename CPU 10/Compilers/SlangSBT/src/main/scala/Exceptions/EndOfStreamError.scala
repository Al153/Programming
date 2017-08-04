package Exceptions

/**
  * Created by Al on 11/03/2017.
  */
case class EndOfStreamError()
  extends  Throwable{
  override def toString: String = "Error: unexpected end of input stream"
}