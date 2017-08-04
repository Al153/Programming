package Exceptions

/**
  * Created by Al on 14/03/2017.
  */
case class SlangTypeError(message: String)
  extends Throwable {
  override def toString: String = message
}
