package Exceptions

/**
  * Created by Al on 11/03/2017.
  */
case class SlangSyntaxError(message: String)  extends Throwable{
  override def toString: String = message
}